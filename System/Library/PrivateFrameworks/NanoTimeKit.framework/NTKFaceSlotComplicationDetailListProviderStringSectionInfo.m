@implementation NTKFaceSlotComplicationDetailListProviderStringSectionInfo

- (NTKFaceSlotComplicationDetailListProviderStringSectionInfo)initWithGroupName:(id)a3
{
  id v4;
  NTKFaceSlotComplicationDetailListProviderStringSectionInfo *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKFaceSlotComplicationDetailListProviderStringSectionInfo;
  v5 = -[NTKFaceSlotComplicationDetailListProviderStringSectionInfo init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E6BDC918;
    objc_storeStrong((id *)&v5->_groupName, v8);

  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_groupName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "groupName");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v5 == self->_groupName)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v4, "groupName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", self->_groupName);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)ntk_identifier
{
  return self->_groupName;
}

- (NSString)ntk_localizedSectionName
{
  return self->_groupName;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
}

@end
