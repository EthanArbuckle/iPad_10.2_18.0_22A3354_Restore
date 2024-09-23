@implementation VSBindingInfo

- (VSBindingInfo)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSBindingInfo)initWithObservedObject:(id)a3 keyPath:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  VSBindingInfo *v11;
  VSBindingInfo *v12;
  uint64_t v13;
  NSString *keyPath;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  NSValueTransformer *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  NSValueTransformer *v28;
  NSValueTransformer *v29;
  uint64_t v30;
  NSDictionary *options;
  NSValueTransformer *valueTransformer;
  NSValueTransformer *v33;
  objc_super v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The keyPath parameter must not be nil."));
    if (v10)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The observedObject parameter must not be nil."));
  if (!v9)
    goto LABEL_11;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The options parameter must not be nil."));
LABEL_4:
  v35.receiver = self;
  v35.super_class = (Class)VSBindingInfo;
  v11 = -[VSBindingInfo init](&v35, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_unsafeObservedObject = v8;
    objc_storeWeak(&v11->_weakObservedObject, v8);
    v13 = objc_msgSend(v9, "copy");
    keyPath = v12->_keyPath;
    v12->_keyPath = (NSString *)v13;

    objc_msgSend(v10, "objectForKey:", CFSTR("VSValueTransformerBindingOption"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v18 = (void *)MEMORY[0x1E0C99DA0];
          v19 = *MEMORY[0x1E0C99778];
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "raise:format:", v19, CFSTR("Unexpectedly, transformerOption was %@, instead of NSValueTransformer."), v21);

        }
        v22 = (NSValueTransformer *)v17;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = (void *)MEMORY[0x1E0CB3B20];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v24 = (void *)MEMORY[0x1E0C99DA0];
            v25 = *MEMORY[0x1E0C99778];
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "raise:format:", v25, CFSTR("Unexpectedly, transformerOption was %@, instead of NSString."), v27);

          }
          objc_msgSend(v23, "valueTransformerForName:", v17);
          v28 = (NSValueTransformer *)objc_claimAutoreleasedReturnValue();
          v22 = v28;
          if (v28)
            v29 = v28;
          else
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("There is no value transformer named '%@'."), v17);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid value transformer option %@"), v17);
          v22 = 0;
        }
      }

    }
    else
    {
      v22 = 0;
    }
    v30 = objc_msgSend(v10, "copy");
    options = v12->_options;
    v12->_options = (NSDictionary *)v30;

    valueTransformer = v12->_valueTransformer;
    v12->_valueTransformer = v22;
    v33 = v22;

  }
  return v12;
}

- (void)setValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[VSBindingInfo valueTransformer](self, "valueTransformer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v9;
  if (v4)
  {
    objc_msgSend(v4, "reverseTransformedValue:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[VSBindingInfo weakObservedObject](self, "weakObservedObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSBindingInfo keyPath](self, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKeyPath:", v6, v8);

}

- (id)value
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[VSBindingInfo weakObservedObject](self, "weakObservedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSBindingInfo keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSBindingInfo valueTransformer](self, "valueTransformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "transformedValue:", v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v5;
}

- (void)requireExpectedConcurrency
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;

  -[VSBindingInfo weakObservedObject](self, "weakObservedObject");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[VSBindingInfo options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("VSRequiredThreadBindingOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99768];
      -[VSBindingInfo keyPath](self, "keyPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "raise:format:", v7, CFSTR("Binding observing keyPath %@ on object %@ used on thread %@ instead of required thread %@"), v8, v18, v5, v4);

    }
  }
  -[VSBindingInfo options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("VSRequiredOperationQueueBindingOption"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqual:", v11) & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99768];
      -[VSBindingInfo keyPath](self, "keyPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "raise:format:", v14, CFSTR("Binding observing keyPath %@ on object %@ used on operation queue %@ instead of required operation queue %@"), v15, v18, v12, v11);

    }
  }
  -[VSBindingInfo options](self, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("VSRequiredDispatchQueueBindingOption"));
  v17 = objc_claimAutoreleasedReturnValue();

  if (v17)
    dispatch_assert_queue_V2(v17);

}

- (id)unsafeObservedObject
{
  return self->_unsafeObservedObject;
}

- (id)weakObservedObject
{
  return objc_loadWeakRetained(&self->_weakObservedObject);
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSValueTransformer)valueTransformer
{
  return self->_valueTransformer;
}

- (void)setValueTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_valueTransformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTransformer, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_destroyWeak(&self->_weakObservedObject);
}

@end
