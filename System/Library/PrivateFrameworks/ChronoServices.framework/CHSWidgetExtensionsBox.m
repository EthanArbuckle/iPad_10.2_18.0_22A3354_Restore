@implementation CHSWidgetExtensionsBox

- (CHSWidgetExtensionsBox)initWithExtensions:(id)a3
{
  return -[CHSWidgetExtensionsBox initWithExtensions:generatedFrom:](self, "initWithExtensions:generatedFrom:", a3, 0);
}

- (CHSWidgetExtensionsBox)initWithExtensions:(id)a3 generatedFrom:(id)a4
{
  id v6;
  id v7;
  CHSWidgetExtensionsBox *v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CHSWidgetExtensionsBox;
  v8 = -[CHSWidgetExtensionsBox init](&v10, sel_init);
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sequenceLock);
    ++lock_sequenceNumber;
    -[CHSWidgetExtensionsBox setSequenceNumber:](v8, "setSequenceNumber:");
    os_unfair_lock_unlock((os_unfair_lock_t)&sequenceLock);
    -[CHSWidgetExtensionsBox setOptions:](v8, "setOptions:", v7);
    -[CHSWidgetExtensionsBox setExtensions:](v8, "setExtensions:", v6);
  }

  return v8;
}

- (void)prepareForEncoding
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_18FB18000, log, OS_LOG_TYPE_ERROR, "Error encoding %@: %{public}@", buf, 0x16u);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSWidgetExtensionsBox)initWithCoder:(id)a3
{
  id v4;
  CHSWidgetExtensionsBox *v5;
  CHSWidgetExtensionsBox *v6;
  uint64_t v7;
  CHSWidgetExtensionProviderOptions *options;
  void *v9;
  id *p_isa;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CHSWidgetExtensionsBox;
  v5 = -[CHSWidgetExtensionsBox init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_sequenceNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sequence"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("options")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
      v7 = objc_claimAutoreleasedReturnValue();
      options = v5->_options;
      v5->_options = (CHSWidgetExtensionProviderOptions *)v7;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("data")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0D87610], "decodeObjectOfClass:fromData:error:", objc_opt_class(), v9, &v16);
      p_isa = (id *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      if (v11)
      {
        objc_msgSend(v4, "failWithError:", v11);
      }
      else if (p_isa)
      {
        objc_storeStrong((id *)&v5->_extensions, p_isa[2]);
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      v13 = objc_opt_class();
      objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("extensions"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
      v14 = objc_claimAutoreleasedReturnValue();
      p_isa = (id *)&v6->_extensions->super.isa;
      v6->_extensions = (NSSet *)v14;
    }

    goto LABEL_12;
  }
LABEL_13:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *archivedData;
  void *v6;
  CHSWidgetExtensionProviderOptions *options;
  id v8;

  v4 = a3;
  archivedData = self->_archivedData;
  v8 = v4;
  if (archivedData)
  {
    objc_msgSend(v4, "encodeObject:forKey:", archivedData, CFSTR("data"));
  }
  else
  {
    -[NSSet allObjects](self->_extensions, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("extensions"));

  }
  objc_msgSend(v8, "encodeInteger:forKey:", self->_sequenceNumber, CFSTR("sequence"));
  options = self->_options;
  if (options)
    objc_msgSend(v8, "encodeObject:forKey:", options, CFSTR("options"));

}

- (NSSet)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CHSWidgetExtensionProviderOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_archivedData, 0);
}

@end
