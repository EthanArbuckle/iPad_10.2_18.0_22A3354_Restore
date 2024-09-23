@implementation CHSConfiguredWidgetContainerDescriptorsBox

- (CHSConfiguredWidgetContainerDescriptorsBox)initWithDescriptors:(id)a3
{
  id v4;
  CHSConfiguredWidgetContainerDescriptorsBox *v5;
  uint64_t v6;
  NSArray *descriptors;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSConfiguredWidgetContainerDescriptorsBox;
  v5 = -[CHSConfiguredWidgetContainerDescriptorsBox init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_descriptors, CFSTR("descriptors"));
}

- (CHSConfiguredWidgetContainerDescriptorsBox)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CHSConfiguredWidgetContainerDescriptorsBox *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("descriptors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __60__CHSConfiguredWidgetContainerDescriptorsBox_initWithCoder___block_invoke(v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    self = -[CHSConfiguredWidgetContainerDescriptorsBox initWithDescriptors:](self, "initWithDescriptors:", v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __60__CHSConfiguredWidgetContainerDescriptorsBox_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v10;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }

    v7 = v3;
  }
  else
  {
LABEL_12:
    v7 = 0;
  }

  return v7;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptors, 0);
}

@end
