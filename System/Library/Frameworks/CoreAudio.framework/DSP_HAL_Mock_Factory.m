@implementation DSP_HAL_Mock_Factory

- (DSP_HAL_Mock_Factory)init
{
  DSP_HAL_Mock_Factory *v2;
  DSP_HAL_Mock_Factory *v3;
  DSP_HAL_Mock_PropertySet *v4;
  DSP_HAL_Mock_PropertySet *libraryProperties;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DSP_HAL_Mock_Factory;
  v2 = -[DSP_HAL_Mock_Factory init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_featureFlag = 97;
    v4 = objc_alloc_init(DSP_HAL_Mock_PropertySet);
    libraryProperties = v3->_libraryProperties;
    v3->_libraryProperties = v4;

    -[DSP_HAL_Mock_PropertySet configureForFeatureFlag:](v3->_libraryProperties, "configureForFeatureFlag:", v3->_featureFlag);
  }
  return v3;
}

- (void)dealloc
{
  DSP_HAL_Mock_PropertySet *libraryProperties;
  objc_super v4;

  libraryProperties = self->_libraryProperties;
  self->_libraryProperties = 0;

  v4.receiver = self;
  v4.super_class = (Class)DSP_HAL_Mock_Factory;
  -[DSP_HAL_Mock_Factory dealloc](&v4, sel_dealloc);
}

- (void)setFeatureFlag:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  self->_featureFlag = a3;
  -[DSP_HAL_Mock_Factory libraryProperties](self, "libraryProperties");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureForFeatureFlag:", v3);

}

- (id)createProcessor:(id)a3 withHost:(id)a4
{
  id v5;
  DSP_HAL_Mock_IOProcessor *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(DSP_HAL_Mock_IOProcessor);
  -[DSP_HAL_Mock_IOProcessor setHostCallbacks:](v6, "setHostCallbacks:", v5);
  -[DSP_HAL_Mock_IOProcessor setFeatureFlag:](v6, "setFeatureFlag:", -[DSP_HAL_Mock_Factory featureFlag](self, "featureFlag"));
  v10[0] = &off_1E697D6A8;
  v11 = v10;
  -[DSP_HAL_Mock_IOProcessor setTestHookFetcher:](v6, "setTestHookFetcher:", v10);
  v7 = v11;
  if (v11 == v10)
  {
    v8 = 4;
    v7 = v10;
    goto LABEL_5;
  }
  if (v11)
  {
    v8 = 5;
LABEL_5:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }

  return v6;
}

- (int)featureFlag
{
  return self->_featureFlag;
}

- (DSP_HAL_Mock_PropertySet)libraryProperties
{
  return self->_libraryProperties;
}

- (void)setLibraryProperties:(id)a3
{
  objc_storeStrong((id *)&self->_libraryProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryProperties, 0);
}

- (void)createProcessor:withHost:
{
}

- (_QWORD)createProcessor:withHost:
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E697D6A8;
  return result;
}

- (double)createProcessor:withHost:
{
  uint64_t v2;
  double result;

  v2 = gMockTestHooks;
  if (gMockTestHooks)
  {
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)a1, gMockTestHooks);
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(a1 + 2), v2 + 32);
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(a1 + 4), v2 + 64);
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(a1 + 6), v2 + 96);
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(a1 + 8), v2 + 128);
  }
  else
  {
    result = 0.0;
    a1[8] = 0u;
    a1[9] = 0u;
    a1[6] = 0u;
    a1[7] = 0u;
    a1[4] = 0u;
    a1[5] = 0u;
    a1[2] = 0u;
    a1[3] = 0u;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

- (uint64_t)createProcessor:withHost:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z49-[DSP_HAL_Mock_Factory createProcessor:withHost:]E3$_4"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end
