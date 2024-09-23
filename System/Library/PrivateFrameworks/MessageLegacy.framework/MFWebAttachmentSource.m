@implementation MFWebAttachmentSource

+ (id)_setOfAllSources
{
  if (_setOfAllSources_onceToken != -1)
    dispatch_once(&_setOfAllSources_onceToken, &__block_literal_global_21);
  return (id)_setOfAllSources_sAllWebAttachmentSources;
}

id __41__MFWebAttachmentSource__setOfAllSources__block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0D46160]);
  _setOfAllSources_sAllWebAttachmentSources = (uint64_t)result;
  return result;
}

+ (id)allSources
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_setOfAllSources"), "allObjects"), "sortedArrayUsingFunction:context:", _SortWebAttachmentSources, 0);
}

- (MFWebAttachmentSource)init
{
  MFWebAttachmentSource *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFWebAttachmentSource;
  v2 = -[MFWebAttachmentSource init](&v4, sel_init);
  if (v2)
  {
    v2->_attachmentsLock = (MFLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("MFWebAttachmentSource_AttachmentLock"), v2);
    v2->_attachmentsByURL = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_setOfAllSources"), "addObject:", v2);
  }
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>, attachments=%@"), NSStringFromClass(v4), self, -[NSMutableDictionary description](self->_attachmentsByURL, "description"));
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_setOfAllSources"), "removeObject:", self);

  v3.receiver = self;
  v3.super_class = (Class)MFWebAttachmentSource;
  -[MFWebAttachmentSource dealloc](&v3, sel_dealloc);
}

- (id)attachmentForURL:(id)a3
{
  id v5;

  if (!a3)
    return 0;
  -[MFLock lock](self->_attachmentsLock, "lock");
  v5 = (id)-[NSMutableDictionary objectForKey:](self->_attachmentsByURL, "objectForKey:", a3);
  -[MFLock unlock](self->_attachmentsLock, "unlock");
  return v5;
}

- (BOOL)setAttachment:(id)a3 forURL:(id)a4
{
  -[MFLock lock](self->_attachmentsLock, "lock");
  -[NSMutableDictionary setObject:forKey:](self->_attachmentsByURL, "setObject:forKey:", a3, a4);
  -[MFLock unlock](self->_attachmentsLock, "unlock");
  return 1;
}

- (void)removeAttachmentForURL:(id)a3
{
  -[MFLock lock](self->_attachmentsLock, "lock");
  -[NSMutableDictionary removeObjectForKey:](self->_attachmentsByURL, "removeObjectForKey:", a3);
  -[MFLock unlock](self->_attachmentsLock, "unlock");
}

@end
