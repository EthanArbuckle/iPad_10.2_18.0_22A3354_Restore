@implementation HULinkedApplicationLibraryItem

- (HULinkedApplicationLibraryItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithApplicationProxy_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULinkedApplicationItem.m"), 133, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULinkedApplicationLibraryItem init]",
    v5);

  return 0;
}

- (HULinkedApplicationLibraryItem)initWithApplicationProxy:(id)a3
{
  id v5;
  HULinkedApplicationLibraryItem *v6;
  HULinkedApplicationLibraryItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HULinkedApplicationLibraryItem;
  v6 = -[HULinkedApplicationItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_applicationProxy, a3);

  return v7;
}

- (HULinkedApplicationLibraryItem)initWithApplicationProxy:(id)a3 associatedAccessories:(id)a4
{
  id v6;
  HULinkedApplicationLibraryItem *v7;
  HULinkedApplicationLibraryItem *v8;

  v6 = a4;
  v7 = -[HULinkedApplicationLibraryItem initWithApplicationProxy:](self, "initWithApplicationProxy:", a3);
  v8 = v7;
  if (v7)
    -[HULinkedApplicationItem setAssociatedAccessories:](v7, "setAssociatedAccessories:", v6);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HULinkedApplicationLibraryItem applicationProxy](self, "applicationProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationItem associatedAccessories](self, "associatedAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithApplicationProxy:associatedAccessories:", v5, v6);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  -[HULinkedApplicationLibraryItem applicationProxy](self, "applicationProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HULinkedApplicationLibraryItem;
  -[HULinkedApplicationItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6F52070;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke_2;
  v17[3] = &unk_1E6F53720;
  v17[4] = *(_QWORD *)(a1 + 32);
  v17[5] = v6;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke_4;
  v13[3] = &unk_1E6F59C40;
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v15 = v9;
  v16 = v6;
  v10 = v3;
  objc_msgSend(v8, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D3A820]);
  objc_msgSend(*(id *)(a1 + 32), "applicationProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResourceProxy:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 60.0, 60.0, *(double *)(a1 + 40));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke_3;
  v9[3] = &unk_1E6F59C18;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v6, "getImageForImageDescriptor:completion:", v7, v9);

}

uint64_t __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

id __62__HULinkedApplicationLibraryItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "applicationProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "applicationProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vendorName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "applicationProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hf_isInstalledForLaunching");

  v12 = (void *)MEMORY[0x1E0CEA638];
  v13 = objc_msgSend(v4, "CGImage");

  objc_msgSend(v12, "imageWithCGImage:scale:orientation:", v13, 0, *(double *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 40);
  if (v7 && v14)
  {
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("HFResultApplicationBundleIdentifier"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30D18]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("HFResultApplicationPublisher"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("HFResultApplicationIsInstalled"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30C70]);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v15, "_failedUpdateOutcome");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;

  return v19;
}

- (LSApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationProxy, 0);
}

@end
