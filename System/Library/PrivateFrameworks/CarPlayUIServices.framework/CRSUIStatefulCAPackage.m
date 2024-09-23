@implementation CRSUIStatefulCAPackage

- (CRSUIStatefulCAPackage)initWithPackage:(id)a3 state:(id)a4
{
  return -[CRSUIStatefulCAPackage initWithPackage:lightModeState:darkModeState:hasDynamicState:](self, "initWithPackage:lightModeState:darkModeState:hasDynamicState:", a3, a4, 0, 0);
}

- (CRSUIStatefulCAPackage)initWithPackage:(id)a3 lightModeState:(id)a4 darkModeState:(id)a5
{
  return -[CRSUIStatefulCAPackage initWithPackage:lightModeState:darkModeState:hasDynamicState:](self, "initWithPackage:lightModeState:darkModeState:hasDynamicState:", a3, a4, a5, 1);
}

- (CRSUIStatefulCAPackage)initWithPackage:(id)a3 lightModeState:(id)a4 darkModeState:(id)a5 hasDynamicState:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  CRSUIStatefulCAPackage *v14;
  CRSUIStatefulCAPackage *v15;
  uint64_t v16;
  NSString *lightModeState;
  uint64_t v18;
  NSString *darkModeState;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CRSUIStatefulCAPackage;
  v14 = -[CRSUIStatefulCAPackage init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_package, a3);
    v16 = objc_msgSend(v12, "copy");
    lightModeState = v15->_lightModeState;
    v15->_lightModeState = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    darkModeState = v15->_darkModeState;
    v15->_darkModeState = (NSString *)v18;

    v15->_hasDynamicState = a6;
  }

  return v15;
}

- (CAPackage)package
{
  return self->_package;
}

- (NSString)lightModeState
{
  return self->_lightModeState;
}

- (NSString)darkModeState
{
  return self->_darkModeState;
}

- (BOOL)hasDynamicState
{
  return self->_hasDynamicState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeState, 0);
  objc_storeStrong((id *)&self->_lightModeState, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

@end
