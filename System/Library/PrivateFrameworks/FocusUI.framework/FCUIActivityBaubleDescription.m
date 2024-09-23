@implementation FCUIActivityBaubleDescription

- (FCUIActivityBaubleDescription)initWithSystemImageName:(id)a3 tintColor:(id)a4
{
  id v7;
  id v8;
  FCUIActivityBaubleDescription *v9;
  FCUIActivityBaubleDescription *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCUIActivityBaubleDescription;
  v9 = -[FCUIActivityBaubleDescription init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemImageName, a3);
    objc_storeStrong((id *)&v10->_tintColor, a4);
  }

  return v10;
}

- (FCUIActivityBaubleDescription)initWithActivityDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FCUIActivityBaubleDescription *v7;

  v4 = a3;
  objc_msgSend(v4, "activitySymbolImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "fcui_colorForActivity:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FCUIActivityBaubleDescription initWithSystemImageName:tintColor:](self, "initWithSystemImageName:tintColor:", v5, v6);
  return v7;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
}

- (id)completeDescriptionWithReferencePointSize:(double)a3 maximumPointSize:(double)a4 referenceDimension:(double)a5
{
  return -[FCUIActivityBaubleCompleteDescription initWithSystemImageName:tintColor:referencePointSize:maximumPointSize:referenceDimension:]([FCUIActivityBaubleCompleteDescription alloc], "initWithSystemImageName:tintColor:referencePointSize:maximumPointSize:referenceDimension:", self->_systemImageName, self->_tintColor, a3, a4, a5);
}

@end
