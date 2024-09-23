@implementation MFWebAttachmentSource

+ (id)_setOfAllSources
{
  if (_setOfAllSources_onceToken != -1)
    dispatch_once(&_setOfAllSources_onceToken, &__block_literal_global_61);
  return (id)_setOfAllSources_sAllWebAttachmentSources;
}

void __41__MFWebAttachmentSource__setOfAllSources__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D46160]);
  v1 = (void *)_setOfAllSources_sAllWebAttachmentSources;
  _setOfAllSources_sAllWebAttachmentSources = (uint64_t)v0;

}

+ (id)allSources
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_setOfAllSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingFunction:context:", _SortWebAttachmentSources, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (MFWebAttachmentSource)init
{
  MFWebAttachmentSource *v2;
  uint64_t v3;
  MFLock *attachmentsLock;
  NSMutableDictionary *v5;
  NSMutableDictionary *attachmentsByURL;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFWebAttachmentSource;
  v2 = -[MFWebAttachmentSource init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("MFWebAttachmentSource_AttachmentLock"), v2);
    attachmentsLock = v2->_attachmentsLock;
    v2->_attachmentsLock = (MFLock *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attachmentsByURL = v2->_attachmentsByURL;
    v2->_attachmentsByURL = v5;

    objc_msgSend((id)objc_opt_class(), "_setOfAllSources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v2);

  }
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary description](self->_attachmentsByURL, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>, attachments=%@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend((id)objc_opt_class(), "_setOfAllSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  v4.receiver = self;
  v4.super_class = (Class)MFWebAttachmentSource;
  -[MFWebAttachmentSource dealloc](&v4, sel_dealloc);
}

- (id)attachmentForURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[MFLock lock](self->_attachmentsLock, "lock");
    -[NSMutableDictionary objectForKeyedSubscript:](self->_attachmentsByURL, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFLock unlock](self->_attachmentsLock, "unlock");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)setAttachment:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  -[MFLock lock](self->_attachmentsLock, "lock");
  -[NSMutableDictionary setObject:forKey:](self->_attachmentsByURL, "setObject:forKey:", v6, v7);
  -[MFLock unlock](self->_attachmentsLock, "unlock");

  return 1;
}

- (void)removeAttachmentForURL:(id)a3
{
  id v4;

  v4 = a3;
  -[MFLock lock](self->_attachmentsLock, "lock");
  -[NSMutableDictionary removeObjectForKey:](self->_attachmentsByURL, "removeObjectForKey:", v4);
  -[MFLock unlock](self->_attachmentsLock, "unlock");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsByURL, 0);
  objc_storeStrong((id *)&self->_attachmentsLock, 0);
}

@end
