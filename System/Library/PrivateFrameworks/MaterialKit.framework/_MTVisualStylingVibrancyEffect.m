@implementation _MTVisualStylingVibrancyEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyling, 0);
}

- (_MTVisualStylingVibrancyEffect)initWithVisualStyling:(id)a3
{
  id v5;
  _MTVisualStylingVibrancyEffect *v6;
  _MTVisualStylingVibrancyEffect *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MTVisualStylingVibrancyEffect;
  v6 = -[UIVibrancyEffect init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_visualStyling, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_MTVisualStylingVibrancyEffect initWithVisualStyling:]([_MTVisualStylingVibrancyEffect alloc], "initWithVisualStyling:", self->_visualStyling);
}

- (id)effectConfig
{
  void *v2;
  void *v3;

  -[MTVisualStyling _layerConfig](self->_visualStyling, "_layerConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF7180], "configWithContentConfig:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_MTVisualStylingVibrancyEffect)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _MTVisualStylingVibrancyEffect *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("visualStyleSetName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTVisualStylingProvider _visualStylingProviderForStyleSetNamed:inBundle:](MTVisualStylingProvider, "_visualStylingProviderForStyleSetNamed:inBundle:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("visualStyleName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_visualStylingForStyleNamed:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_MTVisualStylingVibrancyEffect initWithVisualStyling:](self, "initWithVisualStyling:", v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  MTVisualStyling *visualStyling;
  id v5;
  void *v6;
  id v7;

  visualStyling = self->_visualStyling;
  v5 = a3;
  -[MTVisualStyling visualStyleSetName](visualStyling, "visualStyleSetName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("visualStyleSetName"));

  -[MTVisualStyling visualStyleName](self->_visualStyling, "visualStyleName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("visualStyleName"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTVisualStyling visualStyleSetName](self->_visualStyling, "visualStyleSetName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __42___MTVisualStylingVibrancyEffect_isEqual___block_invoke;
  v19[3] = &unk_24C3DBAB8;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v19);

  -[MTVisualStyling visualStyleName](self->_visualStyling, "visualStyleName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v15 = 3221225472;
  v16 = __42___MTVisualStylingVibrancyEffect_isEqual___block_invoke_2;
  v17 = &unk_24C3DBAB8;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, &v14);

  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);
  return (char)v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTVisualStyling visualStyleSetName](self->_visualStyling, "visualStyleSetName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[MTVisualStyling visualStyleName](self->_visualStyling, "visualStyleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = objc_msgSend(v3, "hash");
  return v8;
}

- (MTVisualStyling)_visualStyling
{
  return self->_visualStyling;
}

@end
