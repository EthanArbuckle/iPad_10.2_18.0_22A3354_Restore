@implementation AVMediaSelectionNilOption

- (AVMediaSelectionNilOption)initWithGroup:(id)a3
{
  AVMediaSelectionNilOption *v4;
  AVMediaSelectionNilOption *v5;
  void *v6;
  void *v7;
  id groupMediaType;
  id groupID;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVMediaSelectionNilOption;
  v4 = -[AVMediaSelectionOption initWithGroup:](&v11, sel_initWithGroup_);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_groupID = (id)objc_msgSend(a3, "_groupID");
      v5->_groupMediaType = (id)objc_msgSend((id)objc_msgSend(a3, "_groupMediaType"), "copy");
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = v6;
      groupMediaType = v5->_groupMediaType;
      if (groupMediaType)
        objc_msgSend(v6, "setObject:forKey:", groupMediaType, *MEMORY[0x1E0CC5E98]);
      groupID = v5->_groupID;
      if (groupID)
        objc_msgSend(v7, "setObject:forKey:", groupID, *MEMORY[0x1E0CC5E88]);
      v5->_dictionary = (NSDictionary *)objc_msgSend(v7, "copy");
      v5->_weakReferenceToGroup = (AVWeakReference *)(id)objc_msgSend(a3, "_weakReference");
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (id)dictionary
{
  return self->_dictionary;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMediaSelectionNilOption;
  -[AVMediaSelectionOption dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[NSDictionary isEqual:](self->_dictionary, "isEqual:", objc_msgSend(a3, "dictionary"));
  else
    return 0;
}

- (id)group
{
  return -[AVWeakReference referencedObject](self->_weakReferenceToGroup, "referencedObject");
}

- (id)_groupID
{
  return self->_groupID;
}

- (id)_groupMediaType
{
  return self->_groupMediaType;
}

- (BOOL)isPlayable
{
  return 0;
}

- (BOOL)_representsNilSelection
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nil selection option for the following group: %@"), -[AVMediaSelectionNilOption group](self, "group"));
}

@end
