@implementation MFQuotedContentAttribution

- (MFQuotedContentAttribution)initWithType:(int64_t)a3 senderName:(id)a4
{
  id v7;
  void *v8;
  _BOOL4 v10;
  MFQuotedContentAttribution *v11;
  MFQuotedContentAttribution *v12;
  uint64_t v13;
  NSString *senderName;
  void *v16;
  objc_super v17;

  v7 = a4;
  v8 = v7;
  v10 = (unint64_t)a3 > 1 || v7 != 0;
  if (a3 != 2 && v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFQuotedContentAttribution.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(type == MFQuotedContentAttributionTypeUnknown && senderName == nil) || (type == MFQuotedContentAttributionTypeNone && senderName == nil) || (type == MFQuotedContentAttributionTypeSender)"));

  }
  v17.receiver = self;
  v17.super_class = (Class)MFQuotedContentAttribution;
  v11 = -[MFQuotedContentAttribution init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v13 = objc_msgSend(v8, "copy");
    senderName = v12->_senderName;
    v12->_senderName = (NSString *)v13;

  }
  return v12;
}

+ (MFQuotedContentAttribution)unknownAttribution
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MFQuotedContentAttribution_unknownAttribution__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unknownAttribution_onceToken != -1)
    dispatch_once(&unknownAttribution_onceToken, block);
  return (MFQuotedContentAttribution *)(id)unknownAttribution_unknownAttribution;
}

void __48__MFQuotedContentAttribution_unknownAttribution__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithType:senderName:", 0, 0);
  v2 = (void *)unknownAttribution_unknownAttribution;
  unknownAttribution_unknownAttribution = v1;

}

+ (MFQuotedContentAttribution)noAttribution
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MFQuotedContentAttribution_noAttribution__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (noAttribution_onceToken != -1)
    dispatch_once(&noAttribution_onceToken, block);
  return (MFQuotedContentAttribution *)(id)noAttribution_noAttribution;
}

void __43__MFQuotedContentAttribution_noAttribution__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithType:senderName:", 1, 0);
  v2 = (void *)noAttribution_noAttribution;
  noAttribution_noAttribution = v1;

}

+ (id)attributionWithSenderName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:senderName:", 2, v4);

  return v5;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[MFQuotedContentAttribution type](self, "type");
  if (v5 > 2)
    v6 = 0;
  else
    v6 = off_1E9A03D68[v5];
  -[MFQuotedContentAttribution senderName](self, "senderName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p (Type: %@, Sender Name: %@>"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderName, 0);
}

@end
