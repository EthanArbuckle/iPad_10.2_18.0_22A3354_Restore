@implementation CPContactTemplate

- (CPContactTemplate)initWithContact:(CPContact *)contact
{
  CPContact *v5;
  CPContactTemplate *v6;
  CPContactTemplate *v7;
  objc_super v9;

  v5 = contact;
  v9.receiver = self;
  v9.super_class = (Class)CPContactTemplate;
  v6 = -[CPTemplate init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, contact);
    -[CPContact setAssociatedTemplate:](v7->_contact, "setAssociatedTemplate:", v7);
  }

  return v7;
}

- (id)entity
{
  void *v2;
  void *v3;

  -[CPContactTemplate contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPContactTemplate)initWithCoder:(id)a3
{
  id v4;
  CPContactTemplate *v5;
  uint64_t v6;
  CPContact *contact;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPContactTemplate;
  v5 = -[CPTemplate initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPEntity"));
    v6 = objc_claimAutoreleasedReturnValue();
    contact = v5->_contact;
    v5->_contact = (CPContact *)v6;

    -[CPContact setAssociatedTemplate:](v5->_contact, "setAssociatedTemplate:", v5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPContactTemplate;
  v4 = a3;
  -[CPTemplate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CPContactTemplate contact](self, "contact", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CPEntity"));

}

- (void)setContact:(CPContact *)contact
{
  CPContact **p_contact;
  CPContact *v6;

  p_contact = &self->_contact;
  v6 = contact;
  if (!-[CPContact isEqual:](*p_contact, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_contact, contact);
    -[CPContact setAssociatedTemplate:](*p_contact, "setAssociatedTemplate:", self);
    -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate");
  }

}

- (void)performUpdate
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPContactTemplate;
  -[CPTemplate performUpdate](&v8, sel_performUpdate);
  objc_initWeak(&location, self);
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__CPContactTemplate_performUpdate__block_invoke;
  v5[3] = &unk_24C77DA98;
  objc_copyWeak(&v6, &location);
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __34__CPContactTemplate_performUpdate__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "updateEntityTemplate:withProxyDelegate:", WeakRetained, WeakRetained);

}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__CPContactTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __54__CPContactTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
    CarPlayFrameworkGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v11 = v6;
      v12 = 2112;
      v13 = v4;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    objc_msgSend(v4, "handlePrimaryAction");
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9.receiver = *(id *)(a1 + 32);
    v9.super_class = (Class)CPContactTemplate;
    objc_msgSendSuper2(&v9, sel_handleActionForControlIdentifier_, v8);
  }

}

- (BOOL)control:(id)a3 setEnabled:(BOOL)a4
{
  -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate", a3, a4);
  return 1;
}

- (BOOL)control:(id)a3 setSelected:(BOOL)a4
{
  -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate", a3, a4);
  return 1;
}

- (CPContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
