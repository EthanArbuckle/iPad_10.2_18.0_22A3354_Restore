id LA_LOG_LACUIPackagedViewPlatformStateController()
{
  if (LA_LOG_LACUIPackagedViewPlatformStateController_once != -1)
    dispatch_once(&LA_LOG_LACUIPackagedViewPlatformStateController_once, &__block_literal_global);
  return (id)LA_LOG_LACUIPackagedViewPlatformStateController_log;
}

id _NSStringFromCAStateTransition(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = a1;
  v3 = objc_opt_class();
  objc_msgSend(v2, "fromState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("<%@; %p; from:%@; to:%@>"), v3, v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

const __CFString *NSStringFromLACUIAuthorizationViewMode(uint64_t a1)
{
  if (a1)
    return CFSTR("Register");
  else
    return CFSTR("Enter");
}

const __CFString *NSStringFromLACUIAuthorizationViewStyle(uint64_t a1)
{
  if (a1)
    return CFSTR("FullScreen");
  else
    return CFSTR("Sheet");
}

const __CFString *NSStringFromLACUIAuthenticatorServiceConfigurationRequirement(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("Invalid");
  else
    return off_2510F8160[a1 - 1];
}

const __CFString *NSStringFromLACUISceneButton()
{
  return CFSTR("home");
}

void sub_240AB1544(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

const __CFString *LACUILockViewStateNameFromState(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Invalid");
  else
    return off_2510F81B8[a1];
}

const __CFString *NSStringFromLACUILockViewState(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Invalid");
  else
    return off_2510F81B8[a1];
}

void sub_240AB2A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240AB3BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240AB55A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *CAStateNameFromLACUIFaceIDSpinnerViewState(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Invalid");
  else
    return off_2510F84B8[a1];
}

const __CFString *NSStringFromLACUIFaceIDSpinnerViewState(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Invalid");
  else
    return off_2510F84D8[a1];
}

id LACUIImageWithIcon(void *a1)
{
  id v1;
  id v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v1 = a1;
  v2 = objc_alloc(MEMORY[0x24BE51AB0]);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = (void *)objc_msgSend(v2, "initWithSize:scale:", 50.0, 50.0, v4);

  objc_msgSend(v1, "imageForDescriptor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "placeholder")
    || (objc_msgSend(v1, "prepareImageForDescriptor:", v5),
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        (v7 = (void *)v8) != 0))
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithCGImage:", objc_msgSend(v7, "CGImage"));

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BEBD640]);
  }

  return v9;
}

void LACUILayerScaleDirectDescendants(void *a1, CGFloat a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CATransform3D v10;
  CATransform3D v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (v3)
          objc_msgSend(v3, "transform");
        else
          memset(&v10, 0, sizeof(v10));
        CATransform3DScale(&v11, &v10, a2, a2, 1.0);
        objc_msgSend(v9, "setTransform:", &v11);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

void LACUILayerScaleToFitInRect(void *a1, double a2, double a3, double a4, double a5)
{
  id v7;
  double v8;
  double v9;
  double v10;
  CATransform3D v11;
  CATransform3D v12;

  v7 = a1;
  objc_msgSend(v7, "bounds");
  v9 = a4 / v8;
  objc_msgSend(v7, "bounds");
  if (v9 >= a5 / v10)
    v9 = a5 / v10;
  objc_msgSend(v7, "setPosition:", a4 * 0.5, a5 * 0.5);
  CATransform3DMakeScale(&v12, v9, v9, 1.0);
  v11 = v12;
  objc_msgSend(v7, "setTransform:", &v11);

}

id LACUILayerFindSublayerWithName(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v3, "sublayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v17 = v10;
          goto LABEL_19;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v7)
        continue;
      break;
    }
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "sublayers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
LABEL_11:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v15)
        objc_enumerationMutation(v5);
      LACUILayerFindSublayerWithName(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16), v4);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v14)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_19:
    v18 = v17;
  }
  else
  {
LABEL_17:
    v18 = 0;
  }

  return v18;
}

id LA_LOG_LACUIPackagedView()
{
  if (LA_LOG_LACUIPackagedView_once != -1)
    dispatch_once(&LA_LOG_LACUIPackagedView_once, &__block_literal_global_43);
  return (id)LA_LOG_LACUIPackagedView_log;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t LACUIAuthContainerView.viewModel.getter()
{
  return LACUIAuthContainerView.viewModel.getter((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEB790]);
}

uint64_t LACUIAuthContainerView.$viewModel.getter()
{
  return LACUIAuthContainerView.viewModel.getter(MEMORY[0x24BDEB798]);
}

uint64_t LACUIAuthContainerView.viewModel.getter(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *v1;
  v3 = v1[1];
  v4 = *((unsigned __int8 *)v1 + 16);
  v5 = type metadata accessor for LACUIAuthContainerViewModel();
  v6 = lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel, (uint64_t (*)(uint64_t))type metadata accessor for LACUIAuthContainerViewModel, (uint64_t)&protocol conformance descriptor for LACUIAuthContainerViewModel);
  return a1(v2, v3, v4, v5, v6);
}

uint64_t LACUIAuthContainerView.init(dataSource:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)a3 = partial apply for implicit closure #1 in LACUIAuthContainerView.init(dataSource:);
  *(_QWORD *)(a3 + 8) = result;
  *(_BYTE *)(a3 + 16) = 0;
  return result;
}

uint64_t implicit closure #1 in LACUIAuthContainerView.init(dataSource:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v24 = a2;
  v22 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v2);
  v23 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LACUIAuthState();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  type metadata accessor for LACUIAuthContainerViewModel();
  v14 = swift_allocObject();
  v15 = v14 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel__state;
  v16 = type metadata accessor for LACUIAuthCountdownConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  outlined init with copy of LACUIAuthCountdownConfiguration((uint64_t)v13, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthState);
  swift_unknownObjectRetain();
  Published.init(initialValue:)();
  outlined destroy of LACUIAuthCountdownView((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthState);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v15, v7, v4);
  v17 = v14 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource;
  *(_QWORD *)(v14 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource + 8) = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  *(_QWORD *)(v17 + 8) = v24;
  swift_unknownObjectWeakAssign();
  v25 = xmmword_240AE13E0;
  v18 = type metadata accessor for TaskPriority();
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v19 = (uint64_t)v23;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v23, 1, 1, v18);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = v14;
  outlined init with take of LACUIAuthAction((uint64_t)&v25, (uint64_t)(v20 + 5));
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v19, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:), (uint64_t)v20);
  swift_unknownObjectRelease();
  swift_release();
  return v14;
}

uint64_t sub_240AB7914()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in LACUIAuthContainerView.init(dataSource:)()
{
  uint64_t v0;

  return implicit closure #1 in LACUIAuthContainerView.init(dataSource:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t LACUIAuthContainerView.init(viewModel:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = partial apply for implicit closure #1 in LACUIAuthContainerView.init(viewModel:);
  *(_QWORD *)(a2 + 8) = result;
  *(_BYTE *)(a2 + 16) = 0;
  return result;
}

uint64_t partial apply for implicit closure #1 in LACUIAuthContainerView.init(viewModel:)()
{
  return swift_retain();
}

uint64_t LACUIAuthContainerView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v25 = a1;
  v26 = type metadata accessor for LACUIAuthCountdownView();
  MEMORY[0x24BDAC7A8](v26);
  v23 = (uint64_t *)((char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v2 = type metadata accessor for LACUIAuthCountdownConfiguration();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v21 = (uint64_t)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v22 = (uint64_t)&v21 - v6;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<EmptyView, LACUIAuthCountdownView>.Storage);
  MEMORY[0x24BDAC7A8](v24);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LACUIAuthState();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined copy of StateObject<LACUIAuthContainerViewModel>.Storage();
  type metadata accessor for LACUIAuthContainerViewModel();
  lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel, (uint64_t (*)(uint64_t))type metadata accessor for LACUIAuthContainerViewModel, (uint64_t)&protocol conformance descriptor for LACUIAuthContainerViewModel);
  v12 = StateObject.wrappedValue.getter();
  v13 = outlined consume of StateObject<LACUIAuthContainerViewModel>.Storage();
  (*(void (**)(uint64_t))(*(_QWORD *)v12 + 96))(v13);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v11, 1, v2) == 1)
  {
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACUIAuthCountdownView and conformance LACUIAuthCountdownView, (uint64_t (*)(uint64_t))type metadata accessor for LACUIAuthCountdownView, (uint64_t)&protocol conformance descriptor for LACUIAuthCountdownView);
    return _ConditionalContent<>.init(storage:)();
  }
  else
  {
    v15 = v22;
    outlined init with take of LACUIAuthCountdownConfiguration((uint64_t)v11, v22);
    v16 = v21;
    outlined init with copy of LACUIAuthCountdownConfiguration(v15, v21, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
    outlined copy of StateObject<LACUIAuthContainerViewModel>.Storage();
    v17 = StateObject.wrappedValue.getter();
    outlined consume of StateObject<LACUIAuthContainerViewModel>.Storage();
    type metadata accessor for LACUIAuthCountdownViewModel();
    swift_allocObject();
    LACUIAuthCountdownViewModel.init(configuration:handler:)(v16, v17, (uint64_t)&protocol witness table for LACUIAuthContainerViewModel);
    KeyPath = swift_getKeyPath();
    v19 = v23;
    *(uint64_t *)((char *)v23 + *(int *)(v26 + 20)) = KeyPath;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel((unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel, (uint64_t (*)(uint64_t))type metadata accessor for LACUIAuthCountdownViewModel, (uint64_t)&protocol conformance descriptor for LACUIAuthCountdownViewModel);
    *v19 = ObservedObject.init(wrappedValue:)();
    v19[1] = v20;
    outlined init with copy of LACUIAuthCountdownConfiguration((uint64_t)v19, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACUIAuthCountdownView and conformance LACUIAuthCountdownView, (uint64_t (*)(uint64_t))type metadata accessor for LACUIAuthCountdownView, (uint64_t)&protocol conformance descriptor for LACUIAuthCountdownView);
    _ConditionalContent<>.init(storage:)();
    outlined destroy of LACUIAuthCountdownView((uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
    return outlined destroy of LACUIAuthCountdownView(v15, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242688780]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined copy of StateObject<LACUIAuthContainerViewModel>.Storage()
{
  return swift_retain();
}

uint64_t outlined consume of StateObject<LACUIAuthContainerViewModel>.Storage()
{
  return swift_release();
}

uint64_t outlined init with take of LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance LACUIAuthContainerView()
{
  return static View._viewListCount(inputs:)();
}

uint64_t default argument 0 of View.embedInScrollView(fillAvailableSpace:)()
{
  return 1;
}

uint64_t key path getter for EnvironmentValues.colorScheme : EnvironmentValues()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t key path setter for EnvironmentValues.colorScheme : EnvironmentValues(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = type metadata accessor for ColorScheme();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.colorScheme.setter();
}

uint64_t lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x242688798](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in LACUIAuthContainerView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for LACUIAuthContainerView()
{
  return outlined consume of StateObject<LACUIAuthContainerViewModel>.Storage();
}

uint64_t initializeBufferWithCopyOfBuffer for LACUIAuthContainerView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  outlined copy of StateObject<LACUIAuthContainerViewModel>.Storage();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LACUIAuthContainerView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  outlined copy of StateObject<LACUIAuthContainerViewModel>.Storage();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  outlined consume of StateObject<LACUIAuthContainerViewModel>.Storage();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LACUIAuthContainerView(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  outlined consume of StateObject<LACUIAuthContainerViewModel>.Storage();
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthContainerView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LACUIAuthContainerView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthContainerView()
{
  return &type metadata for LACUIAuthContainerView;
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<EmptyView, LACUIAuthCountdownView> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = lazy protocol witness table cache variable for type _ConditionalContent<EmptyView, LACUIAuthCountdownView> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<EmptyView, LACUIAuthCountdownView> and conformance <> _ConditionalContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ConditionalContent<EmptyView, LACUIAuthCountdownView>);
    v2 = lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACUIAuthCountdownView and conformance LACUIAuthCountdownView, (uint64_t (*)(uint64_t))type metadata accessor for LACUIAuthCountdownView, (uint64_t)&protocol conformance descriptor for LACUIAuthCountdownView);
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = v2;
    result = MEMORY[0x242688798](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<EmptyView, LACUIAuthCountdownView> and conformance <> _ConditionalContent<A, B>);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24268878C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void type metadata accessor for LACUserInterfaceRequestIdentifier(uint64_t a1)
{
  type metadata accessor for LACUserInterfaceRequestIdentifier(a1, &lazy cache variable for type metadata for LACUserInterfaceRequestIdentifier);
}

void type metadata accessor for LACBiometryType(uint64_t a1)
{
  type metadata accessor for LACUserInterfaceRequestIdentifier(a1, &lazy cache variable for type metadata for LACBiometryType);
}

void type metadata accessor for LACUIFaceIDSpinnerState(uint64_t a1)
{
  type metadata accessor for LACUserInterfaceRequestIdentifier(a1, &lazy cache variable for type metadata for LACUIFaceIDSpinnerState);
}

void type metadata accessor for LACUILockViewState(uint64_t a1)
{
  type metadata accessor for LACUserInterfaceRequestIdentifier(a1, &lazy cache variable for type metadata for LACUILockViewState);
}

void type metadata accessor for LACUserInterfaceRequestIdentifier(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

NSNumber protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance LACBiometryType()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance LACBiometryType(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = MEMORY[0x242688090](a1, &v6);
  v4 = v6;
  v5 = v7;
  if (v7)
    v4 = 0;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance LACBiometryType(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = static Int._conditionallyBridgeFromObjectiveC(_:result:)();
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance LACBiometryType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static Int._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance LACBiometryType@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LACBiometryType(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance LACBiometryType()
{
  lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACBiometryType and conformance LACBiometryType, (uint64_t (*)(uint64_t))type metadata accessor for LACBiometryType, (uint64_t)&protocol conformance descriptor for LACBiometryType);
  lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACBiometryType and conformance LACBiometryType, (uint64_t (*)(uint64_t))type metadata accessor for LACBiometryType, (uint64_t)&protocol conformance descriptor for LACBiometryType);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t base witness table accessor for RawRepresentable in LACBiometryType()
{
  return lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACBiometryType and conformance LACBiometryType, (uint64_t (*)(uint64_t))type metadata accessor for LACBiometryType, (uint64_t)&protocol conformance descriptor for LACBiometryType);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in LACBiometryType()
{
  return lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACBiometryType and conformance LACBiometryType, (uint64_t (*)(uint64_t))type metadata accessor for LACBiometryType, (uint64_t)&protocol conformance descriptor for LACBiometryType);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance LACBiometryType()
{
  return Int.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance LACBiometryType()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance LACBiometryType()
{
  return static Hasher._hash(seed:_:)();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance LACBiometryType(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t base witness table accessor for Equatable in LACBiometryType()
{
  return lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type LACBiometryType and conformance LACBiometryType, (uint64_t (*)(uint64_t))type metadata accessor for LACBiometryType, (uint64_t)&protocol conformance descriptor for LACBiometryType);
}

uint64_t outlined init with copy of LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of LACUIAuthCountdownView(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_240AB84A8()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  if (*(_QWORD *)(v0 + 48) >= 2uLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_deallocObject();
}

uint64_t outlined init with take of LACUIAuthAction(uint64_t a1, uint64_t a2)
{
  __swift_memcpy33_8(a2, a1);
  return a2;
}

uint64_t partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:);
  return closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

uint64_t partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void LACUIAuthCountdownViewModel.handler.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t static LACUIDTOUtilities.dtoLearnMoreLinkURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(string:)();
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v4, v5);
  __break(1u);
  return result;
}

LACUIDTOUtilities __swiftcall LACUIDTOUtilities.init()()
{
  return (LACUIDTOUtilities)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id LACUIDTOUtilities.init()()
{
  objc_super v1;

  v1.super_class = (Class)LACUIDTOUtilities;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for LACUIDTOUtilities()
{
  unint64_t result;

  result = lazy cache variable for type metadata for LACUIDTOUtilities;
  if (!lazy cache variable for type metadata for LACUIDTOUtilities)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for LACUIDTOUtilities);
  }
  return result;
}

uint64_t dispatch thunk of LACUIAuthDataSource.nextState(for:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 8) + *(_QWORD *)(a5 + 8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:);
  return v13(a1, a2, a3, a4, a5);
}

LocalAuthenticationCoreUI::LACUIRatchetViewModelPresentationStyle_optional __swiftcall LACUIRatchetViewModelPresentationStyle.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (LocalAuthenticationCoreUI::LACUIRatchetViewModelPresentationStyle_optional)rawValue;
}

uint64_t LACUIRatchetViewModelPresentationStyle.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance LACUIRatchetViewModelPresentationStyle(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t lazy protocol witness table accessor for type LACUIRatchetViewModelPresentationStyle and conformance LACUIRatchetViewModelPresentationStyle()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LACUIRatchetViewModelPresentationStyle and conformance LACUIRatchetViewModelPresentationStyle;
  if (!lazy protocol witness table cache variable for type LACUIRatchetViewModelPresentationStyle and conformance LACUIRatchetViewModelPresentationStyle)
  {
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUIRatchetViewModelPresentationStyle, &type metadata for LACUIRatchetViewModelPresentationStyle);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIRatchetViewModelPresentationStyle and conformance LACUIRatchetViewModelPresentationStyle);
  }
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance LACUIRatchetViewModelPresentationStyle()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance LACUIRatchetViewModelPresentationStyle()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance LACUIRatchetViewModelPresentationStyle()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance LACUIRatchetViewModelPresentationStyle@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LACUIRatchetViewModelPresentationStyle(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LACUIRatchetViewModelPresentationStyle(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LACUIRatchetViewModelPresentationStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_240AB8B78 + 4 * byte_240AE1775[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_240AB8BAC + 4 * asc_240AE1770[v4]))();
}

uint64_t sub_240AB8BAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240AB8BB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240AB8BBCLL);
  return result;
}

uint64_t sub_240AB8BC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240AB8BD0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_240AB8BD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240AB8BDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for LACUIRatchetViewModelPresentationStyle(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for LACUIRatchetViewModelPresentationStyle(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LACUIRatchetViewModelPresentationStyle()
{
  return &type metadata for LACUIRatchetViewModelPresentationStyle;
}

uint64_t specialized static LACUIAuthImageConfiguration.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if ((a1[2] & 1) != 0)
  {
    if ((a2[2] & 1) != 0)
    {
      if (v2 != v4 || v3 != v5)
      {
LABEL_15:
        v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
        goto LABEL_17;
      }
LABEL_16:
      v7 = 1;
      goto LABEL_17;
    }
  }
  else if ((a2[2] & 1) == 0)
  {
    if (v2 != v4 || v3 != v5)
      goto LABEL_15;
    goto LABEL_16;
  }
  v7 = 0;
LABEL_17:
  outlined copy of LACUIAuthImageConfiguration();
  outlined copy of LACUIAuthImageConfiguration();
  outlined consume of LACUIAuthImageConfiguration();
  outlined consume of LACUIAuthImageConfiguration();
  return v7 & 1;
}

uint64_t outlined copy of LACUIAuthImageConfiguration()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for LACUIAuthImageConfiguration()
{
  return outlined consume of LACUIAuthImageConfiguration();
}

uint64_t outlined consume of LACUIAuthImageConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for LACUIAuthImageConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  outlined copy of LACUIAuthImageConfiguration();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LACUIAuthImageConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  outlined copy of LACUIAuthImageConfiguration();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  outlined consume of LACUIAuthImageConfiguration();
  return a1;
}

uint64_t assignWithTake for LACUIAuthImageConfiguration(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  outlined consume of LACUIAuthImageConfiguration();
  return a1;
}

uint64_t getEnumTag for LACUIAuthImageConfiguration(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for LACUIAuthImageConfiguration(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthImageConfiguration()
{
  return &type metadata for LACUIAuthImageConfiguration;
}

uint64_t static Color.sheetBackground(for:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  id v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;

  v2 = type metadata accessor for ColorScheme();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BDEB400])
  {
    v7 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
  }
  else
  {
    v8 = v6;
    v9 = *MEMORY[0x24BDEB3F0];
    v10 = (void *)objc_opt_self();
    if (v8 != v9)
    {
      v11 = MEMORY[0x242687EBC](objc_msgSend(v10, sel_systemBackgroundColor));
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return v11;
    }
    v7 = objc_msgSend(v10, sel_secondarySystemBackgroundColor);
  }
  return MEMORY[0x242687EBC](v7);
}

void static Color.systemBackground.getter()
{
  static Color.systemBackground.getter((SEL *)&selRef_systemBackgroundColor);
}

void static Color.secondarySystemBackground.getter()
{
  static Color.systemBackground.getter((SEL *)&selRef_secondarySystemBackgroundColor);
}

void static Color.systemBackground.getter(SEL *a1)
{
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), *a1);
  JUMPOUT(0x242687EBCLL);
}

id LACUIDTOBiometryRequiredScenePresentationHandler.__allocating_init(biometryType:alertFactory:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR____TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler_biometryType] = a1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler_alertFactory] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id LACUIDTOBiometryRequiredScenePresentationHandler.init(biometryType:alertFactory:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_super v4;

  *(_QWORD *)&v2[OBJC_IVAR____TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler_biometryType] = a1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler_alertFactory] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for LACUIDTOBiometryRequiredScenePresentationHandler();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for LACUIDTOBiometryRequiredScenePresentationHandler()
{
  return objc_opt_self();
}

Swift::Bool __swiftcall LACUIDTOBiometryRequiredScenePresentationHandler.canHandle(request:)(LACUIScenePresentationRequest request)
{
  id v1;
  unsigned int v2;

  v1 = -[objc_class userInterfaceRequest](request.super.isa, sel_userInterfaceRequest);
  v2 = objc_msgSend(v1, sel_identifier);

  return v2 == 5;
}

Swift::Void __swiftcall LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)(LACUIScenePresentationRequest request, LACUIScenePresentationContext inContext)
{
  specialized LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)(request._userInterfaceRequest);
}

uint64_t closure #1 in LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)(void *a1)
{
  objc_msgSend(objc_msgSend(a1, sel_presenter), sel_dismiss);
  return swift_unknownObjectRelease();
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id LACUIDTOBiometryRequiredScenePresentationHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void LACUIDTOBiometryRequiredScenePresentationHandler.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LACUIDTOBiometryRequiredScenePresentationHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LACUIDTOBiometryRequiredScenePresentationHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void specialized LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  Swift::String v18;
  uint64_t v19;
  Swift::String aBlock;
  uint64_t (*v21)(uint64_t);
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = type metadata accessor for LACLogger();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler_biometryType);
  v8 = objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC25LocalAuthenticationCoreUI48LACUIDTOBiometryRequiredScenePresentationHandler_alertFactory), sel_biometryRequiredAlertWithBiometryType_, v7);
  if (v8)
  {
    v9 = v8;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = a1;
    v23 = partial apply for closure #1 in LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:);
    v24 = v10;
    v11 = MEMORY[0x24BDAC760];
    aBlock._countAndFlagsBits = MEMORY[0x24BDAC760];
    aBlock._object = (void *)1107296256;
    v21 = thunk for @escaping @callee_guaranteed () -> ();
    v22 = &block_descriptor;
    v12 = _Block_copy(&aBlock);
    v13 = a1;
    swift_release();
    objc_msgSend(v9, sel_setOnDismiss_, v12);
    _Block_release(v12);
    v14 = objc_msgSend(v13, sel_presenter);
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v9;
    v23 = partial apply for closure #2 in LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:);
    v24 = v15;
    aBlock._countAndFlagsBits = v11;
    aBlock._object = (void *)1107296256;
    v21 = thunk for @escaping @callee_guaranteed () -> ();
    v22 = &block_descriptor_7;
    v16 = _Block_copy(&aBlock);
    v17 = v9;
    swift_release();
    objc_msgSend(v14, sel_present_animated_completion_, v17, 1, v16);
    _Block_release(v16);
    swift_unknownObjectRelease();

  }
  else
  {
    static LACLogger.ui.getter();
    aBlock._countAndFlagsBits = 0;
    aBlock._object = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(39);
    v18._object = (void *)0x8000000240AE3A50;
    v18._countAndFlagsBits = 0xD000000000000025;
    String.append(_:)(v18);
    v25 = v7;
    type metadata accessor for LACBiometryType(0);
    _print_unlocked<A, B>(_:_:)();
    LACLogger.error(_:)(aBlock);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    objc_msgSend(objc_msgSend(a1, sel_presenter), sel_dismiss);
    swift_unknownObjectRelease();
  }
}

uint64_t method lookup function for LACUIDTOBiometryRequiredScenePresentationHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LACUIDTOBiometryRequiredScenePresentationHandler.__allocating_init(biometryType:alertFactory:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of LACUIDTOBiometryRequiredScenePresentationHandler.canHandle(request:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t sub_240AB95C4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)()
{
  uint64_t v0;

  return closure #1 in LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)(*(void **)(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

id partial apply for closure #2 in LACUIDTOBiometryRequiredScenePresentationHandler.handle(request:inContext:)()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_shake);
}

uint64_t Image.init(with:)(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
    return Image.init(systemName:)();
  v2 = one-time initialization token for current;
  swift_bridgeObjectRetain();
  if (v2 != -1)
    swift_once();
  v3 = (id)static NSBundle.current;
  v4 = Image.init(_:bundle:)();
  outlined consume of LACUIAuthImageConfiguration();
  return v4;
}

uint64_t NSBundle.Sentinel.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

id one-time initialization function for current()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for NSBundle.Sentinel();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  static NSBundle.current = (uint64_t)result;
  return result;
}

{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for NSBundle.Sentinel();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  static NSBundle.current = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for NSBundle.Sentinel()
{
  return objc_opt_self();
}

{
  return objc_opt_self();
}

uint64_t LACUIFaceIDSpinnerView_SwiftUI.viewModel.getter()
{
  return swift_retain();
}

uint64_t LACUIFaceIDSpinnerView_SwiftUI.viewModel.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*LACUIFaceIDSpinnerView_SwiftUI.viewModel.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIFaceIDSpinnerView_SwiftUI.$viewModel.getter()
{
  type metadata accessor for LACUIFaceIDSpinnerViewModel();
  lazy protocol witness table accessor for type LACUIFaceIDSpinnerViewModel and conformance LACUIFaceIDSpinnerViewModel();
  return ObservedObject.projectedValue.getter();
}

unint64_t lazy protocol witness table accessor for type LACUIFaceIDSpinnerViewModel and conformance LACUIFaceIDSpinnerViewModel()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type LACUIFaceIDSpinnerViewModel and conformance LACUIFaceIDSpinnerViewModel;
  if (!lazy protocol witness table cache variable for type LACUIFaceIDSpinnerViewModel and conformance LACUIFaceIDSpinnerViewModel)
  {
    v1 = type metadata accessor for LACUIFaceIDSpinnerViewModel();
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUIFaceIDSpinnerViewModel, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIFaceIDSpinnerViewModel and conformance LACUIFaceIDSpinnerViewModel);
  }
  return result;
}

uint64_t LACUIFaceIDSpinnerView_SwiftUI.init(viewModel:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for LACUIFaceIDSpinnerViewModel();
  lazy protocol witness table accessor for type LACUIFaceIDSpinnerViewModel and conformance LACUIFaceIDSpinnerViewModel();
  result = ObservedObject.init(wrappedValue:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void LACUIFaceIDSpinnerView_SwiftUI.updateUIView<A>(_:context:)(void *a1)
{
  LACUIFaceIDSpinnerView_SwiftUI.updateView<A>(_:context:)(a1);
}

void LACUIFaceIDSpinnerView_SwiftUI.updateView<A>(_:context:)(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = *(_QWORD *)(v1 + 8);
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 88);
    v9 = a1;
    v7 = swift_retain();
    v8 = v6(v7);
    swift_release();
    objc_msgSend(v5, sel_setState_, v8);

  }
}

id LACUIFaceIDSpinnerView_SwiftUI.makeUIView(context:)()
{
  return objc_msgSend(objc_allocWithZone((Class)LACUIFaceIDSpinnerView), sel_init);
}

unint64_t instantiation function for generic protocol witness table for LACUIFaceIDSpinnerView_SwiftUI(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI;
  if (!lazy protocol witness table cache variable for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI)
  {
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUIFaceIDSpinnerView_SwiftUI, &type metadata for LACUIFaceIDSpinnerView_SwiftUI);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI;
  if (!lazy protocol witness table cache variable for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI)
  {
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUIFaceIDSpinnerView_SwiftUI, &type metadata for LACUIFaceIDSpinnerView_SwiftUI);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI);
  }
  return result;
}

id protocol witness for UIViewRepresentable.makeUIView(context:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  return objc_msgSend(objc_allocWithZone((Class)LACUIFaceIDSpinnerView), sel_init);
}

void protocol witness for UIViewRepresentable.updateUIView(_:context:) in conformance LACUIFaceIDSpinnerView_SwiftUI(void *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v1 + 8) + 88);
  v5 = a1;
  v3 = swift_retain();
  v4 = v2(v3);
  swift_release();
  objc_msgSend(v5, sel_setState_, v4);

}

uint64_t protocol witness for UIViewRepresentable.sizeThatFits(_:uiView:context:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t associated type witness table accessor for View.Body : View in LACUIFaceIDSpinnerView_SwiftUI()
{
  return MEMORY[0x24BDF5560];
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  lazy protocol witness table accessor for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI();
  return static UIViewRepresentable._makeView(view:inputs:)();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  lazy protocol witness table accessor for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI();
  return static UIViewRepresentable._makeViewList(view:inputs:)();
}

void protocol witness for View.body.getter in conformance LACUIFaceIDSpinnerView_SwiftUI()
{
  lazy protocol witness table accessor for type LACUIFaceIDSpinnerView_SwiftUI and conformance LACUIFaceIDSpinnerView_SwiftUI();
  UIViewRepresentable.body.getter();
  __break(1u);
}

uint64_t sub_240AB9BB8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_240AB9BC4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_retain();
  result = swift_release();
  *(_QWORD *)(a2 + 8) = v3;
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for LACUIFaceIDSpinnerView_SwiftUI(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for LACUIFaceIDSpinnerView_SwiftUI()
{
  return swift_release();
}

_QWORD *assignWithCopy for LACUIFaceIDSpinnerView_SwiftUI(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for LACUIFaceIDSpinnerView_SwiftUI(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIFaceIDSpinnerView_SwiftUI(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LACUIFaceIDSpinnerView_SwiftUI(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIFaceIDSpinnerView_SwiftUI()
{
  return &type metadata for LACUIFaceIDSpinnerView_SwiftUI;
}

uint64_t LACUIAuthCountdownViewModel.__allocating_init(configuration:handler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  LACUIAuthCountdownViewModel.init(configuration:handler:)(a1, a2, a3);
  return v6;
}

uint64_t LACUIAuthCountdownViewModel.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of LACUIAuthCountdownConfiguration(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration, a1);
}

uint64_t LACUIAuthCountdownViewModel.delayExpiration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration;
  v7 = type metadata accessor for LACUIAuthCountdownConfiguration();
  outlined init with copy of LACUIAuthCountdownDelayConfiguration?(v6 + *(int *)(v7 + 28), (uint64_t)v5);
  v8 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v5, 1, v8) == 1)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v5, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    v9 = type metadata accessor for Date();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
  else
  {
    v11 = &v5[*(int *)(v8 + 20)];
    v12 = type metadata accessor for Date();
    v13 = *(_QWORD *)(v12 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(a1, v11, v12);
    outlined destroy of LACUIAuthCountdownView((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(a1, 0, 1, v12);
  }
}

uint64_t LACUIAuthCountdownViewModel.init(configuration:handler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Date();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v20 - v14;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler + 8) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v3 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_delayTimer) = 0;
  outlined init with copy of LACUIAuthCountdownConfiguration(a1, v3 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler + 8) = a3;
  v16 = swift_unknownObjectWeakAssign();
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 104))(v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    swift_unknownObjectRelease();
    outlined destroy of LACUIAuthCountdownView(a1, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v8, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    static Date.now.getter();
    v17 = static Date.> infix(_:_:)();
    v18 = *(void (**)(char *, uint64_t))(v10 + 8);
    v18(v13, v9);
    if ((v17 & 1) != 0)
      LACUIAuthCountdownViewModel.scheduleDelayTimer()();
    swift_unknownObjectRelease();
    outlined destroy of LACUIAuthCountdownView(a1, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
    v18(v15, v9);
  }
  return v3;
}

uint64_t outlined init with copy of LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of LACUIAuthCountdownDelayConfiguration?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of LACUIAuthCountdownDelayConfiguration?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void LACUIAuthCountdownViewModel.scheduleDelayTimer()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[6];

  v1 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_delayTimer;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_delayTimer);
  if (v2)
  {
    objc_msgSend(v2, sel_invalidate);
    v3 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = 0;

  }
  v4 = (void *)objc_opt_self();
  v5 = swift_allocObject();
  swift_weakInit();
  v9[4] = partial apply for closure #1 in LACUIAuthCountdownViewModel.scheduleDelayTimer();
  v9[5] = v5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed NSTimer) -> ();
  v9[3] = &block_descriptor_0;
  v6 = _Block_copy(v9);
  swift_release();
  v7 = objc_msgSend(v4, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v6, 0.5);
  _Block_release(v6);
  v8 = *(void **)(v0 + v1);
  *(_QWORD *)(v0 + v1) = v7;

}

Swift::Void __swiftcall LACUIAuthCountdownViewModel.tappedOnButton(_:)(LocalAuthenticationCoreUI::LACUIAuthButtonConfiguration *a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
  uint64_t v5;
  LocalAuthenticationCoreUI::LACUIAuthButtonStyle style;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(_QWORD *, uint64_t, uint64_t);
  _QWORD v11[4];
  LocalAuthenticationCoreUI::LACUIAuthButtonStyle v12;

  countAndFlagsBits = a1->id._countAndFlagsBits;
  object = a1->id._object;
  v5 = a1->title._countAndFlagsBits;
  v4 = a1->title._object;
  style = a1->style;
  v7 = v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler;
  if (MEMORY[0x2426888D0](v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler))
  {
    v8 = *(_QWORD *)(v7 + 8);
    ObjectType = swift_getObjectType();
    v11[0] = countAndFlagsBits;
    v11[1] = object;
    v11[2] = v5;
    v11[3] = v4;
    v12 = style;
    v10 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v8 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v11, ObjectType, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
}

uint64_t LACUIAuthCountdownViewModel.deinit()
{
  uint64_t v0;

  outlined destroy of LACUIAuthCountdownView(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
  outlined destroy of weak LACUIAuthCountdownViewModelHandler?(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler);

  return v0;
}

uint64_t outlined destroy of weak LACUIAuthCountdownViewModelHandler?(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t LACUIAuthCountdownViewModel.__deallocating_deinit()
{
  uint64_t v0;

  outlined destroy of LACUIAuthCountdownView(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
  outlined destroy of weak LACUIAuthCountdownViewModelHandler?(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler);

  return swift_deallocClassInstance();
}

uint64_t associated type witness table accessor for ObservableObject.ObjectWillChangePublisher : Publisher in LACUIAuthCountdownViewModel()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance LACUIAuthCountdownViewModel@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for LACUIAuthCountdownViewModel();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t dispatch thunk of LACUIAuthCountdownViewModelHandler.handle(action:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t ObjC metadata update function for LACUIAuthCountdownViewModel()
{
  return type metadata accessor for LACUIAuthCountdownViewModel();
}

uint64_t type metadata accessor for LACUIAuthCountdownViewModel()
{
  uint64_t result;

  result = type metadata singleton initialization cache for LACUIAuthCountdownViewModel;
  if (!type metadata singleton initialization cache for LACUIAuthCountdownViewModel)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for LACUIAuthCountdownViewModel()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LACUIAuthCountdownConfiguration();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for LACUIAuthCountdownViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LACUIAuthCountdownViewModel.delayExpiration.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of LACUIAuthCountdownViewModel.__allocating_init(configuration:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of LACUIAuthCountdownViewModel.tappedOnButton(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t sub_240ABA568()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t closure #1 in LACUIAuthCountdownViewModel.scheduleDelayTimer()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t Strong;
  char v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t ObjectType;
  _OWORD v21[2];
  char v22;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Date();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v21 - v8;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
    return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v2, &demangling cache variable for type metadata for Date?);
  }
  (*(void (**)(uint64_t))(*(_QWORD *)Strong + 104))(Strong);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
    return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v2, &demangling cache variable for type metadata for Date?);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
  static Date.now.getter();
  v11 = static Date.< infix(_:_:)();
  v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, v3);
  if ((v11 & 1) != 0)
  {
    swift_beginAccess();
    v13 = swift_weakLoadStrong();
    if (v13)
    {
      v14 = v13;
      v15 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_delayTimer;
      objc_msgSend(*(id *)(v13 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_delayTimer), sel_invalidate);
      v16 = *(void **)(v14 + v15);
      *(_QWORD *)(v14 + v15) = 0;

      v17 = v14 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler;
      if (MEMORY[0x2426888D0](v14 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_handler))
      {
        v18 = *(_QWORD *)(v17 + 8);
        ObjectType = swift_getObjectType();
        v22 = 0;
        memset(v21, 0, sizeof(v21));
        (*(void (**)(_OWORD *, uint64_t, uint64_t))(v18 + 8))(v21, ObjectType, v18);
        swift_release();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_release();
      }
    }
  }
  return ((uint64_t (*)(char *, uint64_t))v12)(v9, v3);
}

uint64_t partial apply for closure #1 in LACUIAuthCountdownViewModel.scheduleDelayTimer()()
{
  return closure #1 in LACUIAuthCountdownViewModel.scheduleDelayTimer()();
}

void thunk for @escaping @callee_guaranteed @Sendable (@guaranteed NSTimer) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t LACUIAuthCountdownDelayView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of LACUIAuthCountdownConfiguration(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
}

uint64_t LACUIAuthCountdownDelayView.expirationRange.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t result;
  char *v21;
  void (*v22)(char *, char *, uint64_t);
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  char *v26;
  char *v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  uint64_t v35;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (lower: Date, upper: Date));
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v32 - v7;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Date>);
  MEMORY[0x24BDAC7A8](v33);
  v34 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Date();
  v11 = *(_QWORD **)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v32 - v15;
  v17 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 20);
  static Date.now.getter();
  v18 = static Date.> infix(_:_:)();
  v32 = (void (*)(char *, uint64_t))v11[1];
  v32(v16, v10);
  static Date.now.getter();
  v35 = a1;
  if ((v18 & 1) != 0)
  {
    v19 = (void (*)(char *, uint64_t, uint64_t))v11[2];
    v19(v14, v17, v10);
    lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type Date and conformance Date, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    result = dispatch thunk of static Comparable.<= infix(_:_:)();
    if ((result & 1) != 0)
    {
      v21 = &v8[*(int *)(v3 + 48)];
      v22 = (void (*)(char *, char *, uint64_t))v11[4];
      v22(v8, v16, v10);
      v22(v21, v14, v10);
      v23 = &v6[*(int *)(v3 + 48)];
      v19(v6, (uint64_t)v8, v10);
      v19(v23, (uint64_t)v21, v10);
      v24 = (uint64_t)v34;
      v22(v34, v6, v10);
      v25 = v32;
      v32(v23, v10);
      v26 = &v6[*(int *)(v3 + 48)];
      v22(v6, v8, v10);
      v22(v26, v21, v10);
      v22((char *)(v24 + *(int *)(v33 + 36)), v26, v10);
LABEL_6:
      v25(v6, v10);
      return outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v24, v35, &demangling cache variable for type metadata for Range<Date>);
    }
    __break(1u);
  }
  else
  {
    static Date.now.getter();
    lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type Date and conformance Date, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    result = dispatch thunk of static Comparable.<= infix(_:_:)();
    if ((result & 1) != 0)
    {
      v27 = &v8[*(int *)(v3 + 48)];
      v28 = (void (*)(char *, char *, uint64_t))v11[4];
      v28(v8, v16, v10);
      v28(v27, v14, v10);
      v29 = &v6[*(int *)(v3 + 48)];
      v30 = (void (*)(char *, char *, uint64_t))v11[2];
      v30(v6, v8, v10);
      v30(v29, v27, v10);
      v24 = (uint64_t)v34;
      v28(v34, v6, v10);
      v25 = v32;
      v32(v29, v10);
      v31 = &v6[*(int *)(v3 + 48)];
      v28(v6, v8, v10);
      v28(v31, v27, v10);
      v28((char *)(v24 + *(int *)(v33 + 36)), v31, v10);
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t LACUIAuthCountdownDelayView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = static HorizontalAlignment.center.getter();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>>);
  return closure #1 in LACUIAuthCountdownDelayView.body.getter(v1, (char *)(a1 + *(int *)(v3 + 44)));
}

uint64_t closure #1 in LACUIAuthCountdownDelayView.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  char *v26;
  id v27;
  uint64_t v28;
  _OWORD *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  char v56;
  char *v57;
  uint64_t v58;
  void (*v59)(char *, char *, uint64_t);
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char v82;
  _BYTE v83[7];
  _BYTE v84[7];
  char v85;
  _BYTE v86[7];
  _BYTE v87[7];
  char v88;
  char v89;
  char v90;
  _BYTE v91[168];
  _BYTE v92[168];
  _QWORD v93[2];
  char v94;
  _BYTE v95[7];
  uint64_t v96;
  uint64_t v97;
  char v98;
  _BYTE v99[7];
  uint64_t v100;
  uint64_t v101;
  char v102;
  _BYTE v103[7];
  char v104;
  _BYTE v105[7];
  __int128 v106;
  __int128 v107;
  char v108;
  _BYTE v109[7];
  char v110;
  _BYTE v111[7];
  __int128 v112;
  __int128 v113;
  char v114;
  _DWORD v115[44];

  v76 = a2;
  v77 = a1;
  v2 = type metadata accessor for AccessibilityChildBehavior();
  v74 = *(_QWORD *)(v2 - 8);
  v75 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v73 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = type metadata accessor for RoundedRectangle();
  MEMORY[0x24BDAC7A8](v72);
  v71 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LACUIAuthCountdownDelayView();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>);
  MEMORY[0x24BDAC7A8](v67);
  v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v68);
  v15 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>);
  MEMORY[0x24BDAC7A8](v69);
  v17 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v70);
  v19 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.accessibilityElement(children:)>>.0);
  v79 = *(_QWORD *)(v81 - 8);
  v20 = MEMORY[0x24BDAC7A8](v81);
  v80 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v78 = (char *)&v66 - v22;
  outlined init with copy of LACUIAuthCountdownConfiguration(v77, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayView);
  v23 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v24 = swift_allocObject();
  outlined init with take of LACUIAuthCountdownDelayConfiguration((uint64_t)v8, v24 + v23, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayView);
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  *((_QWORD *)v10 + 2) = partial apply for closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter;
  *((_QWORD *)v10 + 3) = v24;
  v25 = (uint64_t *)&v10[*(int *)(v67 + 40)];
  *v25 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  swift_storeEnumTagMultiPayload();
  static Alignment.center.getter();
  specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v13, 0.0, 1, 0.0, 1);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v10, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>);
  LOBYTE(v10) = static Edge.Set.all.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v13, (uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>);
  v26 = &v15[*(int *)(v68 + 36)];
  *v26 = (char)v10;
  *(_OWORD *)(v26 + 8) = 0u;
  *(_OWORD *)(v26 + 24) = 0u;
  v26[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v13, &demangling cache variable for type metadata for ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>);
  v27 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemBackgroundColor);
  v28 = MEMORY[0x242687EBC](v27);
  v29 = v71;
  v30 = &v71[*(int *)(v72 + 20)];
  v31 = *MEMORY[0x24BDEEB68];
  v32 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(v30, v31, v32);
  __asm { FMOV            V0.2D, #8.0 }
  *v29 = _Q0;
  v38 = (uint64_t *)&v17[*(int *)(v69 + 36)];
  v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _InsettableBackgroundShapeModifier<Color, RoundedRectangle>);
  outlined init with copy of LACUIAuthCountdownConfiguration((uint64_t)v29, (uint64_t)v38 + *(int *)(v39 + 52), (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *v38 = v28;
  *(_WORD *)((char *)v38 + *(int *)(v39 + 56)) = 256;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v15, (uint64_t)v17, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>);
  outlined destroy of RoundedRectangle((uint64_t)v29);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>);
  LOBYTE(v28) = static Edge.Set.horizontal.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v17, (uint64_t)v19, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>);
  v40 = &v19[*(int *)(v70 + 36)];
  *v40 = v28;
  *(_OWORD *)(v40 + 8) = 0u;
  *(_OWORD *)(v40 + 24) = 0u;
  v40[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v17, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>);
  v41 = v73;
  static AccessibilityChildBehavior.combine.getter();
  lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout>, (uint64_t (*)(void))lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>> and conformance <> ModifiedContent<A, B>);
  v42 = v80;
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v74 + 8))(v41, v75);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v19, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout>);
  (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v78, v42, v81);
  if (*(_QWORD *)(v77 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 24) + 8))
  {
    v77 = static VerticalAlignment.center.getter();
    swift_bridgeObjectRetain();
    static Font.footnote.getter();
    v43 = Text.font(_:)();
    v45 = v44;
    v47 = v46;
    swift_bridgeObjectRelease();
    swift_release();
    v48 = v47 & 1;
    v115[0] = static HierarchicalShapeStyle.secondary.getter();
    v49 = Text.foregroundStyle<A>(_:)();
    v51 = v50;
    v53 = v52;
    v55 = v54 & 1;
    outlined consume of Text.Storage(v43, v45, v48);
    swift_bridgeObjectRelease();
    outlined copy of Text.Storage(v49, v51, v55);
    swift_bridgeObjectRetain();
    outlined consume of Text.Storage(v49, v51, v55);
    swift_bridgeObjectRelease();
    LOBYTE(v43) = static Edge.Set.horizontal.getter();
    v56 = static Edge.Set.horizontal.getter();
    v90 = 1;
    v89 = v55;
    v88 = 1;
    v85 = 1;
    v82 = 1;
    v93[0] = v77;
    v93[1] = 0;
    v94 = 1;
    *(_DWORD *)v95 = *(_DWORD *)v92;
    *(_DWORD *)&v95[3] = *(_DWORD *)&v92[3];
    v96 = v49;
    v97 = v51;
    v98 = v55;
    *(_DWORD *)&v99[3] = *(_DWORD *)&v91[3];
    *(_DWORD *)v99 = *(_DWORD *)v91;
    v100 = v53;
    v101 = 0;
    v102 = 1;
    *(_DWORD *)v103 = *(_DWORD *)v87;
    *(_DWORD *)&v103[3] = *(_DWORD *)&v87[3];
    v104 = v43;
    *(_DWORD *)&v105[3] = *(_DWORD *)&v86[3];
    *(_DWORD *)v105 = *(_DWORD *)v86;
    v106 = 0u;
    v107 = 0u;
    v108 = 1;
    *(_DWORD *)v109 = *(_DWORD *)v84;
    *(_DWORD *)&v109[3] = *(_DWORD *)&v84[3];
    v110 = v56;
    *(_DWORD *)v111 = *(_DWORD *)v83;
    *(_DWORD *)&v111[3] = *(_DWORD *)&v83[3];
    v112 = 0u;
    v113 = 0u;
    v114 = 1;
    destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle(v93);
  }
  else
  {
    _s7SwiftUI15ModifiedContentVyACyAA6HStackVyAA9TupleViewVyAA4TextV_AA6SpacerVtGGAA14_PaddingLayoutVGAOGSgWOi0_((uint64_t)v93);
  }
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v93, (uint64_t)v115, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  v58 = v79;
  v57 = v80;
  v59 = *(void (**)(char *, char *, uint64_t))(v79 + 16);
  v60 = v78;
  v61 = v81;
  v59(v80, v78, v81);
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v115, (uint64_t)v91, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  v62 = v76;
  v59(v76, v57, v61);
  v63 = (uint64_t)&v62[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?))
                             + 48)];
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v91, (uint64_t)v92, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v92, v63, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v92, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined copy of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  v64 = *(void (**)(char *, uint64_t))(v58 + 8);
  v64(v60, v61);
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v91, (uint64_t)v93, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v93, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?);
  return ((uint64_t (*)(char *, uint64_t))v64)(v57, v61);
}

uint64_t closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t KeyPath;
  uint64_t v50;
  uint64_t v51;

  v4 = type metadata accessor for LACUIAuthCountdownDelayView();
  v5 = *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64);
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v44 = (uint64_t)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Date();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v40 - v12;
  v14 = type metadata accessor for PeriodicTimelineSchedule();
  v42 = *(_QWORD *)(v14 - 8);
  v43 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v41 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v40 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>);
  v51 = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v47 = (char *)&v40 - v23;
  v24 = a1[1];
  v50 = *a1;
  v48 = v24;
  KeyPath = swift_getKeyPath();
  swift_bridgeObjectRetain();
  static Date.now.getter();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  PeriodicTimelineSchedule.init(from:by:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  v25 = v44;
  outlined init with copy of LACUIAuthCountdownConfiguration((uint64_t)a1, v44, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayView);
  v26 = (*(unsigned __int8 *)(v45 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  v27 = swift_allocObject();
  outlined init with take of LACUIAuthCountdownDelayConfiguration(v25, v27 + v26, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayView);
  v28 = v42;
  v29 = v43;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v41, v18, v43);
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = partial apply for closure #1 in closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter;
  *(_QWORD *)(v30 + 24) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Text, AccessibilityAttachmentModifier>);
  lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type PeriodicTimelineSchedule and conformance PeriodicTimelineSchedule, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0570], MEMORY[0x24BDF0568]);
  lazy protocol witness table accessor for type ModifiedContent<Text, AccessibilityAttachmentModifier> and conformance <> ModifiedContent<A, B>();
  TimelineView<>.init(_:content:)();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v18, v29);
  v31 = v51;
  v32 = v47;
  (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v47, v22, v19);
  v33 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v33(v22, v32, v19);
  v35 = KeyPath;
  v34 = v50;
  v36 = v48;
  *(_QWORD *)a2 = v50;
  *(_QWORD *)(a2 + 8) = v36;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a2 + 32) = v35;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = 0;
  *(_BYTE *)(a2 + 56) = 1;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>));
  v33((char *)(a2 + *(int *)(v37 + 64)), v22, v19);
  outlined copy of Text.Storage(v34, v36, 0);
  v38 = *(void (**)(char *, uint64_t))(v31 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  v38(v32, v19);
  v38(v22, v19);
  outlined consume of Text.Storage(v34, v36, 0);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v4 = type metadata accessor for AccessibilityTraits();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v62 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = type metadata accessor for Date.ComponentsFormatStyle.Style();
  v55 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v54 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = type metadata accessor for Date.ComponentsFormatStyle();
  v58 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v56 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Date>);
  MEMORY[0x24BDAC7A8](v9);
  v53 = (uint64_t)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Duration.TimeFormatStyle.Pattern();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Duration.TimeFormatStyle();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Text, AccessibilityAttachmentModifier>);
  MEMORY[0x24BDAC7A8](v19);
  v61 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v59 = a1;
  result = Date.timeIntervalSinceNow.getter();
  if (v22 < 0.0)
    v22 = 0.0;
  if ((~*(_QWORD *)&v22 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v22 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v22 < 9.22337204e18)
  {
    Duration.init(secondsComponent:attosecondsComponent:)();
    v52 = a2;
    static Duration.TimeFormatStyle.Pattern.minuteSecond.getter();
    static FormatStyle<>.time(pattern:)();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type Duration.TimeFormatStyle and conformance Duration.TimeFormatStyle, (uint64_t (*)(uint64_t))MEMORY[0x24BDD08D0], MEMORY[0x24BDD08C8]);
    Duration.formatted<A>(_:)();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    v67 = v63;
    v68 = v64;
    lazy protocol witness table accessor for type String and conformance String();
    v23 = Text.init<A>(_:)();
    v25 = v24;
    v27 = v26 & 1;
    v28 = Text.monospacedDigit()();
    v51 = v4;
    v30 = v29;
    v50 = v5;
    v32 = v31 & 1;
    outlined consume of Text.Storage(v23, v25, v27);
    swift_bridgeObjectRelease();
    LODWORD(v63) = static HierarchicalShapeStyle.secondary.getter();
    v33 = Text.foregroundStyle<A>(_:)();
    v35 = v34;
    LOBYTE(v25) = v36 & 1;
    outlined consume of Text.Storage(v28, v30, v32);
    swift_bridgeObjectRelease();
    v37 = v53;
    LACUIAuthCountdownDelayView.expirationRange.getter(v53);
    v38 = v54;
    static Date.ComponentsFormatStyle.Style.wide.getter();
    v39 = v56;
    static FormatStyle<>.components(style:fields:)();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v38, v57);
    lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type Date.ComponentsFormatStyle and conformance Date.ComponentsFormatStyle, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE760], MEMORY[0x24BDCE758]);
    v40 = v60;
    Range<>.formatted<A>(_:)();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v39, v40);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v37, &demangling cache variable for type metadata for Range<Date>);
    v67 = v63;
    v68 = v64;
    v41 = Text.accessibilityLabel<A>(_:)();
    v43 = v42;
    LOBYTE(v39) = v44;
    v46 = v45;
    outlined consume of Text.Storage(v33, v35, v25);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v63 = v41;
    v64 = v43;
    v65 = v39 & 1;
    v66 = v46;
    v47 = v62;
    static AccessibilityTraits.updatesFrequently.getter();
    v48 = (uint64_t)v61;
    View.accessibilityAddTraits(_:)();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v47, v51);
    outlined consume of Text.Storage(v63, v64, v65);
    swift_bridgeObjectRelease();
    return outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v48, v52, &demangling cache variable for type metadata for ModifiedContent<Text, AccessibilityAttachmentModifier>);
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t LACUIAuthCountdownDelayView.init(configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return outlined init with take of LACUIAuthCountdownDelayConfiguration(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
}

uint64_t associated type witness table accessor for View.Body : View in LACUIAuthCountdownDelayView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t protocol witness for View.body.getter in conformance LACUIAuthCountdownDelayView@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = static HorizontalAlignment.center.getter();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>>);
  return closure #1 in LACUIAuthCountdownDelayView.body.getter(v1, (char *)(a1 + *(int *)(v3 + 44)));
}

uint64_t *initializeBufferWithCopyOfBuffer for LACUIAuthCountdownDelayView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = v4;
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(v4 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for Date();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(v6 + 24);
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for LACUIAuthCountdownDelayView(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  v2 = a1 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 20);
  v3 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for LACUIAuthCountdownDelayView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v6 = *(int *)(v5 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for Date();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = *(int *)(v5 + 24);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for LACUIAuthCountdownDelayView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v5 = *(int *)(v4 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 24))(v6, v7, v8);
  v9 = *(int *)(v4 + 24);
  v10 = (_QWORD *)((char *)a1 + v9);
  v11 = (_QWORD *)((char *)a2 + v9);
  *v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for LACUIAuthCountdownDelayView(_OWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v5 = *(int *)(v4 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  *(_OWORD *)((char *)a1 + *(int *)(v4 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v4 + 24));
  return a1;
}

_QWORD *assignWithTake for LACUIAuthCountdownDelayView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v6 = *(int *)(v5 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = *(int *)(v5 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v14 = *v12;
  v13 = v12[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthCountdownDelayView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240ABC190(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for LACUIAuthCountdownDelayView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240ABC1D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for LACUIAuthCountdownDelayView()
{
  uint64_t result;

  result = type metadata singleton initialization cache for LACUIAuthCountdownDelayView;
  if (!type metadata singleton initialization cache for LACUIAuthCountdownDelayView)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for LACUIAuthCountdownDelayView()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_240ABC2BC()
{
  return lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>, &demangling cache variable for type metadata for VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>>, MEMORY[0x24BDF4700]);
}

uint64_t outlined init with take of LACUIAuthCountdownDelayConfiguration(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LACUIAuthCountdownDelayView() - 8) + 80);
  return closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter((uint64_t *)(v1 + ((v3 + 16) & ~v3)), a1);
}

uint64_t outlined destroy of RoundedRectangle(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, (uint64_t (*)(void))lazy protocol witness table accessor for type ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>);
    v2[1] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _InsettableBackgroundShapeModifier<Color, RoundedRectangle> and conformance _InsettableBackgroundShapeModifier<A, B>, &demangling cache variable for type metadata for _InsettableBackgroundShapeModifier<Color, RoundedRectangle>, MEMORY[0x24BDF1330]);
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>, _PaddingLayout>, _InsettableBackgroundShapeModifier<Color, RoundedRectangle>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>);
    v2[0] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>> and conformance DynamicStack<A>, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, (uint64_t)&protocol conformance descriptor for DynamicStack<A>);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242688798](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

double _s7SwiftUI15ModifiedContentVyACyAA6HStackVyAA9TupleViewVyAA4TextV_AA6SpacerVtGGAA14_PaddingLayoutVGAOGSgWOi0_(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 160) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t outlined copy of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t result;

  if (a7)
  {
    outlined copy of Text.Storage(a4, a5, a6 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined copy of Text.Storage(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t outlined retain of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 160);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    v4);
  return a1;
}

uint64_t outlined consume of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t result;

  if (a7)
  {
    outlined consume of Text.Storage(a4, a5, a6 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined consume of Text.Storage(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t specialized closure #1 in TimelineView<>.init(_:content:)(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimelineView<EveryMinuteTimelineSchedule, Never>.Context);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>.Context);
  if (*(_QWORD *)(*(_QWORD *)(result - 8) + 64) == v6)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
    a2((char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))((char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LACUIAuthCountdownDelayView() - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  swift_bridgeObjectRelease();
  v3 = v2 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 20);
  v4 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LACUIAuthCountdownDelayView() - 8) + 80);
  return closure #1 in closure #1 in closure #1 in LACUIAuthCountdownDelayView.body.getter(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_240ABC8A8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for specialized closure #1 in TimelineView<>.init(_:content:)(uint64_t a1)
{
  uint64_t v1;

  return specialized closure #1 in TimelineView<>.init(_:content:)(a1, *(void (**)(char *))(v1 + 16));
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<Text, AccessibilityAttachmentModifier> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<Text, AccessibilityAttachmentModifier> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<Text, AccessibilityAttachmentModifier> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<Text, AccessibilityAttachmentModifier>);
    v2 = lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type AccessibilityAttachmentModifier and conformance AccessibilityAttachmentModifier, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Text, AccessibilityAttachmentModifier> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x242688798](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x242688798](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t LACUIAuthCountdownDelayConfiguration.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthCountdownDelayConfiguration.title.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LACUIAuthCountdownDelayConfiguration.title.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownDelayConfiguration.expiration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 20);
  v4 = type metadata accessor for Date();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for LACUIAuthCountdownDelayConfiguration()
{
  uint64_t result;

  result = type metadata singleton initialization cache for LACUIAuthCountdownDelayConfiguration;
  if (!type metadata singleton initialization cache for LACUIAuthCountdownDelayConfiguration)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t LACUIAuthCountdownDelayConfiguration.expiration.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 20);
  v4 = type metadata accessor for Date();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*LACUIAuthCountdownDelayConfiguration.expiration.modify())(_QWORD)
{
  type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownDelayConfiguration.caption.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthCountdownDelayConfiguration.caption.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for LACUIAuthCountdownDelayConfiguration() + 24));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*LACUIAuthCountdownDelayConfiguration.caption.modify())(_QWORD)
{
  type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownDelayConfiguration.init(title:expiration:caption:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;
  uint64_t result;

  v12 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v13 = (_QWORD *)((char *)a6 + *(int *)(v12 + 24));
  *a6 = a1;
  a6[1] = a2;
  v14 = (char *)a6 + *(int *)(v12 + 20);
  v15 = type metadata accessor for Date();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14, a3, v15);
  *v13 = a4;
  v13[1] = a5;
  return result;
}

uint64_t specialized static LACUIAuthCountdownDelayConfiguration.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v5 & 1) != 0))
  {
    v7 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    if ((static Date.== infix(_:_:)() & 1) != 0)
    {
      v8 = *(int *)(v7 + 24);
      v9 = (_QWORD *)((char *)a1 + v8);
      v10 = *(_QWORD *)((char *)a1 + v8 + 8);
      v11 = (_QWORD *)((char *)a2 + v8);
      v12 = v11[1];
      if (v10)
      {
        if (v12)
        {
          v13 = *v9 == *v11 && v10 == v12;
          if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            return 1;
        }
      }
      else if (!v12)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LACUIAuthCountdownDelayConfiguration(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for Date();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 24);
    v14 = (uint64_t *)((char *)v4 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for LACUIAuthCountdownDelayConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for LACUIAuthCountdownDelayConfiguration(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for Date();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 24);
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for LACUIAuthCountdownDelayConfiguration(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for LACUIAuthCountdownDelayConfiguration(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithTake for LACUIAuthCountdownDelayConfiguration(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthCountdownDelayConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240ABD0BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for Date();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for LACUIAuthCountdownDelayConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240ABD144(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for Date();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata completion function for LACUIAuthCountdownDelayConfiguration()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t LACUIRatchetViewModelConfiguration.countdownPrimaryActionTitle.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void LACUIRatchetViewModelConfiguration.presentationStyle.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

LocalAuthenticationCoreUI::LACUIRatchetViewModelConfiguration __swiftcall LACUIRatchetViewModelConfiguration.init(countdownPrimaryActionTitle:presentationStyle:)(Swift::String_optional countdownPrimaryActionTitle, LocalAuthenticationCoreUI::LACUIRatchetViewModelPresentationStyle presentationStyle)
{
  uint64_t v2;
  char v3;
  LocalAuthenticationCoreUI::LACUIRatchetViewModelConfiguration result;

  v3 = *(_BYTE *)presentationStyle;
  *(Swift::String_optional *)v2 = countdownPrimaryActionTitle;
  *(_BYTE *)(v2 + 16) = v3;
  result.countdownPrimaryActionTitle = countdownPrimaryActionTitle;
  result.presentationStyle = presentationStyle;
  return result;
}

uint64_t destroy for LACUIRatchetViewModelConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for LACUIRatchetViewModelConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LACUIRatchetViewModelConfiguration(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for LACUIRatchetViewModelConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIRatchetViewModelConfiguration(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LACUIRatchetViewModelConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIRatchetViewModelConfiguration()
{
  return &type metadata for LACUIRatchetViewModelConfiguration;
}

uint64_t key path getter for LACUILockViewModel.state : LACUILockViewModel@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t key path setter for LACUILockViewModel.state : LACUILockViewModel(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 104))(*a1);
}

uint64_t LACUILockViewModel.state.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_240ABD4D8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t sub_240ABD508(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 104))(*a1);
}

uint64_t LACUILockViewModel.state.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return static Published.subscript.setter();
}

uint64_t (*LACUILockViewModel.state.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return LACUILockViewModel.state.modify;
}

uint64_t key path setter for LACUILockViewModel.$state : LACUILockViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUILockViewState>.Publisher);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 128))(v6);
}

uint64_t LACUILockViewModel.$state.getter()
{
  return LACUILockViewModel.$state.getter((uint64_t)&OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__state, &demangling cache variable for type metadata for Published<LACUILockViewState>);
}

uint64_t LACUILockViewModel.$state.setter(uint64_t a1)
{
  return LACUILockViewModel.$state.setter(a1, &demangling cache variable for type metadata for Published<LACUILockViewState>.Publisher, (uint64_t)&OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__state, &demangling cache variable for type metadata for Published<LACUILockViewState>);
}

uint64_t (*LACUILockViewModel.$state.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUILockViewState>.Publisher);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__state;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUILockViewState>);
  Published.projectedValue.getter();
  swift_endAccess();
  return LACUILockViewModel.$state.modify;
}

uint64_t key path getter for LACUILockViewModel.color : LACUILockViewModel@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 144))();
  *a2 = result;
  return result;
}

uint64_t key path setter for LACUILockViewModel.color : LACUILockViewModel(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(_QWORD **)a2 + 152))(*a1);
}

uint64_t LACUILockViewModel.color.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_240ABD874@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 144))();
  *a2 = result;
  return result;
}

uint64_t sub_240ABD8A4(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(_QWORD **)a2 + 152))(*a1);
}

uint64_t LACUILockViewModel.color.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return static Published.subscript.setter();
}

uint64_t (*LACUILockViewModel.color.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return LACUILockViewModel.state.modify;
}

void LACUILockViewModel.state.modify(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t key path setter for LACUILockViewModel.$color : LACUILockViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIColor>.Publisher);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 176))(v6);
}

uint64_t LACUILockViewModel.$color.getter()
{
  return LACUILockViewModel.$state.getter((uint64_t)&OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__color, &demangling cache variable for type metadata for Published<UIColor>);
}

uint64_t LACUILockViewModel.$state.getter(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  Published.projectedValue.getter();
  return swift_endAccess();
}

uint64_t LACUILockViewModel.$color.setter(uint64_t a1)
{
  return LACUILockViewModel.$state.setter(a1, &demangling cache variable for type metadata for Published<UIColor>.Publisher, (uint64_t)&OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__color, &demangling cache variable for type metadata for Published<UIColor>);
}

uint64_t LACUILockViewModel.$state.setter(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*LACUILockViewModel.$color.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIColor>.Publisher);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__color;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIColor>);
  Published.projectedValue.getter();
  swift_endAccess();
  return LACUILockViewModel.$state.modify;
}

void LACUILockViewModel.$state.modify(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    Published.projectedValue.setter();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    Published.projectedValue.setter();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t LACUILockViewModel.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  type metadata accessor for LACUILockViewState(0);
  Published.init(initialValue:)();
  objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  type metadata accessor for UIColor();
  Published.init(initialValue:)();
  return v0;
}

uint64_t LACUILockViewModel.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  id v13;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIColor>);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUILockViewState>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__state;
  v13 = 0;
  type metadata accessor for LACUILockViewState(0);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  v10 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__color;
  v13 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  type metadata accessor for UIColor();
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v10, v4, v1);
  return v0;
}

unint64_t type metadata accessor for UIColor()
{
  unint64_t result;

  result = lazy cache variable for type metadata for UIColor;
  if (!lazy cache variable for type metadata for UIColor)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for UIColor);
  }
  return result;
}

uint64_t LACUILockViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUILockViewState>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__color;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIColor>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t LACUILockViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUILockViewState>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI18LACUILockViewModel__color;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UIColor>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance LACUILockViewModel@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for LACUILockViewModel();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_240ABE13C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 120))();
}

uint64_t sub_240ABE168(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 168))();
}

uint64_t ObjC metadata update function for LACUILockViewModel()
{
  return type metadata accessor for LACUILockViewModel();
}

uint64_t type metadata accessor for LACUILockViewModel()
{
  uint64_t result;

  result = type metadata singleton initialization cache for LACUILockViewModel;
  if (!type metadata singleton initialization cache for LACUILockViewModel)
    return swift_getSingletonMetadata();
  return result;
}

void type metadata completion function for LACUILockViewModel()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for Published<LACUILockViewState>(319, &lazy cache variable for type metadata for Published<LACUILockViewState>, type metadata accessor for LACUILockViewState);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Published<LACUILockViewState>(319, &lazy cache variable for type metadata for Published<UIColor>, (void (*)(uint64_t))type metadata accessor for UIColor);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for LACUILockViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LACUILockViewModel.state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of LACUILockViewModel.state.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of LACUILockViewModel.state.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of LACUILockViewModel.$state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of LACUILockViewModel.$state.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of LACUILockViewModel.$state.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of LACUILockViewModel.color.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of LACUILockViewModel.color.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of LACUILockViewModel.color.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of LACUILockViewModel.$color.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of LACUILockViewModel.$color.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of LACUILockViewModel.$color.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of LACUILockViewModel.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

void type metadata accessor for Published<LACUILockViewState>(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = type metadata accessor for Published();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t LACUIRatchetViewModel.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_configuration + 8);
  v3 = *(_BYTE *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_configuration + 16);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_configuration);
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t LACUIRatchetViewModel.statePublisher.getter()
{
  return LACUIRatchetViewModel.statePublisher.getter((void (*)(void))LACUIRatchetViewModel.stateSubject.getter, &demangling cache variable for type metadata for CurrentValueSubject<LACUIRatchetViewModel.State, Never>, &lazy protocol witness table cache variable for type CurrentValueSubject<LACUIRatchetViewModel.State, Never> and conformance CurrentValueSubject<A, B>, MEMORY[0x24BDB9D10]);
}

uint64_t LACUIRatchetViewModel.learnMorePublisher.getter()
{
  return LACUIRatchetViewModel.statePublisher.getter((void (*)(void))LACUIRatchetViewModel.learnMoreSubject.getter, &demangling cache variable for type metadata for PassthroughSubject<(), Never>, &lazy protocol witness table cache variable for type PassthroughSubject<(), Never> and conformance PassthroughSubject<A, B>, MEMORY[0x24BDB9CB0]);
}

uint64_t LACUIRatchetViewModel.statePublisher.getter(void (*a1)(void), uint64_t *a2, unint64_t *a3, uint64_t a4)
{
  uint64_t v7;

  a1();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(a3, a2, a4);
  v7 = Publisher.eraseToAnyPublisher()();
  swift_release();
  return v7;
}

uint64_t LACUIRatchetViewModel.isInvalidated.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isInvalidated);
  swift_beginAccess();
  return *v1;
}

uint64_t key path setter for LACUIRatchetViewModel.state : LACUIRatchetViewModel(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE v15[24];

  v4 = type metadata accessor for LACUIRatchetViewModel.State(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = &v15[-v9];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v15[-v11];
  outlined init with copy of LACUIRatchetViewModel.State(a1, (uint64_t)&v15[-v11]);
  v13 = *a2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_state;
  swift_beginAccess();
  outlined init with copy of LACUIRatchetViewModel.State(v13, (uint64_t)v10);
  swift_beginAccess();
  outlined assign with copy of LACUIRatchetViewModel.State((uint64_t)v12, v13);
  swift_endAccess();
  outlined init with copy of LACUIRatchetViewModel.State(v13, (uint64_t)v7);
  LACUIRatchetViewModel.stateUpdated(from:to:)((uint64_t)v10, (uint64_t)v7);
  outlined destroy of LACUIAuthCountdownView((uint64_t)v7, type metadata accessor for LACUIRatchetViewModel.State);
  outlined destroy of LACUIAuthCountdownView((uint64_t)v12, type metadata accessor for LACUIRatchetViewModel.State);
  return outlined destroy of LACUIAuthCountdownView((uint64_t)v10, type metadata accessor for LACUIRatchetViewModel.State);
}

void LACUIRatchetViewModel.stateUpdated(from:to:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  Swift::String v23;
  Swift::String v24;
  Swift::String v25;
  Swift::String v26;
  void *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  Swift::String v32;

  v3 = v2;
  v6 = type metadata accessor for LACUIRatchetViewModel.State(0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v29 - v10;
  v12 = type metadata accessor for LACLogger();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  specialized static LACUIRatchetViewModel.State.== infix(_:_:)(a1, a2);
  if ((v16 & 1) == 0)
  {
    static LACLogger.dtoUI.getter();
    v32._countAndFlagsBits = 0;
    v32._object = (void *)0xE000000000000000;
    v30 = v12;
    _StringGuts.grow(_:)(32);
    v17 = objc_msgSend(v3, sel_description);
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v31 = v3;
    v29 = v13;
    v19 = a2;
    v20 = v18;
    v22 = v21;

    swift_bridgeObjectRelease();
    v32._countAndFlagsBits = v20;
    v32._object = v22;
    v23._object = (void *)0x8000000240AE3DE0;
    v23._countAndFlagsBits = 0xD000000000000015;
    String.append(_:)(v23);
    outlined init with copy of LACUIRatchetViewModel.State(a1, (uint64_t)v11);
    v24._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    v25._countAndFlagsBits = 0x203A6F7420;
    v25._object = (void *)0xE500000000000000;
    String.append(_:)(v25);
    outlined init with copy of LACUIRatchetViewModel.State(v19, (uint64_t)v11);
    v26._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v26);
    swift_bridgeObjectRelease();
    LACLogger.log(_:)(v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v30);
    outlined init with copy of LACUIRatchetViewModel.State(v19, (uint64_t)v9);
    if (swift_getEnumCaseMultiPayload() == 4)
    {
      v27 = (void *)*((_QWORD *)v9 + 1);
      swift_bridgeObjectRelease();

      v28 = &v31[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isRunning];
      swift_beginAccess();
      *v28 = 0;
    }
    else
    {
      outlined destroy of LACUIAuthCountdownView((uint64_t)v9, type metadata accessor for LACUIRatchetViewModel.State);
    }
    LACUIRatchetViewModel.stateSubject.getter();
    outlined init with copy of LACUIRatchetViewModel.State(v19, (uint64_t)v11);
    CurrentValueSubject.value.setter();
    swift_release();
  }
}

uint64_t LACUIRatchetViewModel.state.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_state;
  swift_beginAccess();
  return outlined init with copy of LACUIRatchetViewModel.State(v3, a1);
}

uint64_t LACUIRatchetViewModel.isRunning.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isRunning);
  swift_beginAccess();
  return *v1;
}

uint64_t LACUIRatchetViewModel.stateSubject.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0;
  v2 = type metadata accessor for LACUIRatchetViewModel.State(0);
  MEMORY[0x24BDAC7A8](v2);
  v3 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___stateSubject;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___stateSubject))
  {
    v4 = *(_QWORD *)(v0
                   + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___stateSubject);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentValueSubject<LACUIRatchetViewModel.State, Never>);
    swift_allocObject();
    v4 = CurrentValueSubject.init(_:)();
    *(_QWORD *)(v1 + v3) = v4;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v4;
}

uint64_t LACUIRatchetViewModel.learnMoreSubject.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___learnMoreSubject;
  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___learnMoreSubject))
  {
    v2 = *(_QWORD *)(v0
                   + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___learnMoreSubject);
  }
  else
  {
    v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PassthroughSubject<(), Never>);
    swift_allocObject();
    v2 = PassthroughSubject.init()();
    *(_QWORD *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t LACUIRatchetViewModel.ratchetIdentifier.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;

  v1 = (uint64_t *)(v0
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___ratchetIdentifier);
  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___ratchetIdentifier
                 + 8))
  {
    v2 = *v1;
  }
  else
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v4 = objc_msgSend(v3, sel_bundleIdentifier);

    if (v4)
    {
      v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v6 = v5;

    }
    else
    {
      v2 = 0;
      v6 = 0xE000000000000000;
    }
    *v1 = v2;
    v1[1] = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

id LACUIRatchetViewModel.ratchetManager.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_ratchetManager);
  swift_beginAccess();
  return *v1;
}

void LACUIRatchetViewModel.ratchetManager.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_ratchetManager);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*LACUIRatchetViewModel.ratchetManager.modify())()
{
  swift_beginAccess();
  return LACUIRatchetViewModel.ratchetManager.modify;
}

id LACUIRatchetViewModel.context.getter()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___context;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___context))
  {
    v2 = *(id *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___context);
  }
  else
  {
    v2 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_contextProvider), sel_createContext);
    *(_QWORD *)(v0 + v1) = v2;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

id LACUIRatchetViewModel.__allocating_init(contextProvider:options:configuration:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = specialized LACUIRatchetViewModel.init(contextProvider:options:configuration:)(a1, a2, a3);
  swift_unknownObjectRelease();
  return v8;
}

id LACUIRatchetViewModel.init(contextProvider:options:configuration:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  id v3;

  v3 = specialized LACUIRatchetViewModel.init(contextProvider:options:configuration:)(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3;
}

id LACUIRatchetViewModel.__deallocating_deinit()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Swift::String v9;
  objc_class *v10;
  objc_super v12;
  Swift::String v13;

  v1 = type metadata accessor for LACLogger();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static LACLogger.dtoUI.getter();
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  _StringGuts.grow(_:)(16);
  v5 = objc_msgSend(v0, sel_description);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;

  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = v6;
  v13._object = v8;
  v9._countAndFlagsBits = 0x6974696E69656420;
  v9._object = (void *)0xEE0064657A696C61;
  String.append(_:)(v9);
  LACLogger.log(_:)(v13);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v10 = (objc_class *)type metadata accessor for LACUIRatchetViewModel(0);
  v12.receiver = v0;
  v12.super_class = v10;
  return objc_msgSendSuper2(&v12, sel_dealloc);
}

Swift::Void __swiftcall LACUIRatchetViewModel.start()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  v6 = v0;
  v7 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v3, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIRatchetViewModel.start(), (uint64_t)v5);
  v8 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks;
  v9 = *(_QWORD **)&v6[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks];
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v6[v8] = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9[2] + 1, 1, v9);
    *(_QWORD *)&v6[v8] = v9;
  }
  v12 = v9[2];
  v11 = v9[3];
  if (v12 >= v11 >> 1)
  {
    v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v11 > 1), v12 + 1, 1, v9);
    *(_QWORD *)&v6[v8] = v9;
  }
  v9[2] = v12 + 1;
  v9[v12 + 4] = v7;
  swift_release();
}

uint64_t closure #1 in LACUIRatchetViewModel.start()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[5] = a4;
  v5 = type metadata accessor for LACLogger();
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v4[9] = swift_task_alloc();
  v6 = type metadata accessor for LACUIRatchetViewModel.State(0);
  v4[10] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v4[11] = v7;
  v4[12] = *(_QWORD *)(v7 + 64);
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in LACUIRatchetViewModel.start()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 120) = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 40)) + 0x110);
  *(_QWORD *)(v0 + 128) = type metadata accessor for MainActor();
  *(_QWORD *)(v0 + 136) = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(v0 + 120);
  v2 = swift_release();
  *(_BYTE *)(v0 + 176) = v1(v2) & 1;
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Swift::String v9;
  Swift::String v10;

  if ((*(_BYTE *)(v0 + 176) & 1) != 0)
  {
    v2 = *(_QWORD *)(v0 + 56);
    v1 = *(_QWORD *)(v0 + 64);
    v4 = *(void **)(v0 + 40);
    v3 = *(_QWORD *)(v0 + 48);
    static LACLogger.dtoUI.getter();
    _StringGuts.grow(_:)(21);
    v5 = objc_msgSend(v4, sel_description);
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    swift_bridgeObjectRelease();

    v9._object = (void *)0x8000000240AE3F50;
    v9._countAndFlagsBits = 0xD000000000000013;
    String.append(_:)(v9);
    v10._countAndFlagsBits = v6;
    v10._object = v8;
    LACLogger.log(_:)(v10);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 144) = static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    return swift_task_switch();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release();
  v2 = (_BYTE *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isRunning);
  swift_beginAccess();
  *v2 = 1;
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD *v10;

  v2 = v0[13];
  v1 = v0[14];
  v3 = v0[11];
  v4 = v0[9];
  v5 = (void *)v0[5];
  swift_storeEnumTagMultiPayload();
  v6 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
  outlined init with copy of LACUIRatchetViewModel.State(v1, v2);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v5;
  outlined init with take of LACUIAuthCountdownDelayConfiguration(v2, (uint64_t)v8 + v7, type metadata accessor for LACUIRatchetViewModel.State);
  v9 = v5;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v4, (uint64_t)&closure #1 in LACUIRatchetViewModel.set(state:)partial apply, (uint64_t)v8);
  swift_release();
  outlined destroy of LACUIAuthCountdownView(v1, type metadata accessor for LACUIRatchetViewModel.State);
  v10 = (_QWORD *)swift_task_alloc();
  v0[19] = v10;
  *v10 = v0;
  v10[1] = closure #1 in LACUIRatchetViewModel.start();
  return LACUIRatchetViewModel.evaluate()();
}

{
  uint64_t v0;

  LACUIRatchetViewModel.finish(result:error:)(*(_QWORD *)(v0 + 168), 0);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 160);
  v2 = v1;
  LACUIRatchetViewModel.finish(result:error:)(0, (uint64_t)v1);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in LACUIRatchetViewModel.start()(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 160) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 168) = a1;
  return swift_task_switch();
}

uint64_t LACUIRatchetViewModel.evaluate()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[13] = v0;
  v2 = type metadata accessor for LACLogger();
  v1[14] = v2;
  v1[15] = *(_QWORD *)(v2 - 8);
  v1[16] = swift_task_alloc();
  return swift_task_switch();
}

{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  unsigned __int8 v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v1 = (_QWORD *)v0[13];
  v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x178))();
  v3 = objc_msgSend(v2, sel_isFeatureStrictModeEnabled);

  *((_BYTE *)v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isStrictModeEnabled) = v3;
  v4 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  v0[17] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[18] = v5;
  *v5 = v0;
  v5[1] = LACUIRatchetViewModel.evaluate();
  v6 = v0[13];
  v5[23] = v4;
  v5[24] = v6;
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  void *v4;
  id v5;
  unsigned int v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  Swift::String v18;
  Swift::String v19;

  *(_QWORD *)(v0 + 88) = *MEMORY[0x24BE60698];
  v1 = *(_QWORD *)(v0 + 152);
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v1 + 16) && (v2 = specialized __RawDictionaryStorage.find<A>(_:)(v0 + 16), (v3 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(*(_QWORD *)(v0 + 152) + 56) + 32 * v2, v0 + 56);
  }
  else
  {
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
  }
  outlined destroy of AnyHashable(v0 + 16);
  if (*(_QWORD *)(v0 + 80))
  {
    type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for LACDTORatchetStateComposite);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v4 = *(void **)(v0 + 96);
      *(_QWORD *)(v0 + 168) = v4;
      v5 = objc_msgSend(v4, sel_gracePeriodState);
      v6 = objc_msgSend(v5, sel_isActive);

      if (v6)
      {
        v7 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 176) = v7;
        *v7 = v0;
        v7[1] = LACUIRatchetViewModel.evaluate();
        return LACUIRatchetViewModel.showUI(for:)((uint64_t)v4);
      }

    }
  }
  else
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v0 + 56, &demangling cache variable for type metadata for Any?);
  }
  v9 = *(_QWORD *)(v0 + 152);
  v11 = *(_QWORD *)(v0 + 120);
  v10 = *(_QWORD *)(v0 + 128);
  v13 = *(void **)(v0 + 104);
  v12 = *(_QWORD *)(v0 + 112);
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(40);
  v14 = objc_msgSend(v13, sel_description, 0, 0xE000000000000000);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v17 = v16;
  swift_bridgeObjectRelease();

  v18._object = (void *)0x8000000240AE3F90;
  v18._countAndFlagsBits = 0xD000000000000026;
  String.append(_:)(v18);
  v19._countAndFlagsBits = v15;
  v19._object = v17;
  LACLogger.log(_:)(v19);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;

  v1 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 128);
  v5 = *(void **)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 112);
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(40);
  v6 = objc_msgSend(v5, sel_description, 0, 0xE000000000000000);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;

  swift_bridgeObjectRelease();
  v10._object = (void *)0x8000000240AE3F90;
  v10._countAndFlagsBits = 0xD000000000000026;
  String.append(_:)(v10);
  v11._countAndFlagsBits = v7;
  v11._object = v9;
  LACLogger.log(_:)(v11);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

{
  uint64_t v0;

  type metadata accessor for MainActor();
  *(_QWORD *)(v0 + 216) = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  return swift_task_switch();
}

{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD **)(v0 + 104);
  v2 = swift_release();
  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x110))(v2) & 1) != 0)
    *(_BYTE *)(v0 + 248) = (*(uint64_t (**)(void))((*v3 & **(_QWORD **)(v0 + 104)) + 0xE0))() & 1;
  return swift_task_switch();
}

{
  uint64_t v0;
  _QWORD *v2;

  if ((*(_BYTE *)(v0 + 248) & 1) != 0)
  {
    swift_willThrow();

    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 224) = v2;
    *v2 = v0;
    v2[1] = LACUIRatchetViewModel.evaluate();
    return LACUIRatchetViewModel.armIfPossible()();
  }
}

{
  uint64_t v0;

  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 232))
  {
    v1 = *(void **)(v0 + 192);

    v2 = *(_QWORD *)(v0 + 232);
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
  }
  else
  {
    swift_willThrow();

    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  v1 = v0[20];
  v0[24] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[25] = v2;
  *v2 = v0;
  v2[1] = LACUIRatchetViewModel.evaluate();
  v3 = v0[13];
  v2[16] = v1;
  v2[17] = v3;
  return swift_task_switch();
}

{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = (void *)v0[21];
  swift_bridgeObjectRelease();

  v2 = v0[23];
  v0[24] = v2;
  v3 = (_QWORD *)swift_task_alloc();
  v0[25] = v3;
  *v3 = v0;
  v3[1] = LACUIRatchetViewModel.evaluate();
  v4 = v0[13];
  v3[16] = v2;
  v3[17] = v4;
  return swift_task_switch();
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LACUIRatchetViewModel.evaluate()(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 152) = a1;
  *(_QWORD *)(v3 + 160) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 232) = a1;
  *(_QWORD *)(v3 + 240) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t LACUIRatchetViewModel.finish(result:error:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Swift::String v19;
  uint64_t v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  id v32;
  _QWORD *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  Swift::String v43;

  v3 = v2;
  v35 = a1;
  ObjectType = swift_getObjectType();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = type metadata accessor for LACUIRatchetViewModel.State(0);
  v41 = *(_QWORD *)(v38 - 8);
  v8 = *(_QWORD *)(v41 + 64);
  v9 = MEMORY[0x24BDAC7A8](v38);
  v39 = (uint64_t)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v35 - v10);
  v36 = type metadata accessor for LACLogger();
  v12 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = (*(uint64_t (**)(uint64_t))(ObjectType + 576))(a2);
  static LACLogger.dtoUI.getter();
  v43._countAndFlagsBits = 0;
  v43._object = (void *)0xE000000000000000;
  _StringGuts.grow(_:)(38);
  v15 = objc_msgSend(v3, sel_description);
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = v17;

  swift_bridgeObjectRelease();
  v43._countAndFlagsBits = v16;
  v43._object = v18;
  v19._object = (void *)0x8000000240AE3F70;
  v19._countAndFlagsBits = 0xD000000000000018;
  String.append(_:)(v19);
  v20 = v35;
  v42 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]?);
  v21._countAndFlagsBits = Optional.debugDescription.getter();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  v22._countAndFlagsBits = 0x203A726F72726520;
  v22._object = (void *)0xE800000000000000;
  String.append(_:)(v22);
  v42 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error?);
  v23._countAndFlagsBits = Optional.debugDescription.getter();
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  LACLogger.log(_:)(v43);
  swift_bridgeObjectRelease();
  v24 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v36);
  v25 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x178))(v24);
  objc_msgSend(v25, sel_removeObserver_, v3);

  v26 = (void *)v37;
  *v11 = v20;
  v11[1] = v26;
  swift_storeEnumTagMultiPayload();
  v27 = type metadata accessor for TaskPriority();
  v28 = (uint64_t)v40;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v40, 1, 1, v27);
  v29 = v39;
  outlined init with copy of LACUIRatchetViewModel.State((uint64_t)v11, v39);
  v30 = (*(unsigned __int8 *)(v41 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  v31 = (_QWORD *)swift_allocObject();
  v31[2] = 0;
  v31[3] = 0;
  v31[4] = v3;
  outlined init with take of LACUIAuthCountdownDelayConfiguration(v29, (uint64_t)v31 + v30, type metadata accessor for LACUIRatchetViewModel.State);
  swift_bridgeObjectRetain();
  v32 = v26;
  v33 = v3;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v28, (uint64_t)&closure #1 in LACUIRatchetViewModel.set(state:)partial apply, (uint64_t)v31);
  swift_release();

  return outlined destroy of LACUIAuthCountdownView((uint64_t)v11, type metadata accessor for LACUIRatchetViewModel.State);
}

Swift::Void __swiftcall LACUIRatchetViewModel.stop(withReason:invalidate:)(Swift::String withReason, Swift::Bool invalidate)
{
  void *v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  object = withReason._object;
  countAndFlagsBits = withReason._countAndFlagsBits;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = 0;
  *(_QWORD *)(v10 + 32) = v2;
  *(_QWORD *)(v10 + 40) = countAndFlagsBits;
  *(_QWORD *)(v10 + 48) = object;
  *(_BYTE *)(v10 + 56) = invalidate;
  v11 = v2;
  swift_bridgeObjectRetain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIRatchetViewModel.stop(withReason:invalidate:), v10);
  swift_release();
}

uint64_t closure #1 in LACUIRatchetViewModel.stop(withReason:invalidate:)(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int *v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);

  v11 = *(int **)((*MEMORY[0x24BEE4EA0] & *a4) + 0x238);
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v11 + *v11);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v12;
  *v12 = v7;
  v12[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return v14(a5, a6, a7);
}

uint64_t LACUIRatchetViewModel.stop(withReason:invalidate:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v7;

  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = v3;
  *(_BYTE *)(v4 + 56) = a3;
  *(_QWORD *)(v4 + 16) = a1;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 40) = v7;
  *v7 = v4;
  v7[1] = LACUIRatchetViewModel.stop(withReason:invalidate:);
  return LACUIRatchetViewModel.stop(with:)(a1, a2);
}

uint64_t LACUIRatchetViewModel.stop(withReason:invalidate:)()
{
  uint64_t **v0;
  uint64_t *v1;
  int v2;
  uint64_t *v3;
  _QWORD *v4;

  v1 = *v0;
  v2 = *((unsigned __int8 *)*v0 + 56);
  v3 = *v0;
  swift_task_dealloc();
  if (v2 != 1)
    return ((uint64_t (*)(void))v3[1])();
  v4 = (_QWORD *)swift_task_alloc();
  v1[6] = (uint64_t)v4;
  *v4 = v3;
  v4[1] = LACUIRatchetViewModel.stop(withReason:invalidate:);
  return LACUIRatchetViewModel.invalidate(with:)(v1[2], v1[3]);
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t LACUIRatchetViewModel.stop(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
  v3[12] = v4;
  v3[13] = *(_QWORD *)(v4 - 8);
  v3[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  v3[15] = swift_task_alloc();
  v5 = type metadata accessor for LACLogger();
  v3[16] = v5;
  v3[17] = *(_QWORD *)(v5 - 8);
  v3[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t LACUIRatchetViewModel.stop(with:)()
{
  uint64_t v0;

  type metadata accessor for MainActor();
  *(_QWORD *)(v0 + 152) = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  return swift_task_switch();
}

{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _BYTE *v3;

  v1 = *(_QWORD **)(v0 + 88);
  v2 = swift_release();
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x110))(v2) & 1) != 0)
  {
    v3 = (_BYTE *)(*(_QWORD *)(v0 + 88) + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isRunning);
    swift_beginAccess();
    *v3 = 0;
  }
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 120);
  v30 = *(_QWORD *)(v0 + 128);
  v4 = *(void **)(v0 + 88);
  v31 = *(_QWORD *)(v0 + 104);
  v32 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v5 = *(void **)(v0 + 80);
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(26);
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_description);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;

  v11._countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0x6572206874697720;
  v12._object = (void *)0xED0000206E6F7361;
  String.append(_:)(v12);
  v13._countAndFlagsBits = v6;
  v13._object = v5;
  String.append(_:)(v13);
  v14._countAndFlagsBits = 0x676E6970706F7453;
  v14._object = (void *)0xE900000000000020;
  LACLogger.log(_:)(v14);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v30);
  v15 = (uint64_t)v4 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
  swift_beginAccess();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v15, v3, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v3, 1, v32))
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(*(_QWORD *)(v0 + 120), &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 112);
    v17 = *(_QWORD *)(v0 + 120);
    v18 = *(_QWORD *)(v0 + 96);
    v19 = *(_QWORD *)(v0 + 104);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v16, v17, v18);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v17, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    type metadata accessor for CancellationError();
    lazy protocol witness table accessor for type CancellationError and conformance CancellationError();
    v20 = swift_allocError();
    CancellationError.init()();
    *(_QWORD *)(v0 + 64) = v20;
    CheckedContinuation.resume(throwing:)();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v16, v18);
  }
  v21 = *(_QWORD *)(v0 + 88);
  v22 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks;
  v23 = *(_QWORD *)(*(_QWORD *)(v21 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks) + 16);
  if (v23)
  {
    swift_bridgeObjectRetain();
    v24 = 0;
    v25 = MEMORY[0x24BEE4AE0] + 8;
    v26 = MEMORY[0x24BEE4078];
    v27 = MEMORY[0x24BEE40A8];
    do
    {
      ++v24;
      v28 = swift_retain();
      MEMORY[0x242688078](v28, v25, v26, v27);
      swift_release();
    }
    while (v23 != v24);
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)(v21 + v22) = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(void **)(v0 + 80);
  v5 = *(void **)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 72);
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(48);
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_description);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;

  v11._countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._object = (void *)0x8000000240AE3F20;
  v12._countAndFlagsBits = 0xD000000000000023;
  String.append(_:)(v12);
  v13._countAndFlagsBits = v6;
  v13._object = v4;
  String.append(_:)(v13);
  v14._countAndFlagsBits = 0x676E6970706F7453;
  v14._object = (void *)0xE900000000000020;
  LACLogger.log(_:)(v14);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LACUIRatchetViewModel.invalidate(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[22] = a2;
  v3[23] = v2;
  v3[21] = a1;
  v4 = type metadata accessor for LACLogger();
  v3[24] = v4;
  v3[25] = *(_QWORD *)(v4 - 8);
  v3[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t LACUIRatchetViewModel.invalidate(with:)()
{
  uint64_t v0;

  type metadata accessor for MainActor();
  *(_QWORD *)(v0 + 216) = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  return swift_task_switch();
}

{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _BYTE *v3;

  v1 = *(_QWORD **)(v0 + 184);
  v2 = swift_release();
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0xE0))(v2) & 1) == 0)
  {
    v3 = (_BYTE *)(*(_QWORD *)(v0 + 184)
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isInvalidated);
    swift_beginAccess();
    *v3 = 1;
  }
  return swift_task_switch();
}

{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::String v24;

  v1 = v0;
  v4 = v0 + 25;
  v2 = v0[25];
  v3 = v4[1];
  v5 = (_QWORD *)v1[23];
  v6 = v1[24];
  v8 = v1[21];
  v7 = (void *)v1[22];
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease();
  strcpy((char *)&v24, "Invalidating ");
  HIWORD(v24._object) = -4864;
  v9 = objc_msgSend(v5, sel_description);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  v13._countAndFlagsBits = v10;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 0x6572206874697720;
  v14._object = (void *)0xED0000206E6F7361;
  String.append(_:)(v14);
  v15._countAndFlagsBits = v8;
  v15._object = v7;
  String.append(_:)(v15);
  LACLogger.log(_:)(v24);
  swift_bridgeObjectRelease();
  v16 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v1[28] = v16;
  v16(v3, v6);
  objc_msgSend(LACUIRatchetViewModel.context.getter(), sel_invalidate);
  v17 = swift_unknownObjectRelease();
  v18 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v5) + 0x178))(v17);
  v1[29] = v18;
  v19 = LACUIRatchetViewModel.ratchetIdentifier.getter();
  v20 = MEMORY[0x242687FC4](v19);
  v1[30] = v20;
  swift_bridgeObjectRelease();
  v21 = MEMORY[0x242687FC4](v8, v7);
  v1[31] = v21;
  v1[2] = v1;
  v1[3] = LACUIRatchetViewModel.invalidate(with:);
  v22 = swift_continuation_init();
  v1[10] = MEMORY[0x24BDAC760];
  v1 += 10;
  v1[1] = 0x40000000;
  v1[2] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> () with result type ();
  v1[3] = &block_descriptor_43;
  v1[4] = v22;
  objc_msgSend(v18, sel_cancelArmRequestWithIdentifier_reason_completion_, v20, v21, v1);
  return swift_continuation_await();
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 256) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 240);
  v2 = *(void **)(v0 + 248);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  Swift::String v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v4 = *(void **)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 192);
  v6 = *(_QWORD *)(v0 + 168);
  v5 = *(void **)(v0 + 176);
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(56);
  v7._countAndFlagsBits = 0x6164696C61766E49;
  v7._object = (void *)0xED000020676E6974;
  String.append(_:)(v7);
  v8 = objc_msgSend(v4, sel_description);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  v12._countAndFlagsBits = v9;
  v12._object = v11;
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._object = (void *)0x8000000240AE3EF0;
  v13._countAndFlagsBits = 0xD000000000000027;
  String.append(_:)(v13);
  v14._countAndFlagsBits = v6;
  v14._object = v5;
  String.append(_:)(v14);
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  LACLogger.log(_:)(v15);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;

  v2 = *(void **)(v0 + 248);
  v1 = *(void **)(v0 + 256);
  v4 = *(void **)(v0 + 232);
  v3 = *(void **)(v0 + 240);
  v5 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
  v6 = *(_QWORD *)(v0 + 208);
  v8 = *(void **)(v0 + 184);
  v7 = *(_QWORD *)(v0 + 192);
  swift_willThrow();

  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(42);
  *(_QWORD *)(v0 + 144) = 0;
  *(_QWORD *)(v0 + 152) = 0xE000000000000000;
  v9 = objc_msgSend(v8, sel_description);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  v13._countAndFlagsBits = v10;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._object = (void *)0x8000000240AE3EC0;
  v14._countAndFlagsBits = 0xD000000000000026;
  String.append(_:)(v14);
  *(_QWORD *)(v0 + 160) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  _print_unlocked<A, B>(_:_:)();
  LACLogger.log(_:)(*(Swift::String *)(v0 + 144));
  swift_bridgeObjectRelease();

  v5(v6, v7);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id LACUIRatchetViewModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void LACUIRatchetViewModel.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t LACUIRatchetViewModel.ratchetStateDidChange(_:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v7[5] = a1;
  v8 = v1;
  v9 = a1;
  v10 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v5, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:), (uint64_t)v7);
  v11 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks;
  v12 = *(_QWORD **)&v8[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks];
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v8[v11] = v12;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12[2] + 1, 1, v12);
    *(_QWORD *)&v8[v11] = v12;
  }
  v15 = v12[2];
  v14 = v12[3];
  if (v15 >= v14 >> 1)
  {
    v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v14 > 1), v15 + 1, 1, v12);
    *(_QWORD *)&v8[v11] = v12;
  }
  v12[2] = v15 + 1;
  v12[v15 + 4] = v10;
  return swift_release();
}

uint64_t closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[5] = a4;
  v5[6] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v5[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v5[8] = swift_task_alloc();
  v6 = type metadata accessor for LACUIRatchetViewModel.State(0);
  v5[9] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[10] = v7;
  v5[11] = *(_QWORD *)(v7 + 64);
  v5[12] = swift_task_alloc();
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:)()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 120) = type metadata accessor for MainActor();
  *(_QWORD *)(v0 + 128) = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  return swift_task_switch();
}

{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD **)(v0 + 40);
  v2 = swift_release();
  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x110))(v2) & 1) != 0)
  {
    *(_BYTE *)(v0 + 152) = (*(uint64_t (**)(void))((*v3 & **(_QWORD **)(v0 + 40)) + 0xE0))() & 1;
    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 152) & 1) != 0 || (char *)objc_msgSend(*(id *)(v0 + 48), sel_rawValue) - 2 > (char *)2)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 136) = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 40)) + 0xF8);
    *(_QWORD *)(v0 + 144) = static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    return swift_task_switch();
  }
}

{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(v0 + 136);
  v2 = swift_release();
  v1(v2);
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  id v13;

  v1 = *(_QWORD *)(v0 + 112);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v3 = *(_QWORD *)(v0 + 96);
    v2 = *(_QWORD *)(v0 + 104);
    v4 = *(_QWORD *)(v0 + 80);
    v5 = *(_QWORD *)(v0 + 56);
    v6 = *(_QWORD *)(v0 + 64);
    v7 = *(void **)(v0 + 40);
    outlined destroy of LACUIAuthCountdownView(v1, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
    static Date.now.getter();
    v8 = type metadata accessor for Date();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 0, 1, v8);
    v9 = (uint64_t)v7 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_expirationDate;
    swift_beginAccess();
    outlined assign with take of Date?(v6, v9, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    LACUIRatchetViewModel.uiConfiguration.getter(v2);
    swift_storeEnumTagMultiPayload();
    v10 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 1, 1, v10);
    outlined init with copy of LACUIRatchetViewModel.State(v2, v3);
    v11 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = 0;
    v12[3] = 0;
    v12[4] = v7;
    outlined init with take of LACUIAuthCountdownDelayConfiguration(v3, (uint64_t)v12 + v11, type metadata accessor for LACUIRatchetViewModel.State);
    v13 = v7;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v5, (uint64_t)&closure #1 in LACUIRatchetViewModel.set(state:)partial apply, (uint64_t)v12);
    swift_release();
    v1 = v2;
  }
  outlined destroy of LACUIAuthCountdownView(v1, type metadata accessor for LACUIRatchetViewModel.State);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LACUIRatchetViewModel.uiConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t, uint64_t);
  int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  char v32;
  uint64_t v33;
  uint64_t result;
  char **p_name;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;

  v64 = a1;
  v61 = type metadata accessor for LACUIAuthCountdownConfiguration();
  MEMORY[0x24BDAC7A8](v61);
  v57 = (uint64_t)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Date();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v58 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v62 = (char *)&v56 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v59 = (char *)&v56 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v60 = (uint64_t)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v56 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v56 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v56 - v19;
  v21 = v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_expirationDate;
  swift_beginAccess();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v21, (uint64_t)v20, &demangling cache variable for type metadata for Date?);
  v63 = v4;
  v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48);
  v23 = v22(v20, 1, v3);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v20, &demangling cache variable for type metadata for Date?);
  if (v23 == 1)
  {
    v24 = v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_gracePeriodExpirationDate;
    swift_beginAccess();
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v24, (uint64_t)v18, &demangling cache variable for type metadata for Date?);
    LODWORD(v24) = v22(v18, 1, v3);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v18, &demangling cache variable for type metadata for Date?);
    if ((_DWORD)v24 == 1)
    {
      v25 = LACUIRatchetViewModel.beginDelayTitle.getter(MEMORY[0x24BE60648]);
      v27 = v26;
      v28 = LACUIRatchetViewModel.beginDelayText.getter();
      v30 = v29;
      v31 = *(unsigned __int8 *)(v1
                               + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isStrictModeEnabled);
      v32 = LACUIRatchetViewModel.beginDelayLocationWarning.getter();
      v33 = v64;
      static LACUIAuthCountdownConfiguration.begin(title:message:strictModeEnabled:showsLocationWarning:customCancelTitle:)(v25, v27, v28, v30, v31, v32 & 1, 0, 0, v64);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      p_name = (char **)(&LACUIAuthContainerViewModel + 24);
      goto LABEL_21;
    }
  }
  v36 = v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_gracePeriodExpirationDate;
  swift_beginAccess();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v36, (uint64_t)v15, &demangling cache variable for type metadata for Date?);
  if (v22(v15, 1, v3) == 1)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for Date?);
    p_name = (char **)(&LACUIAuthContainerViewModel + 24);
  }
  else
  {
    v37 = v63;
    v38 = v59;
    (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v59, v15, v3);
    v39 = v62;
    static Date.now.getter();
    v40 = static Date.> infix(_:_:)();
    v41 = *(void (**)(char *, uint64_t))(v37 + 8);
    v41(v39, v3);
    p_name = &LACUIAuthContainerViewModel.name;
    if ((v40 & 1) != 0)
    {
      v42 = v57;
      static LACUIAuthCountdownConfiguration.gracePeriod(customCancelTitle:)(0, 0, v57);
      v41(v38, v3);
      v33 = v64;
      result = outlined init with take of LACUIAuthCountdownDelayConfiguration(v42, v64, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
      goto LABEL_21;
    }
    v41(v38, v3);
  }
  v43 = v60;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v21, v60, &demangling cache variable for type metadata for Date?);
  if (v22((char *)v43, 1, v3) != 1)
  {
    v44 = v63;
    v45 = (uint64_t)v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v63 + 32))(v58, v43, v3);
    v46 = v62;
    static Date.now.getter();
    v47 = static Date.> infix(_:_:)();
    v48 = *(void (**)(char *, uint64_t))(v44 + 8);
    v48(v46, v3);
    if ((v47 & 1) == 0)
    {
      v48((char *)v45, v3);
      goto LABEL_20;
    }
    v49 = LACUIRatchetViewModel.beginDelayTitle.getter(MEMORY[0x24BE60670]);
    v33 = v64;
    static LACUIAuthCountdownConfiguration.countdown(message:delayExpiration:customCancelTitle:)(v49, v50, v45, 0, 0, v64);
    swift_bridgeObjectRelease();
    v51 = &p_name[436][v1];
    v52 = *((_QWORD *)v51 + 1);
    if (!v52
      || (v53 = *(int *)(v61 + 36), v54 = *(_QWORD *)(v33 + v53), !*(_QWORD *)(v54 + 16))
      || *(_BYTE *)(v54 + 64))
    {
LABEL_18:
      result = ((uint64_t (*)(uint64_t, uint64_t))v48)(v45, v3);
      goto LABEL_21;
    }
    v55 = *(_QWORD *)v51;
    swift_bridgeObjectRetain();
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0)
    {
      if (*(_QWORD *)(v54 + 16))
      {
LABEL_17:
        *(_QWORD *)(v54 + 48) = v55;
        *(_QWORD *)(v54 + 56) = v52;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v33 + v53) = v54;
        goto LABEL_18;
      }
    }
    else
    {
      result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v54);
      v54 = result;
      if (*(_QWORD *)(result + 16))
        goto LABEL_17;
    }
    __break(1u);
    return result;
  }
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v43, &demangling cache variable for type metadata for Date?);
LABEL_20:
  v33 = v64;
  result = static LACUIAuthCountdownConfiguration.ready(message:customCancelTitle:)(0, 0xE000000000000000, 0, 0, v64);
LABEL_21:
  if ((p_name[436][v1 + 16] & 1) == 0)
    *(_BYTE *)(v33 + *(int *)(v61 + 44)) = 0;
  return result;
}

void LACUIRatchetViewModel.handle(action:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  Swift::String v23;
  Swift::String v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  Swift::String v47;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v4);
  v38 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LACUIRatchetViewModel.State(0);
  v7 = *(_QWORD *)(v6 - 8);
  v33 = v6;
  v34 = v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v35 = v9;
  v36 = (uint64_t)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v37 = (uint64_t)&v33 - v10;
  v11 = type metadata accessor for LACLogger();
  v39 = *(_QWORD *)(v11 - 8);
  v40 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)a1;
  v15 = *(_QWORD *)(a1 + 8);
  v16 = *(_QWORD *)(a1 + 16);
  v17 = *(_QWORD *)(a1 + 24);
  v18 = *(_BYTE *)(a1 + 32);
  static LACLogger.dtoUI.getter();
  v42 = 0;
  v43 = 0xE000000000000000;
  _StringGuts.grow(_:)(29);
  v41 = v2;
  v19 = objc_msgSend(v2, sel_description);
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v22 = v21;
  swift_bridgeObjectRelease();

  v47._countAndFlagsBits = v20;
  v47._object = v22;
  v23._object = (void *)0x8000000240AE3BF0;
  v23._countAndFlagsBits = 0xD000000000000019;
  String.append(_:)(v23);
  v42 = v14;
  v43 = v15;
  v44 = v16;
  v45 = v17;
  v46 = v18;
  outlined copy of LACUIAuthActionCountdown(v14, v15);
  v24._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  LACLogger.log(_:)(v47);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v40);
  if (v15)
  {
    v42 = v14;
    v43 = v15;
    v44 = v16;
    v45 = v17;
    v46 = v18;
    LACUIRatchetViewModel.handleButtonTap(_:)(&v42);
  }
  else
  {
    v25 = v37;
    v26 = v41;
    LACUIRatchetViewModel.uiConfiguration.getter(v37);
    swift_storeEnumTagMultiPayload();
    v27 = type metadata accessor for TaskPriority();
    v28 = (uint64_t)v38;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v38, 1, 1, v27);
    v29 = v36;
    outlined init with copy of LACUIRatchetViewModel.State(v25, v36);
    v30 = (*(unsigned __int8 *)(v34 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    v31 = (_QWORD *)swift_allocObject();
    v31[2] = 0;
    v31[3] = 0;
    v31[4] = v26;
    outlined init with take of LACUIAuthCountdownDelayConfiguration(v29, (uint64_t)v31 + v30, type metadata accessor for LACUIRatchetViewModel.State);
    v32 = v26;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v28, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIRatchetViewModel.set(state:), (uint64_t)v31);
    swift_release();
    outlined destroy of LACUIAuthCountdownView(v25, type metadata accessor for LACUIRatchetViewModel.State);
  }
}

void LACUIRatchetViewModel.handleButtonTap(_:)(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  Swift::String v9;

  v2 = type metadata accessor for LACLogger();
  MEMORY[0x24BDAC7A8](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
  MEMORY[0x24BDAC7A8](v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v6);
  v7 = *a1;
  v8 = (void *)a1[1];
  swift_bridgeObjectRetain();
  v9._countAndFlagsBits = v7;
  v9._object = v8;
  LACUIAuthCountdownConfiguration.ActionButtonIdentifier.init(rawValue:)(v9);
  __asm { BR              X10 }
}

uint64_t sub_240AC2684()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;

  v2 = swift_allocObject();
  v3 = *(void **)(v1 - 144);
  swift_unknownObjectWeakInit();
  v4 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v0, 1, 1, v4);
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v3;
  v5[5] = partial apply for closure #1 in LACUIRatchetViewModel.handleButtonTap(_:);
  v5[6] = v2;
  swift_retain_n();
  v6 = v3;
  v7 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v0, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:), (uint64_t)v5);
  v8 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks;
  v9 = *(_QWORD **)&v6[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks];
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v6[v8] = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9[2] + 1, 1, v9);
    *(_QWORD *)&v6[v8] = v9;
  }
  v12 = v9[2];
  v11 = v9[3];
  if (v12 >= v11 >> 1)
  {
    v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v11 > 1), v12 + 1, 1, v9);
    *(_QWORD *)&v6[v8] = v9;
  }
  v9[2] = v12 + 1;
  v9[v12 + 4] = v7;
  swift_release_n();
  return swift_release();
}

uint64_t closure #1 in LACUIRatchetViewModel.handleButtonTap(_:)(void *a1, char a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  Swift::String v22;
  Swift::String v23;
  uint64_t result;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  Swift::String v40;
  uint64_t v41;
  unint64_t v42;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
  v35 = *(_QWORD *)(v6 - 8);
  v36 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v33 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v34 = (uint64_t)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v33 - v11;
  v13 = type metadata accessor for LACLogger();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a3 + 16;
  static LACLogger.dtoUI.getter();
  v41 = 0;
  v42 = 0xE000000000000000;
  _StringGuts.grow(_:)(37);
  swift_beginAccess();
  v40._countAndFlagsBits = MEMORY[0x2426888D0](a3 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIRatchetViewModel?);
  v18 = String.init<A>(describing:)();
  v20 = v19;
  swift_bridgeObjectRelease();
  v40._countAndFlagsBits = v18;
  v40._object = v20;
  v21 = a1;
  v22._object = (void *)0x8000000240AE3E70;
  v22._countAndFlagsBits = 0xD000000000000021;
  String.append(_:)(v22);
  v38 = a1;
  v39 = a2 & 1;
  outlined copy of Result<[AnyHashable : Any], Error>(a1, a2 & 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<[AnyHashable : Any], Error>);
  v23._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  LACLogger.log(_:)(v40);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if ((a2 & 1) != 0)
  {
    swift_beginAccess();
    result = MEMORY[0x2426888D0](v17);
    if (!result)
      return result;
    v25 = (void *)result;
    v26 = result + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
    swift_beginAccess();
    v27 = v34;
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v26, v34, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    outlined copy of Result<[AnyHashable : Any], Error>(v21, 1);

    v29 = v35;
    v28 = v36;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v27, 1, v36))
    {
      outlined consume of Result<[AnyHashable : Any], Error>(v21, 1);
      return outlined destroy of LACUIAuthCountdownDelayConfiguration?(v27, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    }
    v32 = v33;
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v33, v27, v28);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v27, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    v37 = v21;
    CheckedContinuation.resume(throwing:)();
  }
  else
  {
    swift_beginAccess();
    result = MEMORY[0x2426888D0](v17);
    if (!result)
      return result;
    v30 = (void *)result;
    v31 = result + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
    swift_beginAccess();
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v31, (uint64_t)v12, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    outlined copy of Result<[AnyHashable : Any], Error>(a1, 0);

    v29 = v35;
    v28 = v36;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v12, 1, v36))
    {
      outlined consume of Result<[AnyHashable : Any], Error>(a1, 0);
      return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v12, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    }
    v32 = v33;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v33, v12, v28);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v12, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    v37 = a1;
    CheckedContinuation.resume(returning:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v32, v28);
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> () with result type ()(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t LACUIRatchetViewModel.arm(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 184) = a1;
  *(_QWORD *)(v2 + 192) = v1;
  return swift_task_switch();
}

uint64_t LACUIRatchetViewModel.arm(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  char v5;
  char v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  Class isa;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 192) + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_options);
  *(_QWORD *)(v0 + 120) = *MEMORY[0x24BE60678];
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  v3 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v0 + 152) = 1;
  *(_QWORD *)(v0 + 176) = v3;
  outlined init with take of Any((_OWORD *)(v0 + 152), (_OWORD *)(v0 + 120));
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v15 = v2;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)((_OWORD *)(v0 + 120), v0 + 80, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable(v0 + 80);
  *(_QWORD *)(v0 + 120) = *MEMORY[0x24BE60680];
  AnyHashable.init<A>(_:)();
  *(_QWORD *)(v0 + 144) = v3;
  *(_BYTE *)(v0 + 120) = 1;
  outlined init with take of Any((_OWORD *)(v0 + 120), (_OWORD *)(v0 + 152));
  v5 = swift_isUniquelyReferenced_nonNull_native();
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)((_OWORD *)(v0 + 152), v0 + 80, v5);
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable(v0 + 80);
  swift_bridgeObjectRetain();
  v6 = swift_isUniquelyReferenced_nonNull_native();
  v15 = v2;
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v1, (uint64_t)specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B), 0, v6, &v15);
  v7 = *(_QWORD **)(v0 + 192);
  v8 = swift_bridgeObjectRelease();
  v9 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v7) + 0x178))(v8);
  *(_QWORD *)(v0 + 200) = v9;
  v10 = LACUIRatchetViewModel.ratchetIdentifier.getter();
  v11 = MEMORY[0x242687FC4](v10);
  *(_QWORD *)(v0 + 208) = v11;
  swift_bridgeObjectRelease();
  v12 = LACUIRatchetViewModel.context.getter();
  *(_QWORD *)(v0 + 216) = v12;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)(v0 + 224) = isa;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = LACUIRatchetViewModel.arm(with:);
  *(_QWORD *)(v0 + 112) = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 88) = 0x40000000;
  *(_QWORD *)(v0 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?, @unowned NSError?) -> () with result type [AnyHashable : Any];
  *(_QWORD *)(v0 + 104) = &block_descriptor_1;
  objc_msgSend(v9, sel_performArmRequestWithIdentifier_context_options_completion_, v11, v12, isa, v0 + 80);
  return swift_continuation_await();
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 232) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 224);
  v2 = *(void **)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 120);

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 224);
  v2 = *(void **)(v0 + 208);
  v3 = *(void **)(v0 + 200);
  swift_willThrow();

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LACUIRatchetViewModel.showUI(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[8] = a1;
  v2[9] = v1;
  v3 = type metadata accessor for Date();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v2[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v2[14] = swift_task_alloc();
  v4 = type metadata accessor for LACUIRatchetViewModel.State(0);
  v2[15] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[16] = v5;
  v2[17] = *(_QWORD *)(v5 + 64);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v6 = type metadata accessor for LACLogger();
  v2[20] = v6;
  v2[21] = *(_QWORD *)(v6 - 8);
  v2[22] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 200) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 208) = a1;
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 224) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 232) = a1;
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 248) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 256) = a1;
  return swift_task_switch();
}

uint64_t LACUIRatchetViewModel.showUI(for:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  Swift::String v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  Swift::String v15;
  Swift::String v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  id v30;
  _QWORD *v31;
  uint64_t (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  _QWORD *v53;
  id v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v2 = *(_QWORD *)(v0 + 168);
  v1 = *(_QWORD *)(v0 + 176);
  v61 = *(_QWORD *)(v0 + 160);
  v3 = *(void **)(v0 + 64);
  v4 = *(void **)(v0 + 72);
  v5 = objc_msgSend(v3, sel_ratchetState);
  *(_QWORD *)(v0 + 184) = v5;
  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(27);
  v6 = objc_msgSend(v4, sel_description);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  swift_bridgeObjectRelease();

  v62 = v7;
  v10._object = (void *)0x8000000240AE3FC0;
  v10._countAndFlagsBits = 0xD000000000000017;
  String.append(_:)(v10);
  v11 = objc_msgSend(v5, sel_description);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;

  v15._countAndFlagsBits = v12;
  v15._object = v14;
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  v16._countAndFlagsBits = v62;
  v16._object = v9;
  LACLogger.log(_:)(v16);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v61);
  v17 = objc_msgSend(v3, sel_gracePeriodState);
  LOBYTE(v3) = objc_msgSend(v17, sel_isActive);

  if ((v3 & 1) != 0)
  {
    v18 = *(_QWORD *)(v0 + 152);
    v57 = *(_QWORD *)(v0 + 144);
    v59 = *(_QWORD *)(v0 + 128);
    v19 = *(_QWORD *)(v0 + 104);
    v56 = *(_QWORD *)(v0 + 112);
    v21 = *(_QWORD *)(v0 + 88);
    v20 = *(_QWORD *)(v0 + 96);
    v22 = *(void **)(v0 + 72);
    v23 = *(_QWORD *)(v0 + 80);
    v24 = *(void **)(v0 + 64);
    static Date.now.getter();
    v25 = objc_msgSend(v24, sel_gracePeriodState);
    objc_msgSend(v25, sel_time);

    Date.addingTimeInterval(_:)();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v23);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v21 + 56))(v19, 0, 1, v23);
    v26 = (uint64_t)v22 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_gracePeriodExpirationDate;
    swift_beginAccess();
    outlined assign with take of Date?(v19, v26, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    LACUIRatchetViewModel.uiConfiguration.getter(v18);
    swift_storeEnumTagMultiPayload();
    v27 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v56, 1, 1, v27);
    outlined init with copy of LACUIRatchetViewModel.State(v18, v57);
    v28 = (*(unsigned __int8 *)(v59 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
    v29 = (_QWORD *)swift_allocObject();
    v29[2] = 0;
    v29[3] = 0;
    v29[4] = v22;
    outlined init with take of LACUIAuthCountdownDelayConfiguration(v57, (uint64_t)v29 + v28, type metadata accessor for LACUIRatchetViewModel.State);
    v30 = v22;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v56, (uint64_t)&closure #1 in LACUIRatchetViewModel.set(state:)partial apply, (uint64_t)v29);
    swift_release();
    outlined destroy of LACUIAuthCountdownView(v18, type metadata accessor for LACUIRatchetViewModel.State);
    v31 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v31;
    v32 = LACUIRatchetViewModel.showUI(for:);
LABEL_7:
    *v31 = v0;
    v31[1] = v32;
    return LACUIRatchetViewModel.setupContinuationAndWait()();
  }
  v33 = objc_msgSend(v5, sel_rawValue);
  if (v33 == (id)1)
  {
    v44 = *(_QWORD *)(v0 + 144);
    v43 = *(_QWORD *)(v0 + 152);
    v60 = *(_QWORD *)(v0 + 128);
    v45 = *(_QWORD *)(v0 + 104);
    v58 = *(_QWORD *)(v0 + 112);
    v47 = *(_QWORD *)(v0 + 88);
    v46 = *(_QWORD *)(v0 + 96);
    v49 = *(void **)(v0 + 72);
    v48 = *(_QWORD *)(v0 + 80);
    objc_msgSend(v5, sel_duration);
    static Date.now.getter();
    Date.addingTimeInterval(_:)();
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v47 + 56))(v45, 0, 1, v48);
    v50 = (uint64_t)v49 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_expirationDate;
    swift_beginAccess();
    outlined assign with take of Date?(v45, v50, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    LACUIRatchetViewModel.uiConfiguration.getter(v43);
    swift_storeEnumTagMultiPayload();
    v51 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v58, 1, 1, v51);
    outlined init with copy of LACUIRatchetViewModel.State(v43, v44);
    v52 = (*(unsigned __int8 *)(v60 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
    v53 = (_QWORD *)swift_allocObject();
    v53[2] = 0;
    v53[3] = 0;
    v53[4] = v49;
    outlined init with take of LACUIAuthCountdownDelayConfiguration(v44, (uint64_t)v53 + v52, type metadata accessor for LACUIRatchetViewModel.State);
    v54 = v49;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v58, (uint64_t)&closure #1 in LACUIRatchetViewModel.set(state:)partial apply, (uint64_t)v53);
    swift_release();
    outlined destroy of LACUIAuthCountdownView(v43, type metadata accessor for LACUIRatchetViewModel.State);
    v31 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v31;
    v32 = LACUIRatchetViewModel.showUI(for:);
    goto LABEL_7;
  }
  if (!v33)
  {
    v35 = *(_QWORD *)(v0 + 144);
    v34 = *(_QWORD *)(v0 + 152);
    v36 = *(_QWORD *)(v0 + 128);
    v37 = *(_QWORD *)(v0 + 112);
    v38 = *(void **)(v0 + 72);
    LACUIRatchetViewModel.uiConfiguration.getter(v34);
    swift_storeEnumTagMultiPayload();
    v39 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v37, 1, 1, v39);
    outlined init with copy of LACUIRatchetViewModel.State(v34, v35);
    v40 = (*(unsigned __int8 *)(v36 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    v41 = (_QWORD *)swift_allocObject();
    v41[2] = 0;
    v41[3] = 0;
    v41[4] = v38;
    outlined init with take of LACUIAuthCountdownDelayConfiguration(v35, (uint64_t)v41 + v40, type metadata accessor for LACUIRatchetViewModel.State);
    v42 = v38;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v37, (uint64_t)&closure #1 in LACUIRatchetViewModel.set(state:)partial apply, (uint64_t)v41);
    swift_release();
    outlined destroy of LACUIAuthCountdownView(v34, type metadata accessor for LACUIRatchetViewModel.State);
    v31 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v31;
    v32 = LACUIRatchetViewModel.showUI(for:);
    goto LABEL_7;
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 208);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 232);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 256);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LACUIRatchetViewModel.showRatchetUI(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = v1;
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 224) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 232) = a1;
  return swift_task_switch();
}

uint64_t LACUIRatchetViewModel.showRatchetUI(for:)()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void **p_weak_ivar_lyt;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _OWORD *v20;
  char v21;
  char v22;
  void *i;
  __int128 v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = *(void **)(v0 + 128);
  v2 = *(_QWORD **)(v0 + 136);
  v3 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v2) + 0x178))();
  objc_msgSend(v3, sel_addObserver_, v2);

  v4 = v1;
  v5 = *(void **)(v0 + 128);
  *(_QWORD *)(v0 + 96) = v5;
  v6 = *MEMORY[0x24BE605B8];
  *(_QWORD *)(v0 + 144) = *MEMORY[0x24BE60568];
  *(_QWORD *)(v0 + 152) = v6;
  *(_QWORD *)(v0 + 160) = *MEMORY[0x24BE605B0];
  v7 = v5;
  v8 = v5;
  *(_QWORD *)(v0 + 168) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  *(_QWORD *)(v0 + 176) = type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for NSError);
  p_weak_ivar_lyt = (void **)(&LACUIDTOSensorNotTrustedScenePresentationHandler + 56);
  if (!swift_dynamicCast())
    goto LABEL_14;
  v10 = *(_QWORD *)(v0 + 144);
  v36 = *(_QWORD *)(v0 + 152);
  v11 = *(void **)(v0 + 112);
  v12 = (void *)objc_opt_self();
  v13 = v11;
  v14 = (void *)_convertErrorToNSError(_:)();

  LOBYTE(v10) = objc_msgSend(v12, sel_error_hasCode_subcode_, v14, v10, v36);
  if ((v10 & 1) == 0)
  {

    v22 = 0;
    i = v5;
    p_weak_ivar_lyt = &LACUIDTOSensorNotTrustedScenePresentationHandler.weak_ivar_lyt;
    goto LABEL_18;
  }
  v15 = objc_msgSend(v13, sel_userInfo);
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v16 + 16))
  {
    v19 = specialized __RawDictionaryStorage.find<A>(_:)(v17, v18);
    v20 = (_OWORD *)(v0 + 48);
    if ((v21 & 1) != 0)
    {
      outlined init with copy of Any(*(_QWORD *)(v16 + 56) + 32 * v19, v0 + 48);
      goto LABEL_10;
    }
    v24 = 0uLL;
  }
  else
  {
    v24 = 0uLL;
    v20 = (_OWORD *)(v0 + 48);
  }
  *v20 = v24;
  v20[1] = v24;
LABEL_10:

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 72))
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v20, &demangling cache variable for type metadata for Any?);
    p_weak_ivar_lyt = (void **)(&LACUIDTOSensorNotTrustedScenePresentationHandler + 56);
    goto LABEL_14;
  }
  type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for LACDTORatchetStateComposite);
  p_weak_ivar_lyt = (void **)(&LACUIDTOSensorNotTrustedScenePresentationHandler + 56);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    v22 = 0;
    goto LABEL_15;
  }

  v22 = 1;
LABEL_15:
  for (i = v5; ; i = 0)
  {
LABEL_18:
    *(_QWORD *)(v0 + 184) = i;
    *(_QWORD *)(v0 + 192) = v5;
    if ((v22 & 1) == 0)
    {

      return (*(uint64_t (**)(void *))(v0 + 8))(v5);
    }
    if (i)
    {
      *(_QWORD *)(v0 + 80) = i;
      v25 = i;
      if (swift_dynamicCast())
        break;
    }
LABEL_17:

    v22 = 0;
    v5 = *(void **)(v0 + 192);
  }
  v26 = *(void **)(v0 + 88);
  *(_QWORD *)(v0 + 200) = v26;
  v27 = objc_msgSend(v26, (SEL)p_weak_ivar_lyt[490]);
  v28 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v28 + 16) && (v31 = specialized __RawDictionaryStorage.find<A>(_:)(v29, v30), (v32 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v28 + 56) + 32 * v31, v0 + 16);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 40))
  {

    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v0 + 16, &demangling cache variable for type metadata for Any?);
    goto LABEL_17;
  }
  type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for LACDTORatchetStateComposite);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_17;
  }
  v34 = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 208) = v34;
  v35 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v35;
  *v35 = v0;
  v35[1] = LACUIRatchetViewModel.showRatchetUI(for:);
  return LACUIRatchetViewModel.showUI(for:)(v34);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 200);

  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v0 + 192);
  *(_QWORD *)(v0 + 184) = 0;

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void **p_weak_ivar_lyt;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _OWORD *v18;
  char v19;
  char v20;
  void *i;
  __int128 v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;

  v1 = *(void **)(v0 + 208);
  v2 = *(void **)(v0 + 184);
  v3 = *(void **)(v0 + 192);

  v4 = *(void **)(v0 + 224);
  *(_QWORD *)(v0 + 96) = v4;
  v5 = v4;
  v6 = v4;
  *(_QWORD *)(v0 + 168) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  *(_QWORD *)(v0 + 176) = type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for NSError);
  p_weak_ivar_lyt = (void **)(&LACUIDTOSensorNotTrustedScenePresentationHandler + 56);
  if (!swift_dynamicCast())
    goto LABEL_14;
  v8 = *(_QWORD *)(v0 + 144);
  v34 = *(_QWORD *)(v0 + 152);
  v9 = *(void **)(v0 + 112);
  v10 = (void *)objc_opt_self();
  v11 = v9;
  v12 = (void *)_convertErrorToNSError(_:)();

  LOBYTE(v8) = objc_msgSend(v10, sel_error_hasCode_subcode_, v12, v8, v34);
  if ((v8 & 1) == 0)
  {

    v20 = 0;
    i = v4;
    p_weak_ivar_lyt = &LACUIDTOSensorNotTrustedScenePresentationHandler.weak_ivar_lyt;
    goto LABEL_18;
  }
  v13 = objc_msgSend(v11, sel_userInfo);
  v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v14 + 16))
  {
    v17 = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    v18 = (_OWORD *)(v0 + 48);
    if ((v19 & 1) != 0)
    {
      outlined init with copy of Any(*(_QWORD *)(v14 + 56) + 32 * v17, v0 + 48);
      goto LABEL_10;
    }
    v22 = 0uLL;
  }
  else
  {
    v22 = 0uLL;
    v18 = (_OWORD *)(v0 + 48);
  }
  *v18 = v22;
  v18[1] = v22;
LABEL_10:

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 72))
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v18, &demangling cache variable for type metadata for Any?);
    p_weak_ivar_lyt = (void **)(&LACUIDTOSensorNotTrustedScenePresentationHandler + 56);
    goto LABEL_14;
  }
  type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for LACDTORatchetStateComposite);
  p_weak_ivar_lyt = (void **)(&LACUIDTOSensorNotTrustedScenePresentationHandler + 56);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    v20 = 0;
    goto LABEL_15;
  }

  v20 = 1;
LABEL_15:
  for (i = v4; ; i = 0)
  {
LABEL_18:
    *(_QWORD *)(v0 + 184) = i;
    *(_QWORD *)(v0 + 192) = v4;
    if ((v20 & 1) == 0)
    {

      return (*(uint64_t (**)(void *))(v0 + 8))(v4);
    }
    if (i)
    {
      *(_QWORD *)(v0 + 80) = i;
      v23 = i;
      if (swift_dynamicCast())
        break;
    }
LABEL_17:

    v20 = 0;
    v4 = *(void **)(v0 + 192);
  }
  v24 = *(void **)(v0 + 88);
  *(_QWORD *)(v0 + 200) = v24;
  v25 = objc_msgSend(v24, (SEL)p_weak_ivar_lyt[490]);
  v26 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(_QWORD *)(v26 + 16) && (v29 = specialized __RawDictionaryStorage.find<A>(_:)(v27, v28), (v30 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v26 + 56) + 32 * v29, v0 + 16);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 40))
  {

    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v0 + 16, &demangling cache variable for type metadata for Any?);
    goto LABEL_17;
  }
  type metadata accessor for LACDTORatchetStateComposite(0, &lazy cache variable for type metadata for LACDTORatchetStateComposite);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_17;
  }
  v32 = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 208) = v32;
  v33 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v33;
  *v33 = v0;
  v33[1] = LACUIRatchetViewModel.showRatchetUI(for:);
  return LACUIRatchetViewModel.showUI(for:)(v32);
}

uint64_t LACUIRatchetViewModel.armIfPossible()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[30] = v0;
  v2 = type metadata accessor for LACLogger();
  v1[31] = v2;
  v1[32] = *(_QWORD *)(v2 - 8);
  v1[33] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 240)) + 0x178))();
  *(_QWORD *)(v0 + 272) = v1;
  *(_QWORD *)(v0 + 56) = v0 + 224;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = LACUIRatchetViewModel.armIfPossible();
  v2 = swift_continuation_init();
  *(_QWORD *)(v0 + 184) = MEMORY[0x24BDAC760];
  v3 = (_QWORD *)(v0 + 184);
  v3[1] = 0x40000000;
  v3[2] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned LACDTORatchetState?, @unowned NSError?) -> () with result type LACDTORatchetState;
  v3[3] = &block_descriptor_83;
  v3[4] = v2;
  objc_msgSend(v1, sel_stateWithCompletion_, v3);
  return swift_continuation_await();
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 280) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t inited;
  BOOL v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v24;

  v2 = *(_QWORD *)(v0 + 264);
  v1 = *(void **)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 256);
  v5 = *(void **)(v0 + 240);
  v6 = *(void **)(v0 + 224);
  *(_QWORD *)(v0 + 288) = v6;

  static LACLogger.dtoUI.getter();
  _StringGuts.grow(_:)(46);
  v7 = objc_msgSend(v5, sel_description);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;

  swift_bridgeObjectRelease();
  v24 = v8;
  v11._object = (void *)0x8000000240AE4030;
  v11._countAndFlagsBits = 0xD00000000000002ALL;
  String.append(_:)(v11);
  v12 = objc_msgSend(v6, sel_description);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;

  v16._countAndFlagsBits = v13;
  v16._object = v15;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = v24;
  v17._object = v10;
  LACLogger.log(_:)(v17);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  if ((char *)objc_msgSend(v6, sel_rawValue) - 2 >= (char *)3)
  {

    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_240AE1F20;
    *(_QWORD *)(v0 + 232) = *MEMORY[0x24BE60688];
    AnyHashable.init<A>(_:)();
    v19 = objc_msgSend(v6, sel_rawValue) == (id)3;
    *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
    *(_BYTE *)(inited + 72) = v19;
    v20 = specialized Dictionary.init(dictionaryLiteral:)(inited);
    *(_QWORD *)(v0 + 296) = v20;
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 304) = v21;
    *v21 = v0;
    v21[1] = LACUIRatchetViewModel.armIfPossible();
    v22 = *(_QWORD *)(v0 + 240);
    v21[23] = v20;
    v21[24] = v22;
    return swift_task_switch();
  }
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 320);

  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 272);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 288);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LACUIRatchetViewModel.armIfPossible()(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 312) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v4 + 320) = a1;
  }
  return swift_task_switch();
}

uint64_t closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[17] = a5;
  v6[18] = a6;
  v6[16] = a4;
  return swift_task_switch();
}

uint64_t closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:)()
{
  _QWORD *v0;
  uint64_t inited;
  unint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_240AE1F20;
  v0[15] = *MEMORY[0x24BE60660];
  AnyHashable.init<A>(_:)();
  *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 72) = 1;
  v2 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  v0[19] = v2;
  v3 = (_QWORD *)swift_task_alloc();
  v0[20] = v3;
  *v3 = v0;
  v3[1] = closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:);
  v4 = v0[16];
  v3[23] = v2;
  v3[24] = v4;
  return swift_task_switch();
}

{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 136))(*(_QWORD *)(v0 + 176), 0);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  void *v1;
  void (*v2)(void *, uint64_t);
  id v3;

  v1 = *(void **)(v0 + 168);
  v2 = *(void (**)(void *, uint64_t))(v0 + 136);
  swift_bridgeObjectRelease();
  v3 = v1;
  v2(v1, 1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 168) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v4 + 176) = a1;
  }
  return swift_task_switch();
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
  v2 = static _DictionaryStorage.allocate(capacity:)();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v6, (uint64_t)v15, &demangling cache variable for type metadata for (AnyHashable, Any));
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned LACDTORatchetState?, @unowned NSError?) -> () with result type LACDTORatchetState(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t closure #1 in LACUIRatchetViewModel.set(state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[8] = a4;
  v5[9] = a5;
  type metadata accessor for LACUIRatchetViewModel.State(0);
  v5[10] = swift_task_alloc();
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in LACUIRatchetViewModel.set(state:)()
{
  uint64_t v0;

  type metadata accessor for MainActor();
  *(_QWORD *)(v0 + 104) = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 72);
  swift_release();
  outlined init with copy of LACUIRatchetViewModel.State(v5, v1);
  v6 = v4 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_state;
  swift_beginAccess();
  outlined init with copy of LACUIRatchetViewModel.State(v6, v3);
  swift_beginAccess();
  outlined assign with copy of LACUIRatchetViewModel.State(v1, v6);
  swift_endAccess();
  outlined init with copy of LACUIRatchetViewModel.State(v6, v2);
  LACUIRatchetViewModel.stateUpdated(from:to:)(v3, v2);
  outlined destroy of LACUIAuthCountdownView(v2, type metadata accessor for LACUIRatchetViewModel.State);
  outlined destroy of LACUIAuthCountdownView(v1, type metadata accessor for LACUIRatchetViewModel.State);
  outlined destroy of LACUIAuthCountdownView(v3, type metadata accessor for LACUIRatchetViewModel.State);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LACUIRatchetViewModel.setupContinuationAndWait()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  *(_QWORD *)(v1 + 80) = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 88) = swift_allocObject();
  swift_unknownObjectWeakInit();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]?);
  *v1 = v0;
  v1[1] = LACUIRatchetViewModel.setupContinuationAndWait();
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v1, 1, 1, v4);
  v5 = v2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
  swift_beginAccess();
  outlined assign with take of Date?(v1, v5, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  swift_endAccess();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 72);
  swift_release();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v1, 1, 1, v3);
  v4 = v2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
  swift_beginAccess();
  outlined assign with take of Date?(v1, v4, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  swift_endAccess();
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void closure #1 in LACUIRatchetViewModel.setupContinuationAndWait()(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[24];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  v7 = MEMORY[0x2426888D0](a2 + 16);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
    v10 = *(_QWORD *)(v9 - 8);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16))(v6, a1, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
    v11 = (uint64_t)v8 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation;
    swift_beginAccess();
    outlined assign with take of Date?((uint64_t)v6, v11, &demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>?);
    swift_endAccess();

  }
}

uint64_t LACUIRatchetViewModel.beginDelayText.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[40];
  __int128 v12;
  __int128 v13;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_options);
  *(_QWORD *)&v12 = *MEMORY[0x24BE60640];
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v2 + 16) && (v3 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v11), (v4 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v2 + 56) + 32 * v3, (uint64_t)&v12);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }
  outlined destroy of AnyHashable((uint64_t)v11);
  if (*((_QWORD *)&v13 + 1))
  {
    if (swift_dynamicCast())
      v5 = v9;
    else
      v5 = 0;
  }
  else
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)&v12, &demangling cache variable for type metadata for Any?);
    v5 = 0;
  }
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isStrictModeEnabled) == 1)
  {
    v10 = *MEMORY[0x24BE60658];
    AnyHashable.init<A>(_:)();
    if (*(_QWORD *)(v2 + 16) && (v6 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v11), (v7 & 1) != 0))
    {
      outlined init with copy of Any(*(_QWORD *)(v2 + 56) + 32 * v6, (uint64_t)&v12);
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
    }
    outlined destroy of AnyHashable((uint64_t)v11);
    if (*((_QWORD *)&v13 + 1))
    {
      if (swift_dynamicCast())
      {
        v5 = v10;
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)&v12, &demangling cache variable for type metadata for Any?);
    }
  }
  return v5;
}

uint64_t LACUIRatchetViewModel.beginDelayLocationWarning.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t result;
  unsigned __int8 v5;
  _BYTE v6[40];
  __int128 v7;
  __int128 v8;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_options);
  *(_QWORD *)&v7 = *MEMORY[0x24BE60650];
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v1 + 16) && (v2 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6), (v3 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v1 + 56) + 32 * v2, (uint64_t)&v7);
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
  }
  outlined destroy of AnyHashable((uint64_t)v6);
  if (*((_QWORD *)&v8 + 1))
  {
    result = swift_dynamicCast();
    if ((_DWORD)result)
      return v5;
  }
  else
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)&v7, &demangling cache variable for type metadata for Any?);
    return 0;
  }
  return result;
}

uint64_t LACUIRatchetViewModel.beginDelayTitle.getter(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v6;
  _BYTE v7[40];
  __int128 v8;
  __int128 v9;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_options);
  *(_QWORD *)&v8 = *a1;
  AnyHashable.init<A>(_:)();
  if (*(_QWORD *)(v2 + 16) && (v3 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v7), (v4 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v2 + 56) + 32 * v3, (uint64_t)&v8);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  outlined destroy of AnyHashable((uint64_t)v7);
  if (*((_QWORD *)&v9 + 1))
  {
    if (swift_dynamicCast())
      return v6;
    else
      return 0;
  }
  else
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)&v8, &demangling cache variable for type metadata for Any?);
    return 0;
  }
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthCountdownItemConfiguration>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[56 * v8])
      memmove(v12, v13, 56 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthButtonConfiguration>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8])
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Task<(), Never>>);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Task<(), Never>);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      outlined init with copy of AnyHashable(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x242688114](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + 40;
  v3 = a2 + 40;
  outlined init with copy of AnyHashable(a1, a2);
  return outlined init with copy of Any(v2, v3);
}

uint64_t specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t result;
  _OWORD v30[2];
  _OWORD v31[2];
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v7 = -1 << *(_BYTE *)(a1 + 32);
  v8 = ~v7;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = -v7;
  v39 = a1;
  v40 = a1 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v41 = v8;
  v42 = 0;
  v43 = v11 & v9;
  v44 = a2;
  v45 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  specialized LazyMapSequence.Iterator.next()((uint64_t)&v35);
  if (!*((_QWORD *)&v36 + 1))
  {
LABEL_19:
    swift_release();
    swift_bridgeObjectRelease();
    outlined consume of [AnyHashable : Any].Iterator._Variant();
    return swift_release();
  }
  while (1)
  {
    v32 = v35;
    v33 = v36;
    v34 = v37;
    outlined init with take of Any(&v38, v31);
    v13 = *a5;
    v15 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)&v32);
    v16 = *(_QWORD *)(v13 + 16);
    v17 = (v14 & 1) == 0;
    v18 = v16 + v17;
    if (__OFADD__(v16, v17))
      break;
    v19 = v14;
    if (*(_QWORD *)(v13 + 24) >= v18)
    {
      if ((a4 & 1) != 0)
      {
        if ((v14 & 1) != 0)
          goto LABEL_6;
      }
      else
      {
        specialized _NativeDictionary.copy()();
        if ((v19 & 1) != 0)
          goto LABEL_6;
      }
    }
    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v18, a4 & 1);
      v20 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)&v32);
      if ((v19 & 1) != (v21 & 1))
        goto LABEL_22;
      v15 = v20;
      if ((v19 & 1) != 0)
      {
LABEL_6:
        outlined init with copy of Any((uint64_t)v31, (uint64_t)v30);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
        outlined destroy of AnyHashable((uint64_t)&v32);
        v12 = (_OWORD *)(*(_QWORD *)(*a5 + 56) + 32 * v15);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
        outlined init with take of Any(v30, v12);
        goto LABEL_7;
      }
    }
    v22 = (_QWORD *)*a5;
    *(_QWORD *)(*a5 + 8 * (v15 >> 6) + 64) |= 1 << v15;
    v23 = v22[6] + 40 * v15;
    v24 = v32;
    v25 = v33;
    *(_QWORD *)(v23 + 32) = v34;
    *(_OWORD *)v23 = v24;
    *(_OWORD *)(v23 + 16) = v25;
    outlined init with take of Any(v31, (_OWORD *)(v22[7] + 32 * v15));
    v26 = v22[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_21;
    v22[2] = v28;
LABEL_7:
    specialized LazyMapSequence.Iterator.next()((uint64_t)&v35);
    a4 = 1;
    if (!*((_QWORD *)&v36 + 1))
      goto LABEL_19;
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      outlined init with take of Any((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      outlined init with copy of AnyHashable(v25, (uint64_t)&v38);
      outlined init with copy of Any(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v7 + 40));
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)outlined init with take of Any(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    outlined init with copy of AnyHashable(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    outlined init with copy of Any(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = outlined init with take of Any(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

_OWORD *specialized _NativeDictionary.setValue(_:forKey:isUnique:)(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
        return outlined init with take of Any(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      specialized _NativeDictionary.copy()();
      goto LABEL_7;
    }
    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v13, a3 & 1);
    v19 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      outlined init with copy of AnyHashable(a2, (uint64_t)v21);
      return specialized _NativeDictionary._insert(at:key:value:)(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

_OWORD *specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = outlined init with take of Any(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

uint64_t specialized LazyMapSequence.Iterator.next()@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  void (*v16)(_OWORD *);
  uint64_t result;
  _OWORD v18[4];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _OWORD v25[4];
  uint64_t v26;

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    outlined init with copy of AnyHashable(*(_QWORD *)(v3 + 48) + 40 * v10, (uint64_t)v25);
    outlined init with copy of Any(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)&v25[2] + 8);
    goto LABEL_23;
  }
  v11 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  v12 = (unint64_t)(v6 + 64) >> 6;
  if (v11 < v12)
  {
    v13 = *(_QWORD *)(v4 + 8 * v11);
    if (v13)
    {
LABEL_7:
      v9 = (v13 - 1) & v13;
      v10 = __clz(__rbit64(v13)) + (v11 << 6);
      v7 = v11;
      goto LABEL_3;
    }
    v14 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v12)
    {
      v13 = *(_QWORD *)(v4 + 8 * v14);
      if (v13)
      {
LABEL_10:
        v11 = v14;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v12)
      {
        v13 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v13)
        {
          v11 = v5 + 3;
          goto LABEL_7;
        }
        v14 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v12)
        {
          v13 = *(_QWORD *)(v4 + 8 * v14);
          if (v13)
            goto LABEL_10;
          v11 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v12)
          {
            v13 = *(_QWORD *)(v4 + 8 * v11);
            if (v13)
              goto LABEL_7;
            v7 = v12 - 1;
            v15 = v5 + 6;
            while (v12 != v15)
            {
              v13 = *(_QWORD *)(v4 + 8 * v15++);
              if (v13)
              {
                v11 = v15 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  v26 = 0;
  memset(v25, 0, sizeof(v25));
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v16 = (void (*)(_OWORD *))v1[5];
  result = outlined init with take of (key: AnyHashable, value: Any)?((uint64_t)v25, (uint64_t)&v20);
  if (*((_QWORD *)&v21 + 1))
  {
    v18[2] = v22;
    v18[3] = v23;
    v19 = v24;
    v18[0] = v20;
    v18[1] = v21;
    v16(v18);
    return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v18, &demangling cache variable for type metadata for (key: AnyHashable, value: Any));
  }
  else
  {
    *(_QWORD *)(a1 + 64) = 0;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

void specialized static LACUIRatchetViewModel.State.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  v15 = a2;
  v2 = type metadata accessor for LACUIRatchetViewModel.State(0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (LACUIRatchetViewModel.State, LACUIRatchetViewModel.State));
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for LACUIAuthCountdownConfiguration();
  v11 = MEMORY[0x24BDAC7A8](v10);
  MEMORY[0x24BDAC7A8](v11);
  v12 = (uint64_t)&v9[*(int *)(v7 + 48)];
  outlined init with copy of LACUIRatchetViewModel.State(v14, (uint64_t)v9);
  outlined init with copy of LACUIRatchetViewModel.State(v15, v12);
  v13 = (char *)sub_240AC6E74 + 4 * byte_240AE1F30[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_240AC6E74()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  outlined init with copy of LACUIRatchetViewModel.State(v4, v3);
  if (swift_getEnumCaseMultiPayload())
  {
    outlined destroy of LACUIAuthCountdownView(v3, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v4, (uint64_t *)&demangling cache variable for type metadata for (LACUIRatchetViewModel.State, LACUIRatchetViewModel.State));
    v5 = 0;
  }
  else
  {
    outlined init with take of LACUIAuthCountdownDelayConfiguration(v3, (uint64_t)v1, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
    outlined init with take of LACUIAuthCountdownDelayConfiguration(v2, (uint64_t)v0, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
    outlined destroy of LACUIAuthCountdownView(v4, type metadata accessor for LACUIRatchetViewModel.State);
    v5 = specialized static LACUIAuthCountdownConfiguration.== infix(_:_:)(v1, v0);
    outlined destroy of LACUIAuthCountdownView((uint64_t)v0, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
    outlined destroy of LACUIAuthCountdownView((uint64_t)v1, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
  }
  return v5 & 1;
}

uint64_t outlined init with copy of LACUIRatchetViewModel.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LACUIRatchetViewModel.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for LACUIRatchetViewModel.State(uint64_t a1)
{
  return type metadata accessor for LACUIRatchetViewModel.State(a1, (uint64_t *)&type metadata singleton initialization cache for LACUIRatchetViewModel.State);
}

id specialized LACUIRatchetViewModel.init(contextProvider:options:configuration:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  _BYTE *v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  char *v15;
  id v16;
  char *v17;
  id v18;
  objc_super v20;

  v6 = *a3;
  v7 = a3[1];
  v8 = *((_BYTE *)a3 + 16);
  v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isInvalidated] = 0;
  type metadata accessor for LACUIRatchetViewModel.State(0);
  swift_storeEnumTagMultiPayload();
  v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isRunning] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___stateSubject] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___learnMoreSubject] = 0;
  v9 = &v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___ratchetIdentifier];
  *v9 = 0;
  v9[1] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel____lazy_storage___context] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_tasks] = MEMORY[0x24BEE4AF8];
  v10 = &v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_uiContinuation];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[AnyHashable : Any]?, Error>);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = &v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_expirationDate];
  v13 = type metadata accessor for Date();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  v14(&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_gracePeriodExpirationDate], 1, 1, v13);
  v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isStrictModeEnabled] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_options] = a2;
  v15 = &v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_configuration];
  *(_QWORD *)v15 = v6;
  *((_QWORD *)v15 + 1) = v7;
  v15[16] = v8;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_contextProvider] = a1;
  v16 = objc_allocWithZone(MEMORY[0x24BE606C8]);
  v17 = v3;
  swift_unknownObjectRetain();
  v18 = objc_msgSend(v16, sel_initWithContextProvider_, a1);
  *(_QWORD *)&v17[OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_ratchetManager] = v18;

  v20.receiver = v17;
  v20.super_class = (Class)type metadata accessor for LACUIRatchetViewModel(0);
  return objc_msgSendSuper2(&v20, sel_init);
}

uint64_t type metadata accessor for LACUIRatchetViewModel(uint64_t a1)
{
  return type metadata accessor for LACUIRatchetViewModel.State(a1, (uint64_t *)&type metadata singleton initialization cache for LACUIRatchetViewModel);
}

uint64_t type metadata accessor for LACUIRatchetViewModel.State(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_240AC7568()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in LACUIRatchetViewModel.start()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return closure #1 in LACUIRatchetViewModel.start()(a1, v4, v5, v6);
}

uint64_t sub_240AC7600()
{
  return objectdestroy_3Tm((void (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

uint64_t partial apply for closure #1 in LACUIRatchetViewModel.stop(withReason:invalidate:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int *v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD **)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = *(unsigned __int8 *)(v0 + 56);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  v7 = *(int **)((*MEMORY[0x24BEE4EA0] & *v2) + 0x238);
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v7 + *v7);
  v8 = (_QWORD *)swift_task_alloc();
  v6[2] = v8;
  *v8 = v6;
  v8[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return v10(v3, v4, v5);
}

id specialized static LACUIRatchetViewModel.mapError(_:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[2];

  v2 = type metadata accessor for CancellationError();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v6 = a1;
    v7 = (void *)_convertErrorToNSError(_:)();
    v8 = objc_msgSend(v7, sel_domain);

    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = v10;

    if (v9 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v11 == v12)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        v23[1] = a1;
        v15 = a1;
        v16 = a1;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
        if ((swift_dynamicCast() & 1) != 0)
        {
          (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
          v17 = objc_msgSend((id)objc_opt_self(), sel_errorWithCode_, *MEMORY[0x24BE60598]);

        }
        else
        {
          v17 = a1;
        }
        v18 = (void *)objc_opt_self();
        v19 = *MEMORY[0x24BE60578];
        v20 = (void *)_convertErrorToNSError(_:)();
        v21 = objc_msgSend(v18, sel_errorWithCode_underlyingError_, v19, v20);

        return v21;
      }
    }
  }
  return a1;
}

uint64_t sub_240AC78D0()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return closure #1 in LACUIRatchetViewModel.ratchetStateDidChange(_:)(a1, v4, v5, v7, v6);
}

uint64_t outlined copy of LACUIAuthActionCountdown(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t partial apply for closure #1 in LACUIRatchetViewModel.set(state:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LACUIRatchetViewModel.State(0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return closure #1 in LACUIRatchetViewModel.set(state:)(a1, v5, v6, v7, v8);
}

uint64_t sub_240AC7A44@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xE0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_240AC7A88(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isInvalidated);
}

uint64_t sub_240AC7A94(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xF8))();
}

uint64_t sub_240AC7AD0@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x110))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_240AC7B14(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC25LocalAuthenticationCoreUI21LACUIRatchetViewModel_isRunning);
}

uint64_t keypath_setTm(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_BYTE *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t sub_240AC7B68@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x178))();
  *a2 = result;
  return result;
}

uint64_t sub_240AC7BA8(id *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(id))((*MEMORY[0x24BEE4EA0] & **a2) + 0x180))(*a1);
}

uint64_t ObjC metadata update function for LACUIRatchetViewModel()
{
  return type metadata accessor for LACUIRatchetViewModel(0);
}

void type metadata completion function for LACUIRatchetViewModel()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  type metadata accessor for LACUIRatchetViewModel.State(319);
  if (v0 <= 0x3F)
  {
    type metadata accessor for CheckedContinuation<[AnyHashable : Any]?, Error>?();
    if (v1 <= 0x3F)
    {
      type metadata accessor for Date?();
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for LACUIRatchetViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.statePublisher.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.learnMorePublisher.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.isInvalidated.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.state.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.isRunning.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.ratchetManager.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.ratchetManager.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.ratchetManager.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.__allocating_init(contextProvider:options:configuration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 544))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.start()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.stop(withReason:invalidate:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of LACUIRatchetViewModel.stop(withReason:invalidate:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  int *v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  v8 = *(int **)((*MEMORY[0x24BEE4EA0] & *v3) + 0x238);
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return v11(a1, a2, a3);
}

uint64_t dispatch thunk of static LACUIRatchetViewModel.mapError(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 576))();
}

void type metadata accessor for Date?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Date?)
  {
    type metadata accessor for Date();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Date?);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for LACUIRatchetViewModel.State(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unsigned int (*v17)(_QWORD *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  unsigned int (*v30)(_QWORD *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  unsigned int (*v41)(_QWORD *, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  unsigned int (*v52)(_QWORD *, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  void (*v65)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *, char *, uint64_t);
  uint64_t v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  void (*v78)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, char *, uint64_t);
  uint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  uint64_t v87;
  void (*v88)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(char *, char *, uint64_t);
  uint64_t v94;
  _QWORD *v95;
  _QWORD *v96;
  uint64_t v97;
  void (*v98)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  char *v105;
  char *v106;
  char *v107;
  char *v108;
  char *v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v19 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v7 = *a2;
        v8 = a2[1];
        v9 = *((_BYTE *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v7;
        a1[1] = v8;
        *((_BYTE *)a1 + 16) = v9;
        v10 = a2[4];
        a1[3] = a2[3];
        a1[4] = v10;
        v11 = a2[6];
        a1[5] = a2[5];
        a1[6] = v11;
        v12 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        v13 = v12[7];
        v14 = (_QWORD *)((char *)a1 + v13);
        v15 = (_QWORD *)((char *)a2 + v13);
        v16 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        v113 = *(_QWORD *)(v16 - 8);
        v17 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v113 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v17(v15, 1, v16))
        {
          v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
        }
        else
        {
          v57 = v15[1];
          *v14 = *v15;
          v14[1] = v57;
          v58 = *(int *)(v16 + 20);
          v105 = (char *)v15 + v58;
          v109 = (char *)v14 + v58;
          v59 = type metadata accessor for Date();
          v60 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v59 - 8) + 16);
          swift_bridgeObjectRetain();
          v60(v109, v105, v59);
          v61 = *(int *)(v16 + 24);
          v62 = (_QWORD *)((char *)v14 + v61);
          v63 = (_QWORD *)((char *)v15 + v61);
          v64 = v63[1];
          *v62 = *v63;
          v62[1] = v64;
          v65 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v113 + 56);
          swift_bridgeObjectRetain();
          v65(v14, 0, 1, v16);
        }
        *(_QWORD *)((char *)a1 + v12[8]) = *(_QWORD *)((char *)a2 + v12[8]);
        *(_QWORD *)((char *)a1 + v12[9]) = *(_QWORD *)((char *)a2 + v12[9]);
        v66 = v12[10];
        v67 = (char *)a1 + v66;
        v68 = (char *)a2 + v66;
        v69 = *(_QWORD *)((char *)a2 + v66 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v69)
          goto LABEL_26;
        v101 = *((_OWORD *)v68 + 1);
        *(_OWORD *)v67 = *(_OWORD *)v68;
        *((_OWORD *)v67 + 1) = v101;
        v67[32] = v68[32];
        goto LABEL_31;
      case 1u:
        v21 = *a2;
        v22 = a2[1];
        v23 = *((_BYTE *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v21;
        a1[1] = v22;
        *((_BYTE *)a1 + 16) = v23;
        v24 = a2[4];
        a1[3] = a2[3];
        a1[4] = v24;
        v25 = a2[6];
        a1[5] = a2[5];
        a1[6] = v25;
        v12 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        v26 = v12[7];
        v27 = (_QWORD *)((char *)a1 + v26);
        v28 = (_QWORD *)((char *)a2 + v26);
        v29 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        v114 = *(_QWORD *)(v29 - 8);
        v30 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v114 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v30(v28, 1, v29))
        {
          v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
        }
        else
        {
          v70 = v28[1];
          *v27 = *v28;
          v27[1] = v70;
          v71 = *(int *)(v29 + 20);
          v106 = (char *)v28 + v71;
          v110 = (char *)v27 + v71;
          v72 = type metadata accessor for Date();
          v73 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v72 - 8) + 16);
          swift_bridgeObjectRetain();
          v73(v110, v106, v72);
          v74 = *(int *)(v29 + 24);
          v75 = (_QWORD *)((char *)v27 + v74);
          v76 = (_QWORD *)((char *)v28 + v74);
          v77 = v76[1];
          *v75 = *v76;
          v75[1] = v77;
          v78 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v114 + 56);
          swift_bridgeObjectRetain();
          v78(v27, 0, 1, v29);
        }
        *(_QWORD *)((char *)a1 + v12[8]) = *(_QWORD *)((char *)a2 + v12[8]);
        *(_QWORD *)((char *)a1 + v12[9]) = *(_QWORD *)((char *)a2 + v12[9]);
        v79 = v12[10];
        v67 = (char *)a1 + v79;
        v68 = (char *)a2 + v79;
        v69 = *(_QWORD *)((char *)a2 + v79 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v69)
          goto LABEL_26;
        v102 = *((_OWORD *)v68 + 1);
        *(_OWORD *)v67 = *(_OWORD *)v68;
        *((_OWORD *)v67 + 1) = v102;
        v67[32] = v68[32];
        goto LABEL_31;
      case 2u:
        v32 = *a2;
        v33 = a2[1];
        v34 = *((_BYTE *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v32;
        a1[1] = v33;
        *((_BYTE *)a1 + 16) = v34;
        v35 = a2[4];
        a1[3] = a2[3];
        a1[4] = v35;
        v36 = a2[6];
        a1[5] = a2[5];
        a1[6] = v36;
        v12 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        v37 = v12[7];
        v38 = (_QWORD *)((char *)a1 + v37);
        v39 = (_QWORD *)((char *)a2 + v37);
        v40 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        v115 = *(_QWORD *)(v40 - 8);
        v41 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v115 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v41(v39, 1, v40))
        {
          v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
        }
        else
        {
          v80 = v39[1];
          *v38 = *v39;
          v38[1] = v80;
          v81 = *(int *)(v40 + 20);
          v107 = (char *)v39 + v81;
          v111 = (char *)v38 + v81;
          v82 = type metadata accessor for Date();
          v83 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v82 - 8) + 16);
          swift_bridgeObjectRetain();
          v83(v111, v107, v82);
          v84 = *(int *)(v40 + 24);
          v85 = (_QWORD *)((char *)v38 + v84);
          v86 = (_QWORD *)((char *)v39 + v84);
          v87 = v86[1];
          *v85 = *v86;
          v85[1] = v87;
          v88 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v115 + 56);
          swift_bridgeObjectRetain();
          v88(v38, 0, 1, v40);
        }
        *(_QWORD *)((char *)a1 + v12[8]) = *(_QWORD *)((char *)a2 + v12[8]);
        *(_QWORD *)((char *)a1 + v12[9]) = *(_QWORD *)((char *)a2 + v12[9]);
        v89 = v12[10];
        v67 = (char *)a1 + v89;
        v68 = (char *)a2 + v89;
        v69 = *(_QWORD *)((char *)a2 + v89 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v69)
          goto LABEL_26;
        v103 = *((_OWORD *)v68 + 1);
        *(_OWORD *)v67 = *(_OWORD *)v68;
        *((_OWORD *)v67 + 1) = v103;
        v67[32] = v68[32];
        goto LABEL_31;
      case 3u:
        v43 = *a2;
        v44 = a2[1];
        v45 = *((_BYTE *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v43;
        a1[1] = v44;
        *((_BYTE *)a1 + 16) = v45;
        v46 = a2[4];
        a1[3] = a2[3];
        a1[4] = v46;
        v47 = a2[6];
        a1[5] = a2[5];
        a1[6] = v47;
        v12 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        v48 = v12[7];
        v49 = (_QWORD *)((char *)a1 + v48);
        v50 = (_QWORD *)((char *)a2 + v48);
        v51 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        v116 = *(_QWORD *)(v51 - 8);
        v52 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v116 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v52(v50, 1, v51))
        {
          v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(v49, v50, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
        }
        else
        {
          v90 = v50[1];
          *v49 = *v50;
          v49[1] = v90;
          v91 = *(int *)(v51 + 20);
          v108 = (char *)v50 + v91;
          v112 = (char *)v49 + v91;
          v92 = type metadata accessor for Date();
          v93 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v92 - 8) + 16);
          swift_bridgeObjectRetain();
          v93(v112, v108, v92);
          v94 = *(int *)(v51 + 24);
          v95 = (_QWORD *)((char *)v49 + v94);
          v96 = (_QWORD *)((char *)v50 + v94);
          v97 = v96[1];
          *v95 = *v96;
          v95[1] = v97;
          v98 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v116 + 56);
          swift_bridgeObjectRetain();
          v98(v49, 0, 1, v51);
        }
        *(_QWORD *)((char *)a1 + v12[8]) = *(_QWORD *)((char *)a2 + v12[8]);
        *(_QWORD *)((char *)a1 + v12[9]) = *(_QWORD *)((char *)a2 + v12[9]);
        v99 = v12[10];
        v67 = (char *)a1 + v99;
        v68 = (char *)a2 + v99;
        v69 = *(_QWORD *)((char *)a2 + v99 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v69)
        {
LABEL_26:
          *(_QWORD *)v67 = *(_QWORD *)v68;
          *((_QWORD *)v67 + 1) = v69;
          v100 = *((_QWORD *)v68 + 3);
          *((_QWORD *)v67 + 2) = *((_QWORD *)v68 + 2);
          *((_QWORD *)v67 + 3) = v100;
          v67[32] = v68[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          v104 = *((_OWORD *)v68 + 1);
          *(_OWORD *)v67 = *(_OWORD *)v68;
          *((_OWORD *)v67 + 1) = v104;
          v67[32] = v68[32];
        }
LABEL_31:
        *((_BYTE *)a1 + v12[11]) = *((_BYTE *)a2 + v12[11]);
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        v54 = *a2;
        v55 = (void *)a2[1];
        *a1 = v54;
        swift_bridgeObjectRetain();
        v56 = v55;
        a1[1] = v55;
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

void destroy for LACUIRatchetViewModel.State(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
      outlined consume of LACUIAuthImageConfiguration();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v2 = type metadata accessor for LACUIAuthCountdownConfiguration();
      v3 = a1 + *(int *)(v2 + 28);
      v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v3, 1, v4))
      {
        swift_bridgeObjectRelease();
        v5 = v3 + *(int *)(v4 + 20);
        v6 = type metadata accessor for Date();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(a1 + *(int *)(v2 + 40) + 8))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      break;
    case 4u:
      swift_bridgeObjectRelease();

      break;
    default:
      return;
  }
}

_QWORD *initializeWithCopy for LACUIRatchetViewModel.State(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(_QWORD *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(_QWORD *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int (*v43)(_QWORD *, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  int *v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int (*v56)(_QWORD *, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(char *, char *, uint64_t);
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  void (*v69)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, char *, uint64_t);
  uint64_t v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  void (*v83)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(char *, char *, uint64_t);
  uint64_t v93;
  _QWORD *v94;
  _QWORD *v95;
  uint64_t v96;
  void (*v97)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(char *, char *, uint64_t);
  uint64_t v107;
  _QWORD *v108;
  _QWORD *v109;
  uint64_t v110;
  void (*v111)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  char *v122;
  char *v123;
  char *v124;
  char *v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = *a2;
      v7 = a2[1];
      v8 = *((_BYTE *)a2 + 16);
      outlined copy of LACUIAuthImageConfiguration();
      *a1 = v6;
      a1[1] = v7;
      *((_BYTE *)a1 + 16) = v8;
      v9 = a2[4];
      a1[3] = a2[3];
      a1[4] = v9;
      v10 = a2[6];
      a1[5] = a2[5];
      a1[6] = v10;
      v11 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      v12 = v11[7];
      v13 = (_QWORD *)((char *)a1 + v12);
      v14 = (_QWORD *)((char *)a2 + v12);
      v15 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      v16 = *(_QWORD *)(v15 - 8);
      v17 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v17(v14, 1, v15))
      {
        v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
      }
      else
      {
        v61 = v14[1];
        *v13 = *v14;
        v13[1] = v61;
        v62 = *(int *)(v15 + 20);
        v122 = (char *)v14 + v62;
        v126 = (char *)v13 + v62;
        v63 = type metadata accessor for Date();
        v64 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v63 - 8) + 16);
        swift_bridgeObjectRetain();
        v64(v126, v122, v63);
        v65 = *(int *)(v15 + 24);
        v66 = (_QWORD *)((char *)v13 + v65);
        v67 = (_QWORD *)((char *)v14 + v65);
        v68 = v67[1];
        *v66 = *v67;
        v66[1] = v68;
        v69 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v16 + 56);
        swift_bridgeObjectRetain();
        v69(v13, 0, 1, v15);
      }
      *(_QWORD *)((char *)a1 + v11[8]) = *(_QWORD *)((char *)a2 + v11[8]);
      *(_QWORD *)((char *)a1 + v11[9]) = *(_QWORD *)((char *)a2 + v11[9]);
      v70 = v11[10];
      v71 = (char *)a1 + v70;
      v72 = (char *)a2 + v70;
      v73 = *(_QWORD *)((char *)a2 + v70 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v73)
      {
        *(_QWORD *)v71 = *(_QWORD *)v72;
        *((_QWORD *)v71 + 1) = v73;
        v74 = *((_QWORD *)v72 + 3);
        *((_QWORD *)v71 + 2) = *((_QWORD *)v72 + 2);
        *((_QWORD *)v71 + 3) = v74;
        v71[32] = v72[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        v117 = *((_OWORD *)v72 + 1);
        *(_OWORD *)v71 = *(_OWORD *)v72;
        *((_OWORD *)v71 + 1) = v117;
        v71[32] = v72[32];
      }
      *((_BYTE *)a1 + v11[11]) = *((_BYTE *)a2 + v11[11]);
      goto LABEL_32;
    case 1u:
      v19 = *a2;
      v20 = a2[1];
      v21 = *((_BYTE *)a2 + 16);
      outlined copy of LACUIAuthImageConfiguration();
      *a1 = v19;
      a1[1] = v20;
      *((_BYTE *)a1 + 16) = v21;
      v22 = a2[4];
      a1[3] = a2[3];
      a1[4] = v22;
      v23 = a2[6];
      a1[5] = a2[5];
      a1[6] = v23;
      v24 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      v25 = v24[7];
      v26 = (_QWORD *)((char *)a1 + v25);
      v27 = (_QWORD *)((char *)a2 + v25);
      v28 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      v29 = *(_QWORD *)(v28 - 8);
      v30 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v29 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v30(v27, 1, v28))
      {
        v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
      }
      else
      {
        v75 = v27[1];
        *v26 = *v27;
        v26[1] = v75;
        v76 = *(int *)(v28 + 20);
        v123 = (char *)v27 + v76;
        v127 = (char *)v26 + v76;
        v77 = type metadata accessor for Date();
        v78 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v77 - 8) + 16);
        swift_bridgeObjectRetain();
        v78(v127, v123, v77);
        v79 = *(int *)(v28 + 24);
        v80 = (_QWORD *)((char *)v26 + v79);
        v81 = (_QWORD *)((char *)v27 + v79);
        v82 = v81[1];
        *v80 = *v81;
        v80[1] = v82;
        v83 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v29 + 56);
        swift_bridgeObjectRetain();
        v83(v26, 0, 1, v28);
      }
      *(_QWORD *)((char *)a1 + v24[8]) = *(_QWORD *)((char *)a2 + v24[8]);
      *(_QWORD *)((char *)a1 + v24[9]) = *(_QWORD *)((char *)a2 + v24[9]);
      v84 = v24[10];
      v85 = (char *)a1 + v84;
      v86 = (char *)a2 + v84;
      v87 = *(_QWORD *)((char *)a2 + v84 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v87)
      {
        *(_QWORD *)v85 = *(_QWORD *)v86;
        *((_QWORD *)v85 + 1) = v87;
        v88 = *((_QWORD *)v86 + 3);
        *((_QWORD *)v85 + 2) = *((_QWORD *)v86 + 2);
        *((_QWORD *)v85 + 3) = v88;
        v85[32] = v86[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        v118 = *((_OWORD *)v86 + 1);
        *(_OWORD *)v85 = *(_OWORD *)v86;
        *((_OWORD *)v85 + 1) = v118;
        v85[32] = v86[32];
      }
      *((_BYTE *)a1 + v24[11]) = *((_BYTE *)a2 + v24[11]);
      goto LABEL_32;
    case 2u:
      v32 = *a2;
      v33 = a2[1];
      v34 = *((_BYTE *)a2 + 16);
      outlined copy of LACUIAuthImageConfiguration();
      *a1 = v32;
      a1[1] = v33;
      *((_BYTE *)a1 + 16) = v34;
      v35 = a2[4];
      a1[3] = a2[3];
      a1[4] = v35;
      v36 = a2[6];
      a1[5] = a2[5];
      a1[6] = v36;
      v37 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      v38 = v37[7];
      v39 = (_QWORD *)((char *)a1 + v38);
      v40 = (_QWORD *)((char *)a2 + v38);
      v41 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      v42 = *(_QWORD *)(v41 - 8);
      v43 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v42 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v43(v40, 1, v41))
      {
        v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
      }
      else
      {
        v89 = v40[1];
        *v39 = *v40;
        v39[1] = v89;
        v90 = *(int *)(v41 + 20);
        v124 = (char *)v40 + v90;
        v128 = (char *)v39 + v90;
        v91 = type metadata accessor for Date();
        v92 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v91 - 8) + 16);
        swift_bridgeObjectRetain();
        v92(v128, v124, v91);
        v93 = *(int *)(v41 + 24);
        v94 = (_QWORD *)((char *)v39 + v93);
        v95 = (_QWORD *)((char *)v40 + v93);
        v96 = v95[1];
        *v94 = *v95;
        v94[1] = v96;
        v97 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v42 + 56);
        swift_bridgeObjectRetain();
        v97(v39, 0, 1, v41);
      }
      *(_QWORD *)((char *)a1 + v37[8]) = *(_QWORD *)((char *)a2 + v37[8]);
      *(_QWORD *)((char *)a1 + v37[9]) = *(_QWORD *)((char *)a2 + v37[9]);
      v98 = v37[10];
      v99 = (char *)a1 + v98;
      v100 = (char *)a2 + v98;
      v101 = *(_QWORD *)((char *)a2 + v98 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v101)
      {
        *(_QWORD *)v99 = *(_QWORD *)v100;
        *((_QWORD *)v99 + 1) = v101;
        v102 = *((_QWORD *)v100 + 3);
        *((_QWORD *)v99 + 2) = *((_QWORD *)v100 + 2);
        *((_QWORD *)v99 + 3) = v102;
        v99[32] = v100[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        v119 = *((_OWORD *)v100 + 1);
        *(_OWORD *)v99 = *(_OWORD *)v100;
        *((_OWORD *)v99 + 1) = v119;
        v99[32] = v100[32];
      }
      *((_BYTE *)a1 + v37[11]) = *((_BYTE *)a2 + v37[11]);
      goto LABEL_32;
    case 3u:
      v45 = *a2;
      v46 = a2[1];
      v47 = *((_BYTE *)a2 + 16);
      outlined copy of LACUIAuthImageConfiguration();
      *a1 = v45;
      a1[1] = v46;
      *((_BYTE *)a1 + 16) = v47;
      v48 = a2[4];
      a1[3] = a2[3];
      a1[4] = v48;
      v49 = a2[6];
      a1[5] = a2[5];
      a1[6] = v49;
      v50 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      v51 = v50[7];
      v52 = (_QWORD *)((char *)a1 + v51);
      v53 = (_QWORD *)((char *)a2 + v51);
      v54 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      v55 = *(_QWORD *)(v54 - 8);
      v56 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v55 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v56(v53, 1, v54))
      {
        v57 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(v52, v53, *(_QWORD *)(*(_QWORD *)(v57 - 8) + 64));
      }
      else
      {
        v103 = v53[1];
        *v52 = *v53;
        v52[1] = v103;
        v104 = *(int *)(v54 + 20);
        v125 = (char *)v53 + v104;
        v129 = (char *)v52 + v104;
        v105 = type metadata accessor for Date();
        v106 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v105 - 8) + 16);
        swift_bridgeObjectRetain();
        v106(v129, v125, v105);
        v107 = *(int *)(v54 + 24);
        v108 = (_QWORD *)((char *)v52 + v107);
        v109 = (_QWORD *)((char *)v53 + v107);
        v110 = v109[1];
        *v108 = *v109;
        v108[1] = v110;
        v111 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v55 + 56);
        swift_bridgeObjectRetain();
        v111(v52, 0, 1, v54);
      }
      *(_QWORD *)((char *)a1 + v50[8]) = *(_QWORD *)((char *)a2 + v50[8]);
      *(_QWORD *)((char *)a1 + v50[9]) = *(_QWORD *)((char *)a2 + v50[9]);
      v112 = v50[10];
      v113 = (char *)a1 + v112;
      v114 = (char *)a2 + v112;
      v115 = *(_QWORD *)((char *)a2 + v112 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v115)
      {
        *(_QWORD *)v113 = *(_QWORD *)v114;
        *((_QWORD *)v113 + 1) = v115;
        v116 = *((_QWORD *)v114 + 3);
        *((_QWORD *)v113 + 2) = *((_QWORD *)v114 + 2);
        *((_QWORD *)v113 + 3) = v116;
        v113[32] = v114[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        v120 = *((_OWORD *)v114 + 1);
        *(_OWORD *)v113 = *(_OWORD *)v114;
        *((_OWORD *)v113 + 1) = v120;
        v113[32] = v114[32];
      }
      *((_BYTE *)a1 + v50[11]) = *((_BYTE *)a2 + v50[11]);
      goto LABEL_32;
    case 4u:
      v58 = *a2;
      v59 = (void *)a2[1];
      *a1 = v58;
      swift_bridgeObjectRetain();
      v60 = v59;
      a1[1] = v59;
LABEL_32:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *assignWithCopy for LACUIRatchetViewModel.State(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(_QWORD *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(_QWORD *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  int *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int (*v37)(_QWORD *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  int *v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int (*v48)(_QWORD *, uint64_t, uint64_t);
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  void (*v58)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, char *, uint64_t);
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  void (*v69)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, char *, uint64_t);
  uint64_t v77;
  _QWORD *v78;
  _QWORD *v79;
  void (*v80)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *, char *, uint64_t);
  uint64_t v88;
  _QWORD *v89;
  _QWORD *v90;
  void (*v91)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  char *v105;
  char *v106;
  char *v107;
  char *v108;
  char *v109;
  char *v110;
  char *v111;
  char *v112;

  if (a1 != a2)
  {
    outlined destroy of LACUIAuthCountdownView((uint64_t)a1, type metadata accessor for LACUIRatchetViewModel.State);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v6 = *a2;
        v7 = a2[1];
        v8 = *((_BYTE *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v6;
        a1[1] = v7;
        *((_BYTE *)a1 + 16) = v8;
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        v9 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        v10 = v9[7];
        v11 = (_QWORD *)((char *)a1 + v10);
        v12 = (_QWORD *)((char *)a2 + v10);
        v13 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        v14 = *(_QWORD *)(v13 - 8);
        v15 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v14 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v15(v12, 1, v13))
        {
          v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
        }
        else
        {
          *v11 = *v12;
          v11[1] = v12[1];
          v52 = *(int *)(v13 + 20);
          v105 = (char *)v12 + v52;
          v109 = (char *)v11 + v52;
          v53 = type metadata accessor for Date();
          v54 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v53 - 8) + 16);
          swift_bridgeObjectRetain();
          v54(v109, v105, v53);
          v55 = *(int *)(v13 + 24);
          v56 = (_QWORD *)((char *)v11 + v55);
          v57 = (_QWORD *)((char *)v12 + v55);
          *v56 = *v57;
          v56[1] = v57[1];
          v58 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v14 + 56);
          swift_bridgeObjectRetain();
          v58(v11, 0, 1, v13);
        }
        *(_QWORD *)((char *)a1 + v9[8]) = *(_QWORD *)((char *)a2 + v9[8]);
        *(_QWORD *)((char *)a1 + v9[9]) = *(_QWORD *)((char *)a2 + v9[9]);
        v59 = v9[10];
        v60 = (char *)a1 + v59;
        v61 = (char *)a2 + v59;
        v62 = *(_QWORD *)((char *)a2 + v59 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v62)
        {
          *(_QWORD *)v60 = *(_QWORD *)v61;
          *((_QWORD *)v60 + 1) = *((_QWORD *)v61 + 1);
          *((_QWORD *)v60 + 2) = *((_QWORD *)v61 + 2);
          *((_QWORD *)v60 + 3) = *((_QWORD *)v61 + 3);
          v60[32] = v61[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          v96 = *(_OWORD *)v61;
          v97 = *((_OWORD *)v61 + 1);
          v60[32] = v61[32];
          *(_OWORD *)v60 = v96;
          *((_OWORD *)v60 + 1) = v97;
        }
        *((_BYTE *)a1 + v9[11]) = *((_BYTE *)a2 + v9[11]);
        goto LABEL_33;
      case 1u:
        v17 = *a2;
        v18 = a2[1];
        v19 = *((_BYTE *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v17;
        a1[1] = v18;
        *((_BYTE *)a1 + 16) = v19;
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        v20 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        v21 = v20[7];
        v22 = (_QWORD *)((char *)a1 + v21);
        v23 = (_QWORD *)((char *)a2 + v21);
        v24 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        v25 = *(_QWORD *)(v24 - 8);
        v26 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v25 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v26(v23, 1, v24))
        {
          v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
        }
        else
        {
          *v22 = *v23;
          v22[1] = v23[1];
          v63 = *(int *)(v24 + 20);
          v106 = (char *)v23 + v63;
          v110 = (char *)v22 + v63;
          v64 = type metadata accessor for Date();
          v65 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v64 - 8) + 16);
          swift_bridgeObjectRetain();
          v65(v110, v106, v64);
          v66 = *(int *)(v24 + 24);
          v67 = (_QWORD *)((char *)v22 + v66);
          v68 = (_QWORD *)((char *)v23 + v66);
          *v67 = *v68;
          v67[1] = v68[1];
          v69 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v25 + 56);
          swift_bridgeObjectRetain();
          v69(v22, 0, 1, v24);
        }
        *(_QWORD *)((char *)a1 + v20[8]) = *(_QWORD *)((char *)a2 + v20[8]);
        *(_QWORD *)((char *)a1 + v20[9]) = *(_QWORD *)((char *)a2 + v20[9]);
        v70 = v20[10];
        v71 = (char *)a1 + v70;
        v72 = (char *)a2 + v70;
        v73 = *(_QWORD *)((char *)a2 + v70 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v73)
        {
          *(_QWORD *)v71 = *(_QWORD *)v72;
          *((_QWORD *)v71 + 1) = *((_QWORD *)v72 + 1);
          *((_QWORD *)v71 + 2) = *((_QWORD *)v72 + 2);
          *((_QWORD *)v71 + 3) = *((_QWORD *)v72 + 3);
          v71[32] = v72[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          v98 = *(_OWORD *)v72;
          v99 = *((_OWORD *)v72 + 1);
          v71[32] = v72[32];
          *(_OWORD *)v71 = v98;
          *((_OWORD *)v71 + 1) = v99;
        }
        *((_BYTE *)a1 + v20[11]) = *((_BYTE *)a2 + v20[11]);
        goto LABEL_33;
      case 2u:
        v28 = *a2;
        v29 = a2[1];
        v30 = *((_BYTE *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v28;
        a1[1] = v29;
        *((_BYTE *)a1 + 16) = v30;
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        v31 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        v32 = v31[7];
        v33 = (_QWORD *)((char *)a1 + v32);
        v34 = (_QWORD *)((char *)a2 + v32);
        v35 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        v36 = *(_QWORD *)(v35 - 8);
        v37 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v36 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v37(v34, 1, v35))
        {
          v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
        }
        else
        {
          *v33 = *v34;
          v33[1] = v34[1];
          v74 = *(int *)(v35 + 20);
          v107 = (char *)v34 + v74;
          v111 = (char *)v33 + v74;
          v75 = type metadata accessor for Date();
          v76 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v75 - 8) + 16);
          swift_bridgeObjectRetain();
          v76(v111, v107, v75);
          v77 = *(int *)(v35 + 24);
          v78 = (_QWORD *)((char *)v33 + v77);
          v79 = (_QWORD *)((char *)v34 + v77);
          *v78 = *v79;
          v78[1] = v79[1];
          v80 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v36 + 56);
          swift_bridgeObjectRetain();
          v80(v33, 0, 1, v35);
        }
        *(_QWORD *)((char *)a1 + v31[8]) = *(_QWORD *)((char *)a2 + v31[8]);
        *(_QWORD *)((char *)a1 + v31[9]) = *(_QWORD *)((char *)a2 + v31[9]);
        v81 = v31[10];
        v82 = (char *)a1 + v81;
        v83 = (char *)a2 + v81;
        v84 = *(_QWORD *)((char *)a2 + v81 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v84)
        {
          *(_QWORD *)v82 = *(_QWORD *)v83;
          *((_QWORD *)v82 + 1) = *((_QWORD *)v83 + 1);
          *((_QWORD *)v82 + 2) = *((_QWORD *)v83 + 2);
          *((_QWORD *)v82 + 3) = *((_QWORD *)v83 + 3);
          v82[32] = v83[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          v100 = *(_OWORD *)v83;
          v101 = *((_OWORD *)v83 + 1);
          v82[32] = v83[32];
          *(_OWORD *)v82 = v100;
          *((_OWORD *)v82 + 1) = v101;
        }
        *((_BYTE *)a1 + v31[11]) = *((_BYTE *)a2 + v31[11]);
        goto LABEL_33;
      case 3u:
        v39 = *a2;
        v40 = a2[1];
        v41 = *((_BYTE *)a2 + 16);
        outlined copy of LACUIAuthImageConfiguration();
        *a1 = v39;
        a1[1] = v40;
        *((_BYTE *)a1 + 16) = v41;
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        v42 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        v43 = v42[7];
        v44 = (_QWORD *)((char *)a1 + v43);
        v45 = (_QWORD *)((char *)a2 + v43);
        v46 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        v47 = *(_QWORD *)(v46 - 8);
        v48 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v47 + 48);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v48(v45, 1, v46))
        {
          v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
        }
        else
        {
          *v44 = *v45;
          v44[1] = v45[1];
          v85 = *(int *)(v46 + 20);
          v108 = (char *)v45 + v85;
          v112 = (char *)v44 + v85;
          v86 = type metadata accessor for Date();
          v87 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v86 - 8) + 16);
          swift_bridgeObjectRetain();
          v87(v112, v108, v86);
          v88 = *(int *)(v46 + 24);
          v89 = (_QWORD *)((char *)v44 + v88);
          v90 = (_QWORD *)((char *)v45 + v88);
          *v89 = *v90;
          v89[1] = v90[1];
          v91 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v47 + 56);
          swift_bridgeObjectRetain();
          v91(v44, 0, 1, v46);
        }
        *(_QWORD *)((char *)a1 + v42[8]) = *(_QWORD *)((char *)a2 + v42[8]);
        *(_QWORD *)((char *)a1 + v42[9]) = *(_QWORD *)((char *)a2 + v42[9]);
        v92 = v42[10];
        v93 = (char *)a1 + v92;
        v94 = (char *)a2 + v92;
        v95 = *(_QWORD *)((char *)a2 + v92 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v95)
        {
          *(_QWORD *)v93 = *(_QWORD *)v94;
          *((_QWORD *)v93 + 1) = *((_QWORD *)v94 + 1);
          *((_QWORD *)v93 + 2) = *((_QWORD *)v94 + 2);
          *((_QWORD *)v93 + 3) = *((_QWORD *)v94 + 3);
          v93[32] = v94[32];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          v102 = *(_OWORD *)v94;
          v103 = *((_OWORD *)v94 + 1);
          v93[32] = v94[32];
          *(_OWORD *)v93 = v102;
          *((_OWORD *)v93 + 1) = v103;
        }
        *((_BYTE *)a1 + v42[11]) = *((_BYTE *)a2 + v42[11]);
        goto LABEL_33;
      case 4u:
        *a1 = *a2;
        v50 = (void *)a2[1];
        swift_bridgeObjectRetain();
        v51 = v50;
        a1[1] = v50;
LABEL_33:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

char *initializeWithTake for LACUIRatchetViewModel.State(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  __int128 v23;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[16] = a2[16];
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      v7 = v6[7];
      v8 = &a1[v7];
      v9 = &a2[v7];
      v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      v11 = *(_QWORD *)(v10 - 8);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
        goto LABEL_11;
      goto LABEL_10;
    case 1u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[16] = a2[16];
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      v12 = v6[7];
      v8 = &a1[v12];
      v9 = &a2[v12];
      v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      v11 = *(_QWORD *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
        goto LABEL_10;
      goto LABEL_11;
    case 2u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[16] = a2[16];
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      v13 = v6[7];
      v8 = &a1[v13];
      v9 = &a2[v13];
      v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      v11 = *(_QWORD *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
        goto LABEL_10;
      goto LABEL_11;
    case 3u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[16] = a2[16];
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
      v14 = v6[7];
      v8 = &a1[v14];
      v9 = &a2[v14];
      v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      v11 = *(_QWORD *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
LABEL_10:
        v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
      }
      else
      {
LABEL_11:
        *(_OWORD *)v8 = *(_OWORD *)v9;
        v16 = *(int *)(v10 + 20);
        v17 = &v8[v16];
        v18 = &v9[v16];
        v19 = type metadata accessor for Date();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
        *(_OWORD *)&v8[*(int *)(v10 + 24)] = *(_OWORD *)&v9[*(int *)(v10 + 24)];
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      *(_QWORD *)&a1[v6[8]] = *(_QWORD *)&a2[v6[8]];
      *(_QWORD *)&a1[v6[9]] = *(_QWORD *)&a2[v6[9]];
      v20 = v6[10];
      v21 = &a1[v20];
      v22 = &a2[v20];
      v21[32] = v22[32];
      v23 = *((_OWORD *)v22 + 1);
      *(_OWORD *)v21 = *(_OWORD *)v22;
      *((_OWORD *)v21 + 1) = v23;
      a1[v6[11]] = a2[v6[11]];
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

char *assignWithTake for LACUIRatchetViewModel.State(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  __int128 v23;

  if (a1 != a2)
  {
    outlined destroy of LACUIAuthCountdownView((uint64_t)a1, type metadata accessor for LACUIRatchetViewModel.State);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        a1[16] = a2[16];
        *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
        v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        v7 = v6[7];
        v8 = &a1[v7];
        v9 = &a2[v7];
        v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        v11 = *(_QWORD *)(v10 - 8);
        if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
          goto LABEL_11;
        goto LABEL_7;
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        a1[16] = a2[16];
        *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
        v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        v12 = v6[7];
        v8 = &a1[v12];
        v9 = &a2[v12];
        v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        v11 = *(_QWORD *)(v10 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
          goto LABEL_7;
        goto LABEL_11;
      case 2u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        a1[16] = a2[16];
        *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
        v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        v14 = v6[7];
        v8 = &a1[v14];
        v9 = &a2[v14];
        v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        v11 = *(_QWORD *)(v10 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
          goto LABEL_7;
        goto LABEL_11;
      case 3u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        a1[16] = a2[16];
        *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
        v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
        v15 = v6[7];
        v8 = &a1[v15];
        v9 = &a2[v15];
        v10 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
        v11 = *(_QWORD *)(v10 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
        {
LABEL_7:
          v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
          memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
        }
        else
        {
LABEL_11:
          *(_OWORD *)v8 = *(_OWORD *)v9;
          v16 = *(int *)(v10 + 20);
          v17 = &v8[v16];
          v18 = &v9[v16];
          v19 = type metadata accessor for Date();
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
          *(_OWORD *)&v8[*(int *)(v10 + 24)] = *(_OWORD *)&v9[*(int *)(v10 + 24)];
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
        }
        *(_QWORD *)&a1[v6[8]] = *(_QWORD *)&a2[v6[8]];
        *(_QWORD *)&a1[v6[9]] = *(_QWORD *)&a2[v6[9]];
        v20 = v6[10];
        v21 = &a1[v20];
        v22 = &a2[v20];
        v21[32] = v22[32];
        v23 = *((_OWORD *)v22 + 1);
        *(_OWORD *)v21 = *(_OWORD *)v22;
        *((_OWORD *)v21 + 1) = v23;
        a1[v6[11]] = a2[v6[11]];
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIRatchetViewModel.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for LACUIRatchetViewModel.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t destructiveInjectEnumTag for LACUIRatchetViewModel.State()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata completion function for LACUIRatchetViewModel.State()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LACUIAuthCountdownConfiguration();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_240ACA31C()
{
  return objectdestroy_3Tm((void (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

uint64_t outlined assign with copy of LACUIRatchetViewModel.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LACUIRatchetViewModel.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_240ACA420()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in LACUIRatchetViewModel.handleButtonTap(_:)(void *a1, char a2)
{
  uint64_t v2;

  return closure #1 in LACUIRatchetViewModel.handleButtonTap(_:)(a1, a2 & 1, v2);
}

uint64_t sub_240ACA450()
{
  return objectdestroy_3Tm((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroy_3Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_unknownObjectRelease();

  a1(*(_QWORD *)(v1 + 48));
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in LACUIRatchetViewModel.confirmBiometry(completion:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:);
  *(_QWORD *)(v3 + 144) = v2;
  *(_OWORD *)(v3 + 128) = v4;
  return swift_task_switch();
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t outlined init with take of (key: AnyHashable, value: Any)?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: AnyHashable, value: Any)?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroy_13Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LACUIRatchetViewModel.State(0) - 8) + 80);
  swift_unknownObjectRelease();

  v2 = v0 + ((v1 + 40) & ~v1);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
      outlined consume of LACUIAuthImageConfiguration();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v3 = type metadata accessor for LACUIAuthCountdownConfiguration();
      v4 = v2 + *(int *)(v3 + 28);
      v5 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
      {
        swift_bridgeObjectRelease();
        v6 = v4 + *(int *)(v5 + 20);
        v7 = type metadata accessor for Date();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v2 + *(int *)(v3 + 40) + 8))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      break;
    case 4u:
      swift_bridgeObjectRelease();

      break;
    default:
      return swift_deallocObject();
  }
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type CancellationError and conformance CancellationError()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CancellationError and conformance CancellationError;
  if (!lazy protocol witness table cache variable for type CancellationError and conformance CancellationError)
  {
    v1 = type metadata accessor for CancellationError();
    result = MEMORY[0x242688798](MEMORY[0x24BEE6848], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CancellationError and conformance CancellationError);
  }
  return result;
}

void partial apply for closure #1 in LACUIRatchetViewModel.setupContinuationAndWait()(uint64_t a1)
{
  uint64_t v1;

  closure #1 in LACUIRatchetViewModel.setupContinuationAndWait()(a1, v1);
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for LACDTORatchetStateComposite(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t key path getter for LACUIFaceIDSpinnerViewModel.state : LACUIFaceIDSpinnerViewModel@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 88))();
  *a2 = result;
  return result;
}

uint64_t key path setter for LACUIFaceIDSpinnerViewModel.state : LACUIFaceIDSpinnerViewModel(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 96))(*a1);
}

uint64_t LACUIFaceIDSpinnerViewModel.state.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_240ACA8E4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 88))();
  *a2 = result;
  return result;
}

uint64_t sub_240ACA914(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 96))(*a1);
}

uint64_t LACUIFaceIDSpinnerViewModel.state.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return static Published.subscript.setter();
}

void (*LACUIFaceIDSpinnerViewModel.state.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return LACUILockViewModel.state.modify;
}

uint64_t key path setter for LACUIFaceIDSpinnerViewModel.$state : LACUIFaceIDSpinnerViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>.Publisher);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 120))(v6);
}

uint64_t LACUIFaceIDSpinnerViewModel.$state.getter()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
  Published.projectedValue.getter();
  return swift_endAccess();
}

uint64_t LACUIFaceIDSpinnerViewModel.$state.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>.Publisher);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*LACUIFaceIDSpinnerViewModel.$state.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>.Publisher);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIFaceIDSpinnerViewModel__state;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
  Published.projectedValue.getter();
  swift_endAccess();
  return LACUILockViewModel.$state.modify;
}

uint64_t LACUIFaceIDSpinnerViewModel.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  type metadata accessor for LACUIFaceIDSpinnerState(0);
  Published.init(initialValue:)();
  return v0;
}

uint64_t LACUIFaceIDSpinnerViewModel.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD v7[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIFaceIDSpinnerViewModel__state;
  v7[1] = 0;
  type metadata accessor for LACUIFaceIDSpinnerState(0);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v5, v4, v1);
  return v0;
}

uint64_t LACUIFaceIDSpinnerViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIFaceIDSpinnerViewModel__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t LACUIFaceIDSpinnerViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIFaceIDSpinnerViewModel__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance LACUIFaceIDSpinnerViewModel@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for LACUIFaceIDSpinnerViewModel();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_240ACAE90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 112))();
}

uint64_t ObjC metadata update function for LACUIFaceIDSpinnerViewModel()
{
  return type metadata accessor for LACUIFaceIDSpinnerViewModel();
}

uint64_t type metadata accessor for LACUIFaceIDSpinnerViewModel()
{
  uint64_t result;

  result = type metadata singleton initialization cache for LACUIFaceIDSpinnerViewModel;
  if (!type metadata singleton initialization cache for LACUIFaceIDSpinnerViewModel)
    return swift_getSingletonMetadata();
  return result;
}

void type metadata completion function for LACUIFaceIDSpinnerViewModel()
{
  unint64_t v0;

  type metadata accessor for Published<LACUIFaceIDSpinnerState>();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for LACUIFaceIDSpinnerViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.state.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.state.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.$state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.$state.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.$state.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of LACUIFaceIDSpinnerViewModel.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

void type metadata accessor for Published<LACUIFaceIDSpinnerState>()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Published<LACUIFaceIDSpinnerState>)
  {
    type metadata accessor for LACUIFaceIDSpinnerState(255);
    v0 = type metadata accessor for Published();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Published<LACUIFaceIDSpinnerState>);
  }
}

id LACUIOnenessUnsatisfiablePresentationHandler.__allocating_init(request:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = specialized LACUIOnenessUnsatisfiablePresentationHandler.init(request:)(a1);

  return v4;
}

id LACUIOnenessUnsatisfiablePresentationHandler.init(request:)(void *a1)
{
  id v2;

  v2 = specialized LACUIOnenessUnsatisfiablePresentationHandler.init(request:)(a1);

  return v2;
}

void LACUIOnenessUnsatisfiablePresentationHandler.__allocating_init(configuration:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void LACUIOnenessUnsatisfiablePresentationHandler.init(configuration:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LACUIOnenessUnsatisfiablePresentationHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LACUIOnenessUnsatisfiablePresentationHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id specialized LACUIOnenessUnsatisfiablePresentationHandler.init(request:)(void *a1)
{
  char *v1;
  unsigned int v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  objc_class *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  objc_super v34;
  Swift::String v35;
  Swift::String v36;
  Swift::String v37;
  Swift::String v38;

  v3 = objc_msgSend((id)objc_opt_self(), sel_deviceHasFaceID);
  v4 = objc_msgSend(a1, sel_userInterfaceRequest);
  v5 = objc_msgSend(v4, sel_clientInfo);

  v6 = objc_msgSend(v5, sel_displayName);
  if (!v3)
  {
    if (v6)
    {
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v14 = v13;

      v32 = MEMORY[0x24BEE0D00];
      v33 = lazy protocol witness table accessor for type String and conformance String();
      v30 = v12;
      v31 = v14;
      swift_bridgeObjectRetain_n();
      v10 = 0xD000000000000027;
      v11 = "OPERATION_UNSUPPORTED_COMPANION_TOUCHID";
      goto LABEL_6;
    }
    v19 = 0xD000000000000031;
    v20 = "OPERATION_UNSUPPORTED_COMPANION_TOUCHID_ANONYMOUS";
LABEL_9:
    v36._countAndFlagsBits = 0x75676F6C61746143;
    v36._object = (void *)0xE900000000000065;
    v16 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(v19, (void *)((unint64_t)(v20 - 32) | 0x8000000000000000), v36);
    v18 = v21;
    goto LABEL_10;
  }
  if (!v6)
  {
    v19 = 0xD000000000000030;
    v20 = "OPERATION_UNSUPPORTED_COMPANION_FACEID_ANONYMOUS";
    goto LABEL_9;
  }
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;

  v32 = MEMORY[0x24BEE0D00];
  v33 = lazy protocol witness table accessor for type String and conformance String();
  v30 = v7;
  v31 = v9;
  swift_bridgeObjectRetain_n();
  v10 = 0xD000000000000026;
  v11 = "OPERATION_UNSUPPORTED_COMPANION_FACEID";
LABEL_6:
  v35._countAndFlagsBits = 0x75676F6C61746143;
  v35._object = (void *)0xE900000000000065;
  specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(v10, (void *)((unint64_t)(v11 - 32) | 0x8000000000000000), v35);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_240AE1F20;
  outlined init with copy of CVarArg((uint64_t)&v30, v15 + 32);
  v16 = String.init(format:_:)();
  v18 = v17;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v30);
  swift_bridgeObjectRelease_n();
LABEL_10:
  v37._countAndFlagsBits = 0x75676F6C61746143;
  v37._object = (void *)0xE900000000000065;
  v22 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000017, (void *)0x8000000240AE41A0, v37);
  v24 = v23;
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  v25 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xED00004C45434E41, v38);
  v26 = &v1[OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration];
  *(_QWORD *)v26 = 3;
  *((_QWORD *)v26 + 1) = v22;
  *((_QWORD *)v26 + 2) = v24;
  *((_QWORD *)v26 + 3) = v16;
  *((_QWORD *)v26 + 4) = v18;
  *((_QWORD *)v26 + 5) = v25;
  *((_QWORD *)v26 + 6) = v27;
  v28 = (objc_class *)type metadata accessor for LACUIAlertScenePresentationHandler();
  v34.receiver = v1;
  v34.super_class = v28;
  return objc_msgSendSuper2(&v34, sel_init);
}

uint64_t type metadata accessor for LACUIOnenessUnsatisfiablePresentationHandler()
{
  return objc_opt_self();
}

uint64_t method lookup function for LACUIOnenessUnsatisfiablePresentationHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LACUIOnenessUnsatisfiablePresentationHandler.__allocating_init(request:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t outlined init with copy of CVarArg(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t default argument 1 of LACUIAuthCountdownView.init(viewModel:colorScheme:)@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  return swift_storeEnumTagMultiPayload();
}

uint64_t LACUIAuthCountdownView.init(viewModel:colorScheme:)@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  type metadata accessor for LACUIAuthCountdownViewModel();
  lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel((unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel, (uint64_t (*)(uint64_t))type metadata accessor for LACUIAuthCountdownViewModel, (uint64_t)&protocol conformance descriptor for LACUIAuthCountdownViewModel);
  *a2 = ObservedObject.init(wrappedValue:)();
  a2[1] = v4;
  v5 = type metadata accessor for LACUIAuthCountdownView();
  return outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(a1, (uint64_t)a2 + *(int *)(v5 + 20), &demangling cache variable for type metadata for Environment<ColorScheme>);
}

__n128 specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  _OWORD *v24;
  __n128 result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v13, a9, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>);
  v24 = (_OWORD *)(a9
                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>)
                          + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *v24 = v26;
  v24[1] = v27;
  result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

__n128 specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  char v18;
  void *v27;
  __n128 result;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __n128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v18 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    v27 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    v18 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(_QWORD *)a9 = a16;
  *(_BYTE *)(a9 + 8) = v18 & 1;
  *(_OWORD *)(a9 + 80) = v33;
  *(_OWORD *)(a9 + 96) = v34;
  *(_OWORD *)(a9 + 112) = v35;
  *(_OWORD *)(a9 + 16) = v29;
  *(_OWORD *)(a9 + 32) = v30;
  result = v32;
  *(_OWORD *)(a9 + 48) = v31;
  *(__n128 *)(a9 + 64) = v32;
  return result;
}

uint64_t specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  _OWORD *v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  *(_OWORD *)((char *)a9 + 57) = *(_OWORD *)((char *)v13 + 57);
  v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  a9[9] = v31;
  a9[10] = v32;
  a9[11] = v33;
  a9[5] = v27;
  a9[6] = v28;
  a9[7] = v29;
  a9[8] = v30;
  return outlined retain of ModifiedContent<Text, _PaddingLayout>((uint64_t)v13);
}

uint64_t LACUIAuthCountdownView.viewModel.getter()
{
  return swift_retain();
}

uint64_t LACUIAuthCountdownView.viewModel.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*LACUIAuthCountdownView.viewModel.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownView.$viewModel.getter()
{
  type metadata accessor for LACUIAuthCountdownViewModel();
  lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel((unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel, (uint64_t (*)(uint64_t))type metadata accessor for LACUIAuthCountdownViewModel, (uint64_t)&protocol conformance descriptor for LACUIAuthCountdownViewModel);
  return ObservedObject.projectedValue.getter();
}

uint64_t LACUIAuthCountdownView.colorScheme.getter@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for LACUIAuthCountdownView();
  return specialized Environment.wrappedValue.getter(&demangling cache variable for type metadata for Environment<ColorScheme>.Content, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB418], 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t specialized Environment.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  return specialized Environment.wrappedValue.getter(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content, (uint64_t (*)(_QWORD))MEMORY[0x24BDECF50], 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t specialized Environment.wrappedValue.getter@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  os_log_type_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v24 = a4;
  v9 = v5;
  v11 = type metadata accessor for EnvironmentValues();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = static os_log_type_t.fault.getter();
    v21 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v21, v20))
    {
      v22 = swift_slowAlloc();
      v23 = swift_slowAlloc();
      v25 = v23;
      *(_DWORD *)v22 = 136315138;
      *(_QWORD *)(v22 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, v24, &v25);
      _os_log_impl(&dword_240AAB000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242688840](v23, -1, -1);
      MEMORY[0x242688840](v22, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t LACUIAuthCountdownView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  int v18;
  id v19;
  int v20;
  int v21;
  void *v22;
  uint64_t v23;
  char v24;
  char *v25;
  uint64_t v27;
  uint64_t v28;

  v28 = a1;
  v2 = type metadata accessor for ColorScheme();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedCont);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifie);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityA);
  MEMORY[0x24BDAC7A8](v27);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v11 = static HorizontalAlignment.center.getter();
  *((_QWORD *)v11 + 1) = 0x4034000000000000;
  v11[16] = 0;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttach);
  closure #1 in LACUIAuthCountdownView.body.getter(v1, (uint64_t)&v11[*(int *)(v17 + 44)]);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v11, (uint64_t)v14, &demangling cache variable for type metadata for VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedCont);
  v14[*(int *)(v12 + 36)] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v11, &demangling cache variable for type metadata for VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedCont);
  type metadata accessor for LACUIAuthCountdownView();
  specialized Environment.wrappedValue.getter(&demangling cache variable for type metadata for Environment<ColorScheme>.Content, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB418], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v8);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v18 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  if (v18 == *MEMORY[0x24BDEB400])
  {
    v19 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
  }
  else
  {
    v20 = v18;
    v21 = *MEMORY[0x24BDEB3F0];
    v22 = (void *)objc_opt_self();
    if (v20 != v21)
    {
      v23 = MEMORY[0x242687EBC](objc_msgSend(v22, sel_systemBackgroundColor));
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      goto LABEL_7;
    }
    v19 = objc_msgSend(v22, sel_secondarySystemBackgroundColor);
  }
  v23 = MEMORY[0x242687EBC](v19);
LABEL_7:
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  v24 = static Edge.Set.all.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v14, (uint64_t)v16, &demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifie);
  v25 = &v16[*(int *)(v27 + 36)];
  *(_QWORD *)v25 = v23;
  v25[8] = v24;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v14, &demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifie);
  return outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v16, v28, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityA);
}

uint64_t closure #1 in LACUIAuthCountdownView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _OWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, char *, uint64_t);
  char *v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  void (*v89)(char *, uint64_t);
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  uint64_t v116;
  char v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t v148;
  char v149;
  uint64_t v150;
  uint64_t v151;
  char v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  int *v164;
  uint64_t v165;
  char *v167;
  char *v168;
  uint64_t v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  char *v222;
  char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  _OWORD v232[8];

  v217 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  MEMORY[0x24BDAC7A8](v3);
  v213 = (uint64_t *)((char *)&v167 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v210 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v210);
  v206 = (uint64_t)&v167 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v211 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v211);
  v214 = (uint64_t)&v167 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v212 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, _FixedSizeLayout>);
  v7 = MEMORY[0x24BDAC7A8](v212);
  v218 = (uint64_t)&v167 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v216 = (uint64_t)&v167 - v9;
  v10 = type metadata accessor for LACUIAuthCountdownDelayView();
  MEMORY[0x24BDAC7A8](v10);
  v181 = (uint64_t)&v167 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v178 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v178);
  v180 = (uint64_t)&v167 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v208 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>);
  v207 = *(_QWORD *)(v208 - 8);
  MEMORY[0x24BDAC7A8](v208);
  v179 = (uint64_t)&v167 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v167 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v193 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v192 = *(_QWORD *)(v193 - 8);
  MEMORY[0x24BDAC7A8](v193);
  v177 = (uint64_t)&v167 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>?);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v215 = (uint64_t)&v167 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v229 = (uint64_t)&v167 - v21;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
  MEMORY[0x24BDAC7A8](v22);
  v186 = (uint64_t *)((char *)&v167 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  v182 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v182);
  v189 = (uint64_t)&v167 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v183 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v183);
  v187 = (uint64_t)&v167 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v184 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>);
  MEMORY[0x24BDAC7A8](v184);
  v188 = (uint64_t)&v167 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v191 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  v190 = *(_QWORD *)(v191 - 8);
  MEMORY[0x24BDAC7A8](v191);
  v185 = (uint64_t)&v167 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>?);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v209 = (uint64_t)&v167 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v226 = (uint64_t)&v167 - v31;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  MEMORY[0x24BDAC7A8](v32);
  v194 = (uint64_t *)((char *)&v167 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  v200 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v200);
  v205 = (uint64_t)&v167 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v202 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v202);
  v204 = (uint64_t)&v167 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v201 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>);
  MEMORY[0x24BDAC7A8](v201);
  v203 = (uint64_t)&v167 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v199 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  v37 = MEMORY[0x24BDAC7A8](v199);
  v39 = (char *)&v167 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v37);
  v41 = (char *)&v167 - v40;
  v198 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>);
  MEMORY[0x24BDAC7A8](v198);
  v197 = (uint64_t)&v167 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>);
  v44 = MEMORY[0x24BDAC7A8](v43);
  v231 = (uint64_t)&v167 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v44);
  v230 = (uint64_t)&v167 - v46;
  v47 = type metadata accessor for LACUIAuthCountdownView();
  v219 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v220 = v48;
  v221 = (uint64_t)&v167 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  v172 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>);
  v171 = *(_QWORD *)(v172 - 8);
  v49 = MEMORY[0x24BDAC7A8](v172);
  v170 = (char *)&v167 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v49);
  v52 = (char *)&v167 - v51;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>);
  MEMORY[0x24BDAC7A8](v53);
  v55 = (char *)&v167 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  v176 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>);
  v56 = MEMORY[0x24BDAC7A8](v176);
  v169 = (uint64_t)&v167 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v56);
  v173 = (uint64_t)&v167 - v58;
  v174 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>.Storage);
  MEMORY[0x24BDAC7A8](v174);
  v60 = (_OWORD *)((char *)&v167 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0));
  v196 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>);
  v195 = *(_QWORD *)(v196 - 8);
  MEMORY[0x24BDAC7A8](v196);
  v175 = (char *)&v167 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?);
  v63 = MEMORY[0x24BDAC7A8](v62);
  v227 = (uint64_t)&v167 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v63);
  v66 = (char *)&v167 - v65;
  v67 = *(_QWORD *)(a1 + 8) + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration;
  v68 = type metadata accessor for LACUIAuthCountdownConfiguration();
  v69 = v68;
  v70 = 1;
  v71 = *(_BYTE *)(v67 + *(int *)(v68 + 44)) == 1;
  v224 = a1;
  v225 = v68;
  v222 = v39;
  v223 = v41;
  v228 = v66;
  if (v71)
  {
    v168 = v16;
    v72 = v67 + *(int *)(v68 + 40);
    v73 = *(_QWORD *)(v72 + 8);
    if (v73)
    {
      v74 = *(_BYTE *)(v72 + 32);
      v76 = *(_QWORD *)(v72 + 16);
      v75 = *(_QWORD *)(v72 + 24);
      v77 = *(_QWORD *)v72;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthButtonConfiguration>);
      v78 = swift_allocObject();
      *(_OWORD *)(v78 + 16) = xmmword_240AE1F20;
      *(_QWORD *)(v78 + 32) = v77;
      *(_QWORD *)(v78 + 40) = v73;
      *(_QWORD *)(v78 + 48) = v76;
      *(_QWORD *)(v78 + 56) = v75;
      *(_BYTE *)(v78 + 64) = v74;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      *(_QWORD *)v55 = static VerticalAlignment.center.getter();
      *((_QWORD *)v55 + 1) = 0;
      v55[16] = 1;
      v167 = &v55[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_HStackLayout, TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>)
                         + 44)];
      *(_QWORD *)&v232[0] = v78;
      v79 = v221;
      outlined init with copy of LACUIAuthCountdownConfiguration(v224, v221, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
      v80 = (*(unsigned __int8 *)(v219 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v219 + 80);
      v81 = swift_allocObject();
      outlined init with take of LACUIAuthCountdownDelayConfiguration(v79, v81 + v80, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [LACUIAuthButtonConfiguration]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>);
      lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type [LACUIAuthButtonConfiguration] and conformance [A], &demangling cache variable for type metadata for [LACUIAuthButtonConfiguration], MEMORY[0x24BEE12D8]);
      lazy protocol witness table accessor for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>();
      lazy protocol witness table accessor for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration();
      a1 = v224;
      ForEach<>.init(_:content:)();
      v82 = v171;
      v83 = *(void (**)(char *, char *, uint64_t))(v171 + 16);
      v84 = v170;
      v85 = v172;
      v83(v170, v52, v172);
      v86 = v167;
      *(_QWORD *)v167 = 0;
      v86[8] = 1;
      v87 = v86;
      v88 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>));
      v83(&v87[*(int *)(v88 + 48)], v84, v85);
      v89 = *(void (**)(char *, uint64_t))(v82 + 8);
      v89(v52, v85);
      v89(v84, v85);
      swift_bridgeObjectRelease();
      v90 = v169;
      outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v55, v169, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>);
      *(_WORD *)(v90 + *(int *)(v176 + 36)) = 256;
      outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v55, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>);
      v91 = v173;
      outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v90, v173, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>);
      outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v91, (uint64_t)v60, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Spacer, _FlexFrameLayout>);
      lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout> and conformance <> ModifiedContent<A, B>();
      lazy protocol witness table accessor for type ModifiedContent<Text, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<Spacer, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<Spacer, _FlexFrameLayout>, MEMORY[0x24BDF4610], MEMORY[0x24BDEDBB8]);
      v92 = (uint64_t)v175;
      v39 = v222;
      _ConditionalContent<>.init(storage:)();
      outlined destroy of LACUIAuthCountdownDelayConfiguration?(v91, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>);
    }
    else
    {
      v93 = static Alignment.center.getter();
      specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v232, 0.0, 1, 40.0, 0, v93, v94, 0, 1);
      v95 = v232[5];
      v60[4] = v232[4];
      v60[5] = v95;
      v96 = v232[7];
      v60[6] = v232[6];
      v60[7] = v96;
      v97 = v232[1];
      *v60 = v232[0];
      v60[1] = v97;
      v98 = v232[3];
      v60[2] = v232[2];
      v60[3] = v98;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Spacer, _FlexFrameLayout>);
      lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout> and conformance <> ModifiedContent<A, B>();
      lazy protocol witness table accessor for type ModifiedContent<Text, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<Spacer, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<Spacer, _FlexFrameLayout>, MEMORY[0x24BDF4610], MEMORY[0x24BDEDBB8]);
      v92 = (uint64_t)v175;
      _ConditionalContent<>.init(storage:)();
    }
    v66 = v228;
    outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v92, (uint64_t)v228, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>);
    v70 = 0;
    v41 = v223;
    v16 = v168;
    v69 = v225;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v195 + 56))(v66, v70, 1, v196);
  v99 = v197;
  LACUIAuthCountdownView.lockIcon.getter(v197);
  lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, (uint64_t (*)(void))lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>, MEMORY[0x24BDEBEE0]);
  v100 = v231;
  View.accessibilityHidden(_:)();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v99, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>);
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v100, v230, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>);
  v101 = static HorizontalAlignment.center.getter();
  v102 = (uint64_t)v194;
  *v194 = v101;
  *(_QWORD *)(v102 + 8) = 0;
  *(_BYTE *)(v102 + 16) = 1;
  v103 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  closure #1 in LACUIAuthCountdownView.informativeText.getter(a1, v102 + *(int *)(v103 + 44));
  v104 = static Edge.Set.horizontal.getter();
  v105 = v205;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v102, v205, &demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  v106 = v105 + *(int *)(v200 + 36);
  *(_BYTE *)v106 = v104;
  *(_OWORD *)(v106 + 8) = 0u;
  *(_OWORD *)(v106 + 24) = 0u;
  *(_BYTE *)(v106 + 40) = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v102, &demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  v107 = static Edge.Set.horizontal.getter();
  v108 = v204;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v105, v204, &demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
  v109 = v108 + *(int *)(v202 + 36);
  *(_BYTE *)v109 = v107;
  *(_OWORD *)(v109 + 8) = 0u;
  *(_OWORD *)(v109 + 24) = 0u;
  *(_BYTE *)(v109 + 40) = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v105, &demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
  v110 = v203;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v108, v203, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>);
  *(_QWORD *)(v110 + *(int *)(v201 + 36)) = 0x3FF0000000000000;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v108, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v110, (uint64_t)v39, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>);
  *(_WORD *)&v39[*(int *)(v199 + 36)] = 256;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v110, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>);
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v39, (uint64_t)v41, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  v111 = *(_QWORD *)(*(_QWORD *)(a1 + 8)
                   + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration
                   + *(int *)(v69 + 32));
  if (v111)
  {
    swift_bridgeObjectRetain();
    v112 = static HorizontalAlignment.leading.getter();
    v113 = (uint64_t)v186;
    *v186 = v112;
    *(_QWORD *)(v113 + 8) = 0x4038000000000000;
    *(_BYTE *)(v113 + 16) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
    *(_QWORD *)&v232[0] = v111;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [LACUIAuthCountdownItemConfiguration]);
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type [LACUIAuthCountdownItemConfiguration] and conformance [A], &demangling cache variable for type metadata for [LACUIAuthCountdownItemConfiguration], MEMORY[0x24BEE12D8]);
    lazy protocol witness table accessor for type LACUIAuthCountdownItemView and conformance LACUIAuthCountdownItemView();
    lazy protocol witness table accessor for type LACUIAuthCountdownItemConfiguration and conformance LACUIAuthCountdownItemConfiguration();
    ForEach<>.init(_:content:)();
    v114 = static Edge.Set.horizontal.getter();
    v115 = v189;
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v113, v189, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
    v116 = v115 + *(int *)(v182 + 36);
    *(_BYTE *)v116 = v114;
    *(_OWORD *)(v116 + 8) = 0u;
    *(_OWORD *)(v116 + 24) = 0u;
    *(_BYTE *)(v116 + 40) = 1;
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v113, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
    v117 = static Edge.Set.all.getter();
    v118 = v187;
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v115, v187, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
    v119 = v118 + *(int *)(v183 + 36);
    *(_BYTE *)v119 = v117;
    *(_OWORD *)(v119 + 8) = 0u;
    *(_OWORD *)(v119 + 24) = 0u;
    *(_BYTE *)(v119 + 40) = 1;
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v115, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
    v120 = v188;
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v118, v188, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>);
    *(_QWORD *)(v120 + *(int *)(v184 + 36)) = 0x3FF0000000000000;
    v121 = v118;
    v122 = v225;
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v121, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>);
    swift_bridgeObjectRelease();
    v123 = v185;
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v120, v185, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>);
    v124 = v191;
    *(_WORD *)(v123 + *(int *)(v191 + 36)) = 256;
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v120, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>);
    v125 = v226;
    outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v123, v226, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
    v126 = 0;
    v127 = v229;
    v128 = v224;
    v129 = v193;
    v130 = v192;
    v131 = v190;
  }
  else
  {
    v122 = v69;
    v127 = v229;
    v128 = v224;
    v125 = v226;
    v129 = v193;
    v130 = v192;
    v124 = v191;
    v131 = v190;
    v126 = 1;
  }
  v132 = v125;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v131 + 56))(v125, v126, 1, v124);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(*(_QWORD *)(v128 + 8)+ *(int *)(v122 + 28)+ OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration, (uint64_t)v16, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v130 + 48))(v16, 1, v129) == 1)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v16, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    v133 = 1;
    v134 = v208;
  }
  else
  {
    v135 = (uint64_t)v16;
    v136 = v177;
    outlined init with take of LACUIAuthCountdownDelayConfiguration(v135, v177, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
    v137 = v181;
    outlined init with copy of LACUIAuthCountdownConfiguration(v136, v181, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
    v138 = static Edge.Set.vertical.getter();
    v139 = v180;
    outlined init with copy of LACUIAuthCountdownConfiguration(v137, v180, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayView);
    v140 = v139 + *(int *)(v178 + 36);
    *(_BYTE *)v140 = v138;
    *(_OWORD *)(v140 + 8) = 0u;
    *(_OWORD *)(v140 + 24) = 0u;
    *(_BYTE *)(v140 + 40) = 1;
    v141 = v137;
    v122 = v225;
    outlined destroy of LACUIAuthCountdownView(v141, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayView);
    v142 = v179;
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v139, v179, &demangling cache variable for type metadata for ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>);
    v134 = v208;
    *(_WORD *)(v142 + *(int *)(v208 + 36)) = 256;
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v139, &demangling cache variable for type metadata for ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>);
    outlined destroy of LACUIAuthCountdownView(v136, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
    outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v142, v127, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>);
    v133 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v207 + 56))(v127, v133, 1, v134);
  v143 = static HorizontalAlignment.center.getter();
  v144 = (uint64_t)v213;
  *v213 = v143;
  *(_QWORD *)(v144 + 8) = 0;
  *(_BYTE *)(v144 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  *(_QWORD *)&v232[0] = *(_QWORD *)(*(_QWORD *)(v128 + 8)
                                  + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration
                                  + *(int *)(v122 + 36));
  v145 = v128;
  v146 = v221;
  outlined init with copy of LACUIAuthCountdownConfiguration(v145, v221, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
  v147 = (*(unsigned __int8 *)(v219 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v219 + 80);
  v148 = swift_allocObject();
  outlined init with take of LACUIAuthCountdownDelayConfiguration(v146, v148 + v147, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [LACUIAuthButtonConfiguration]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>);
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type [LACUIAuthButtonConfiguration] and conformance [A], &demangling cache variable for type metadata for [LACUIAuthButtonConfiguration], MEMORY[0x24BEE12D8]);
  lazy protocol witness table accessor for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>();
  lazy protocol witness table accessor for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration();
  ForEach<>.init(_:content:)();
  v149 = static Edge.Set.horizontal.getter();
  v150 = v206;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v144, v206, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  v151 = v150 + *(int *)(v210 + 36);
  *(_BYTE *)v151 = v149;
  *(_OWORD *)(v151 + 8) = 0u;
  *(_OWORD *)(v151 + 24) = 0u;
  *(_BYTE *)(v151 + 40) = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v144, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  v152 = static Edge.Set.horizontal.getter();
  v153 = v214;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v150, v214, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
  v154 = v153 + *(int *)(v211 + 36);
  *(_BYTE *)v154 = v152;
  *(_OWORD *)(v154 + 8) = 0u;
  *(_OWORD *)(v154 + 24) = 0u;
  *(_BYTE *)(v154 + 40) = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v150, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
  v155 = v218;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v153, v218, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>);
  *(_WORD *)(v155 + *(int *)(v212 + 36)) = 256;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v153, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>);
  v156 = v216;
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v155, v216, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, _FixedSizeLayout>);
  v157 = v227;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v228, v227, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?);
  v158 = v231;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v230, v231, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>);
  v159 = (uint64_t)v223;
  v160 = (uint64_t)v222;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v223, (uint64_t)v222, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  v161 = v209;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v132, v209, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>?);
  v162 = v215;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v229, v215, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>?);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v156, v155, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, _FixedSizeLayout>);
  v163 = v217;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v157, v217, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?);
  v164 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _Enviro);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v158, v163 + v164[12], &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v160, v163 + v164[16], &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v161, v163 + v164[20], &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>?);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v162, v163 + v164[24], &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>?);
  v165 = v163 + v164[28];
  *(_QWORD *)v165 = 0;
  *(_BYTE *)(v165 + 8) = 1;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v155, v163 + v164[32], &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, _FixedSizeLayout>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v156, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, _FixedSizeLayout>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v229, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v226, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v159, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v230, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v228, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v155, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, _FixedSizeLayout>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v162, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<LACUIAuthCountdownDelayView, _PaddingLayout>, _FixedSizeLayout>?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v161, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v160, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, _FixedSizeLayout>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v231, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, AccessibilityAttachmentModifier>);
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?(v227, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>, ModifiedContent<Spacer, _FlexFrameLayout>>?);
}

uint64_t LACUIAuthCountdownView.barButtons(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  *(_QWORD *)a2 = static VerticalAlignment.center.getter();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_HStackLayout, TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>);
  return closure #1 in LACUIAuthCountdownView.barButtons(with:)(a1, v2, a2 + *(int *)(v5 + 44));
}

uint64_t LACUIAuthCountdownView.lockIcon.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t KeyPath;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  _OWORD *v25;
  __int128 v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v2 = v1;
  v31 = a1;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
  MEMORY[0x24BDAC7A8](v30);
  v4 = (uint64_t *)((char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymbolRenderingMode?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Image.ResizingMode();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
  MEMORY[0x24BDAC7A8](v28);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>);
  MEMORY[0x24BDAC7A8](v29);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(*(_QWORD *)(v2 + 8)
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration
                 + 16) & 1) != 0)
  {
    swift_bridgeObjectRetain();
    Image.init(systemName:)();
  }
  else
  {
    v16 = one-time initialization token for current;
    swift_bridgeObjectRetain_n();
    if (v16 != -1)
      swift_once();
    v17 = (id)static NSBundle.current;
    Image.init(_:bundle:)();
    outlined consume of LACUIAuthImageConfiguration();
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDF3FD0], v8);
  v18 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  static SymbolRenderingMode.hierarchical.getter();
  v19 = type metadata accessor for SymbolRenderingMode();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v7, 0, 1, v19);
  KeyPath = swift_getKeyPath();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v7, (uint64_t)v4 + *(int *)(v30 + 28), &demangling cache variable for type metadata for SymbolRenderingMode?);
  *v4 = KeyPath;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v4, (uint64_t)&v13[*(int *)(v28 + 36)], &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
  *(_QWORD *)v13 = v18;
  *((_QWORD *)v13 + 1) = 0;
  *((_WORD *)v13 + 8) = 1;
  swift_retain();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v4, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v7, &demangling cache variable for type metadata for SymbolRenderingMode?);
  swift_release();
  v21 = static Color.blue.getter();
  v22 = swift_getKeyPath();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v13, (uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
  v23 = (uint64_t *)&v15[*(int *)(v29 + 36)];
  *v23 = v22;
  v23[1] = v21;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v13, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  v24 = v31;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v15, v31, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>);
  v25 = (_OWORD *)(v24
                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>)
                          + 36));
  v26 = v33;
  *v25 = v32;
  v25[1] = v26;
  v25[2] = v34;
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>);
}

uint64_t LACUIAuthCountdownView.informativeText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  char *v14;
  char v15;
  char *v16;
  uint64_t v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v5 = static HorizontalAlignment.center.getter();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  closure #1 in LACUIAuthCountdownView.informativeText.getter(v1, (uint64_t)&v5[*(int *)(v12 + 44)]);
  v13 = static Edge.Set.horizontal.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v5, (uint64_t)v8, &demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  v14 = &v8[*(int *)(v6 + 36)];
  *v14 = v13;
  *(_OWORD *)(v14 + 8) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  v14[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v5, &demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>);
  v15 = static Edge.Set.horizontal.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v8, (uint64_t)v11, &demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
  v16 = &v11[*(int *)(v9 + 36)];
  *v16 = v15;
  *(_OWORD *)(v16 + 8) = 0u;
  *(_OWORD *)(v16 + 24) = 0u;
  v16[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v8, &demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v11, a1, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>);
  *(_QWORD *)(a1
            + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)
                     + 36)) = 0x3FF0000000000000;
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v11, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>);
}

uint64_t LACUIAuthCountdownView.actionItems(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  char *v14;
  char v15;
  char *v16;
  _QWORD v18[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = static HorizontalAlignment.leading.getter();
  *((_QWORD *)v6 + 1) = 0x4038000000000000;
  v6[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
  v18[1] = a1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [LACUIAuthCountdownItemConfiguration]);
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type [LACUIAuthCountdownItemConfiguration] and conformance [A], &demangling cache variable for type metadata for [LACUIAuthCountdownItemConfiguration], MEMORY[0x24BEE12D8]);
  lazy protocol witness table accessor for type LACUIAuthCountdownItemView and conformance LACUIAuthCountdownItemView();
  lazy protocol witness table accessor for type LACUIAuthCountdownItemConfiguration and conformance LACUIAuthCountdownItemConfiguration();
  ForEach<>.init(_:content:)();
  v13 = static Edge.Set.horizontal.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v6, (uint64_t)v9, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
  v14 = &v9[*(int *)(v7 + 36)];
  *v14 = v13;
  *(_OWORD *)(v14 + 8) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  v14[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v6, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>);
  v15 = static Edge.Set.all.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v9, (uint64_t)v12, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
  v16 = &v12[*(int *)(v10 + 36)];
  *v16 = v15;
  *(_OWORD *)(v16 + 8) = 0u;
  *(_OWORD *)(v16 + 24) = 0u;
  v16[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v9, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v12, a2, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>);
  *(_QWORD *)(a2
            + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)
                     + 36)) = 0x3FF0000000000000;
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v12, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>);
}

uint64_t LACUIAuthCountdownView.buttons.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  char *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20[2];

  v20[0] = a1;
  v2 = type metadata accessor for LACUIAuthCountdownView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v7 = static HorizontalAlignment.center.getter();
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_VStackLayout, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  v11 = *(_QWORD *)(v1 + 8) + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration;
  v20[1] = *(_QWORD *)(v11 + *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 36));
  outlined init with copy of LACUIAuthCountdownConfiguration(v1, (uint64_t)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
  v12 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v13 = swift_allocObject();
  outlined init with take of LACUIAuthCountdownDelayConfiguration((uint64_t)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [LACUIAuthButtonConfiguration]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>);
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type [LACUIAuthButtonConfiguration] and conformance [A], &demangling cache variable for type metadata for [LACUIAuthButtonConfiguration], MEMORY[0x24BEE12D8]);
  lazy protocol witness table accessor for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>();
  lazy protocol witness table accessor for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration();
  ForEach<>.init(_:content:)();
  v14 = static Edge.Set.horizontal.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v7, (uint64_t)v10, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  v15 = &v10[*(int *)(v8 + 36)];
  *v15 = v14;
  *(_OWORD *)(v15 + 8) = 0u;
  *(_OWORD *)(v15 + 24) = 0u;
  v15[40] = 1;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v7, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>);
  v16 = static Edge.Set.horizontal.getter();
  v17 = v20[0];
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v10, v20[0], &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
  v18 = v17
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>)
               + 36);
  *(_BYTE *)v18 = v16;
  *(_OWORD *)(v18 + 8) = 0u;
  *(_OWORD *)(v18 + 24) = 0u;
  *(_BYTE *)(v18 + 40) = 1;
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v10, &demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
}

uint64_t closure #1 in LACUIAuthCountdownView.barButtons(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  _QWORD v22[2];

  v6 = type metadata accessor for LACUIAuthCountdownView();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v22 - v14;
  v22[1] = a1;
  outlined init with copy of LACUIAuthCountdownConfiguration(a2, (uint64_t)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
  v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v17 = swift_allocObject();
  outlined init with take of LACUIAuthCountdownDelayConfiguration((uint64_t)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [LACUIAuthButtonConfiguration]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>);
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type [LACUIAuthButtonConfiguration] and conformance [A], &demangling cache variable for type metadata for [LACUIAuthButtonConfiguration], MEMORY[0x24BEE12D8]);
  lazy protocol witness table accessor for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>();
  lazy protocol witness table accessor for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration();
  ForEach<>.init(_:content:)();
  v18 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v18(v13, v15, v9);
  *(_QWORD *)a3 = 0;
  *(_BYTE *)(a3 + 8) = 1;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>));
  v18((char *)(a3 + *(int *)(v19 + 48)), v13, v9);
  v20 = *(void (**)(char *, uint64_t))(v10 + 8);
  v20(v15, v9);
  return ((uint64_t (*)(char *, uint64_t))v20)(v13, v9);
}

uint64_t LACUIAuthCountdownView.button(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int128 v3;
  _OWORD v5[2];
  char v6;

  v3 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v3;
  v6 = *(_BYTE *)(a1 + 32);
  return closure #1 in LACUIAuthCountdownView.button(with:)((uint64_t)v5, v2, a2);
}

uint64_t closure #1 in LACUIAuthCountdownView.informativeText.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;

  v36 = a1;
  v39 = a2;
  v2 = type metadata accessor for AccessibilityTraits();
  v37 = *(_QWORD *)(v2 - 8);
  v38 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v35 = (uint64_t)&v35 - v9;
  swift_bridgeObjectRetain();
  static Font.largeTitle.getter();
  v10 = Text.font(_:)();
  v12 = v11;
  v14 = v13;
  swift_bridgeObjectRelease();
  swift_release();
  static Font.Weight.bold.getter();
  v15 = Text.fontWeight(_:)();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  outlined consume of Text.Storage(v10, v12, v14 & 1);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  LOBYTE(v12) = static Edge.Set.vertical.getter();
  EdgeInsets.init(_all:)();
  v40 = v15;
  v41 = v17;
  v42 = v19 & 1;
  v43 = v21;
  v44 = KeyPath;
  v45 = 1;
  v46 = v12;
  v47 = v23;
  v48 = v24;
  v49 = v25;
  v50 = v26;
  v51 = 0;
  static AccessibilityTraits.isHeader.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>);
  lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, (uint64_t (*)(void))lazy protocol witness table accessor for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>, MEMORY[0x24BDECC60]);
  View.accessibilityAddTraits(_:)();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v38);
  outlined consume of Text.Storage(v40, v41, v42);
  swift_release();
  swift_bridgeObjectRelease();
  v27 = v35;
  outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v8, v35, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>);
  v28 = *(_QWORD *)(v36 + 8) + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthCountdownViewModel_configuration;
  v29 = *(_QWORD *)(v28 + 40);
  v30 = *(_QWORD *)(v28 + 48);
  v31 = swift_getKeyPath();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v27, (uint64_t)v8, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>);
  v32 = v39;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v8, v39, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>);
  v33 = v32
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>))
               + 48);
  *(_QWORD *)v33 = v29;
  *(_QWORD *)(v33 + 8) = v30;
  *(_BYTE *)(v33 + 16) = 0;
  *(_QWORD *)(v33 + 24) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v33 + 32) = v31;
  *(_BYTE *)(v33 + 40) = 1;
  outlined copy of Text.Storage(v29, v30, 0);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v27, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>);
  outlined consume of Text.Storage(v29, v30, 0);
  swift_release();
  swift_bridgeObjectRelease();
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v8, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>);
}

uint64_t closure #1 in closure #1 in LACUIAuthCountdownView.actionItems(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_BYTE *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_QWORD *)(a2 + 8) = v2;
  *(_QWORD *)(a2 + 16) = v3;
  *(_QWORD *)(a2 + 24) = v4;
  *(_BYTE *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 40) = v6;
  *(_QWORD *)(a2 + 48) = v7;
  swift_bridgeObjectRetain();
  outlined copy of LACUIAuthImageConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t closure #1 in LACUIAuthCountdownView.button(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  __int128 v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  _OWORD *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v68;
  uint64_t (*v69)(void);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  __int128 v76;
  char *v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  __int128 v111;
  _OWORD v112[2];

  v106 = a2;
  v110 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Button<Text>, _PaddingLayout>);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v96 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v97 = (uint64_t)&v85 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Text>);
  v100 = *(_QWORD *)(v8 - 8);
  v101 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v99 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.fontWeight(_:)>>.0);
  v94 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  v93 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>);
  v11 = MEMORY[0x24BDAC7A8](v105);
  v92 = (char *)&v85 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v98 = (uint64_t)&v85 - v13;
  v107 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>.Storage);
  MEMORY[0x24BDAC7A8](v107);
  v109 = (uint64_t)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>.Storage);
  MEMORY[0x24BDAC7A8](v102);
  v103 = (uint64_t)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>);
  MEMORY[0x24BDAC7A8](v108);
  v104 = (char *)&v85 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = type metadata accessor for RoundedRectangle();
  MEMORY[0x24BDAC7A8](v89);
  v91 = (char *)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = type metadata accessor for BorderedProminentButtonStyle();
  v86 = *(_QWORD *)(v87 - 8);
  MEMORY[0x24BDAC7A8](v87);
  v19 = (char *)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>>);
  v85 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  v88 = *(_QWORD *)(v90 - 8);
  MEMORY[0x24BDAC7A8](v90);
  v24 = (char *)&v85 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for LACUIAuthCountdownView();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(_QWORD *)(v26 + 64);
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v85 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v85 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BDAC7A8](v30);
  if (*(_BYTE *)(a1 + 32))
  {
    if (*(_BYTE *)(a1 + 32) != 1)
    {
      v112[0] = *(_OWORD *)(a1 + 16);
      outlined init with copy of LACUIAuthCountdownConfiguration(v106, (uint64_t)&v85 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
      v73 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
      v74 = swift_allocObject();
      outlined init with take of LACUIAuthCountdownDelayConfiguration((uint64_t)&v85 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), v74 + v73, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
      v75 = v74 + ((v27 + v73 + 7) & 0xFFFFFFFFFFFFFFF8);
      v76 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)v75 = *(_OWORD *)a1;
      *(_OWORD *)(v75 + 16) = v76;
      *(_BYTE *)(v75 + 32) = *(_BYTE *)(a1 + 32);
      v111 = v112[0];
      outlined retain of LACUIAuthButtonConfiguration(a1);
      outlined retain of String((uint64_t)v112);
      lazy protocol witness table accessor for type String and conformance String();
      swift_retain();
      v77 = v99;
      Button<>.init<A>(_:action:)();
      v78 = static Edge.Set.all.getter();
      v80 = v100;
      v79 = v101;
      v81 = (uint64_t)v96;
      (*(void (**)(char *, char *, uint64_t))(v100 + 16))(v96, v77, v101);
      v82 = v81 + *(int *)(v4 + 36);
      *(_BYTE *)v82 = v78;
      *(_OWORD *)(v82 + 8) = 0u;
      *(_OWORD *)(v82 + 24) = 0u;
      *(_BYTE *)(v82 + 40) = 1;
      (*(void (**)(char *, uint64_t))(v80 + 8))(v77, v79);
      swift_release();
      v47 = &demangling cache variable for type metadata for ModifiedContent<Button<Text>, _PaddingLayout>;
      v83 = v97;
      outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v81, v97, &demangling cache variable for type metadata for ModifiedContent<Button<Text>, _PaddingLayout>);
      outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v83, v109, &demangling cache variable for type metadata for ModifiedContent<Button<Text>, _PaddingLayout>);
      swift_storeEnumTagMultiPayload();
      lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>();
      lazy protocol witness table accessor for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
      _ConditionalContent<>.init(storage:)();
      v72 = v83;
      return outlined destroy of LACUIAuthCountdownDelayConfiguration?(v72, v47);
    }
    v112[0] = *(_OWORD *)(a1 + 16);
    outlined init with copy of LACUIAuthCountdownConfiguration(v106, (uint64_t)&v85 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
    v35 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    v36 = swift_allocObject();
    outlined init with take of LACUIAuthCountdownDelayConfiguration((uint64_t)&v85 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), v36 + v35, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
    v37 = v36 + ((v27 + v35 + 7) & 0xFFFFFFFFFFFFFFF8);
    v38 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)v37 = *(_OWORD *)a1;
    *(_OWORD *)(v37 + 16) = v38;
    *(_BYTE *)(v37 + 32) = *(_BYTE *)(a1 + 32);
    v111 = v112[0];
    outlined retain of LACUIAuthButtonConfiguration(a1);
    outlined retain of String((uint64_t)v112);
    lazy protocol witness table accessor for type String and conformance String();
    swift_retain();
    v39 = v99;
    Button<>.init<A>(_:action:)();
    static Font.Weight.bold.getter();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>, MEMORY[0x24BDF43B0]);
    v40 = v93;
    v41 = v101;
    View.fontWeight(_:)();
    (*(void (**)(char *, uint64_t))(v100 + 8))(v39, v41);
    v42 = static Edge.Set.all.getter();
    v43 = v94;
    v44 = (uint64_t)v92;
    v45 = v95;
    (*(void (**)(char *, char *, uint64_t))(v94 + 16))(v92, v40, v95);
    v46 = v44 + *(int *)(v105 + 36);
    *(_BYTE *)v46 = v42;
    *(_OWORD *)(v46 + 8) = 0u;
    *(_OWORD *)(v46 + 24) = 0u;
    *(_BYTE *)(v46 + 40) = 1;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v40, v45);
    swift_release();
    v47 = &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>;
    v48 = v98;
    outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?(v44, v98, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>);
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v48, v103, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
    v49 = (uint64_t)v104;
    _ConditionalContent<>.init(storage:)();
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v49, v109, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>();
    lazy protocol witness table accessor for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
  }
  else
  {
    v50 = *(char **)(a1 + 16);
    v98 = *(_QWORD *)(a1 + 24);
    v99 = v50;
    v100 = v33;
    v101 = (uint64_t)&v85 - v34;
    outlined init with copy of LACUIAuthCountdownConfiguration(v106, (uint64_t)&v85 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
    v51 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    v106 = v4;
    v52 = (v27 + v51 + 7) & 0xFFFFFFFFFFFFFFF8;
    v53 = swift_allocObject();
    v54 = outlined init with take of LACUIAuthCountdownDelayConfiguration((uint64_t)v28, v53 + v51, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
    v55 = v53 + v52;
    v56 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)v55 = *(_OWORD *)a1;
    *(_OWORD *)(v55 + 16) = v56;
    *(_BYTE *)(v55 + 32) = *(_BYTE *)(a1 + 32);
    MEMORY[0x24BDAC7A8](v54);
    v57 = v98;
    *(&v85 - 2) = (uint64_t)v99;
    *(&v85 - 1) = v57;
    outlined retain of LACUIAuthButtonConfiguration(a1);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>);
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>();
    Button.init(action:label:)();
    BorderedProminentButtonStyle.init()();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>> and conformance Button<A>, &demangling cache variable for type metadata for Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>>, MEMORY[0x24BDF43B0]);
    lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type BorderedProminentButtonStyle and conformance BorderedProminentButtonStyle, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8], MEMORY[0x24BDF0D88]);
    v58 = v87;
    View.buttonStyle<A>(_:)();
    (*(void (**)(char *, uint64_t))(v86 + 8))(v19, v58);
    (*(void (**)(char *, uint64_t))(v85 + 8))(v22, v20);
    v59 = v91;
    v60 = &v91[*(int *)(v89 + 20)];
    v61 = *MEMORY[0x24BDEEB68];
    v62 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 104))(v60, v61, v62);
    __asm { FMOV            V0.2D, #14.0 }
    *v59 = _Q0;
    v68 = (uint64_t)&v32[*(int *)(v100 + 36)];
    v69 = MEMORY[0x24BDED998];
    outlined init with copy of LACUIAuthCountdownConfiguration((uint64_t)v59, v68, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    *(_WORD *)(v68
             + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ClipEffect<RoundedRectangle>)
                      + 36)) = 256;
    v70 = v88;
    v71 = v90;
    (*(void (**)(char *, char *, uint64_t))(v88 + 16))(v32, v24, v90);
    outlined destroy of LACUIAuthCountdownView((uint64_t)v59, (uint64_t (*)(_QWORD))v69);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v24, v71);
    swift_release();
    v47 = &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>;
    v48 = v101;
    outlined init with take of ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?((uint64_t)v32, v101, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>);
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v48, v103, &demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
    v49 = (uint64_t)v104;
    _ConditionalContent<>.init(storage:)();
    outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v49, v109, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>();
    lazy protocol witness table accessor for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>();
  }
  _ConditionalContent<>.init(storage:)();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v49, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>);
  v72 = v48;
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?(v72, v47);
}

uint64_t LACUIAuthCountdownView.primaryButton(with:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(void);
  uint64_t v29;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v31[0] = a2;
  v31[1] = a3;
  v35 = a4;
  v34 = type metadata accessor for RoundedRectangle();
  MEMORY[0x24BDAC7A8](v34);
  v6 = (_OWORD *)((char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = type metadata accessor for BorderedProminentButtonStyle();
  v32 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>>);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.buttonStyle<A>(_:)>>.0);
  v14 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v16 = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = a1;
  v37 = v31[0];
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>);
  lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>();
  Button.init(action:label:)();
  BorderedProminentButtonStyle.init()();
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>> and conformance Button<A>, &demangling cache variable for type metadata for Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>>, MEMORY[0x24BDF43B0]);
  lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type BorderedProminentButtonStyle and conformance BorderedProminentButtonStyle, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8], MEMORY[0x24BDF0D88]);
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v17 = (char *)v6 + *(int *)(v34 + 20);
  v18 = *MEMORY[0x24BDEEB68];
  v19 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v17, v18, v19);
  __asm { FMOV            V0.2D, #14.0 }
  *v6 = _Q0;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>);
  v26 = v35;
  v27 = v35 + *(int *)(v25 + 36);
  v28 = MEMORY[0x24BDED998];
  outlined init with copy of LACUIAuthCountdownConfiguration((uint64_t)v6, v27, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v27
           + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ClipEffect<RoundedRectangle>)
                    + 36)) = 256;
  v29 = v33;
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v26, v16, v33);
  outlined destroy of LACUIAuthCountdownView((uint64_t)v6, (uint64_t (*)(_QWORD))v28);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v29);
}

uint64_t LACUIAuthCountdownView.secondaryButton(with:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Text>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.fontWeight(_:)>>.0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1;
  v19 = a2;
  lazy protocol witness table accessor for type String and conformance String();
  swift_bridgeObjectRetain();
  swift_retain();
  Button<>.init<A>(_:action:)();
  static Font.Weight.bold.getter();
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>, MEMORY[0x24BDF43B0]);
  View.fontWeight(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  LOBYTE(v8) = static Edge.Set.all.getter();
  v13 = v17;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v17, v12, v9);
  v14 = v13
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>)
               + 36);
  *(_BYTE *)v14 = (_BYTE)v8;
  *(_OWORD *)(v14 + 8) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *(_BYTE *)(v14 + 40) = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t LACUIAuthCountdownView.barButton(with:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  uint64_t v11;
  _QWORD v13[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<Text>);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = a1;
  v13[1] = a2;
  lazy protocol witness table accessor for type String and conformance String();
  swift_bridgeObjectRetain();
  swift_retain();
  Button<>.init<A>(_:action:)();
  v10 = static Edge.Set.all.getter();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(a3, v9, v6);
  v11 = a3
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Button<Text>, _PaddingLayout>)
               + 36);
  *(_BYTE *)v11 = v10;
  *(_OWORD *)(v11 + 8) = 0u;
  *(_OWORD *)(v11 + 24) = 0u;
  *(_BYTE *)(v11 + 40) = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

double closure #1 in LACUIAuthCountdownView.primaryButton(with:action:)@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double result;
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  swift_bridgeObjectRetain();
  static Font.headline.getter();
  v2 = Text.font(_:)();
  v4 = v3;
  v6 = v5;
  swift_bridgeObjectRelease();
  swift_release();
  static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  static Alignment.center.getter();
  specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v16, 0.0, 1, 0.0, 1);
  outlined consume of Text.Storage(v2, v4, v6 & 1);
  swift_bridgeObjectRelease();
  v7 = v24;
  v8 = v25;
  v9 = v22;
  a1[8] = v23;
  a1[9] = v7;
  v10 = v26;
  a1[10] = v8;
  a1[11] = v10;
  v11 = v20;
  v12 = v21;
  v13 = v18;
  a1[4] = v19;
  a1[5] = v11;
  a1[6] = v12;
  a1[7] = v9;
  v14 = v16[1];
  *a1 = v16[0];
  a1[1] = v14;
  result = *(double *)&v17;
  a1[2] = v17;
  a1[3] = v13;
  return result;
}

uint64_t type metadata accessor for LACUIAuthCountdownView()
{
  uint64_t result;

  result = type metadata singleton initialization cache for LACUIAuthCountdownView;
  if (!type metadata singleton initialization cache for LACUIAuthCountdownView)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = _StringObject.sharedUTF8.getter();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      result = _StringGuts.copyUTF8(into:)();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = String.UTF8View._foreignCount()();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t key path getter for EnvironmentValues.symbolRenderingMode : EnvironmentValues, serialized()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t sub_240AD0140()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t key path setter for EnvironmentValues.symbolRenderingMode : EnvironmentValues, serialized(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymbolRenderingMode?);
  MEMORY[0x24BDAC7A8](v2);
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &demangling cache variable for type metadata for SymbolRenderingMode?);
  return EnvironmentValues.symbolRenderingMode.setter();
}

uint64_t sub_240AD01E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_240AD020C()
{
  swift_retain();
  return EnvironmentValues.foregroundColor.setter();
}

unint64_t lazy protocol witness table accessor for type LACUIAuthCountdownItemView and conformance LACUIAuthCountdownItemView()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LACUIAuthCountdownItemView and conformance LACUIAuthCountdownItemView;
  if (!lazy protocol witness table cache variable for type LACUIAuthCountdownItemView and conformance LACUIAuthCountdownItemView)
  {
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUIAuthCountdownItemView, &type metadata for LACUIAuthCountdownItemView);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownItemView and conformance LACUIAuthCountdownItemView);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LACUIAuthCountdownItemConfiguration and conformance LACUIAuthCountdownItemConfiguration()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LACUIAuthCountdownItemConfiguration and conformance LACUIAuthCountdownItemConfiguration;
  if (!lazy protocol witness table cache variable for type LACUIAuthCountdownItemConfiguration and conformance LACUIAuthCountdownItemConfiguration)
  {
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUIAuthCountdownItemConfiguration, &type metadata for LACUIAuthCountdownItemConfiguration);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownItemConfiguration and conformance LACUIAuthCountdownItemConfiguration);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = lazy protocol witness table cache variable for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>;
  if (!lazy protocol witness table cache variable for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>);
    v2 = lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>(&lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>, &demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>, lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>, (uint64_t (*)(void))lazy protocol witness table accessor for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
    result = MEMORY[0x242688798](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>> and conformance <A> Group<A>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>()
{
  return lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>(&lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>, &demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, (uint64_t (*)(void))lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>, (uint64_t (*)(void))lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
}

uint64_t lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>> and conformance <> _ConditionalContent<A, B>(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x242688798](MEMORY[0x24BDEF3E0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>>);
    v3 = type metadata accessor for BorderedProminentButtonStyle();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>> and conformance Button<A>, &demangling cache variable for type metadata for Button<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>>, MEMORY[0x24BDF43B0]);
    v5[5] = lazy protocol witness table accessor for type LACUIAuthContainerViewModel and conformance LACUIAuthContainerViewModel(&lazy protocol witness table cache variable for type BorderedProminentButtonStyle and conformance BorderedProminentButtonStyle, v4, MEMORY[0x24BDF0D88]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _ClipEffect<RoundedRectangle> and conformance _ClipEffect<A>, &demangling cache variable for type metadata for _ClipEffect<RoundedRectangle>, MEMORY[0x24BDEB950]);
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Button<Text>);
    v2[3] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>, MEMORY[0x24BDF43B0]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<Button<Text>, _PaddingLayout>);
    v2[0] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type Button<Text> and conformance Button<A>, &demangling cache variable for type metadata for Button<Text>, MEMORY[0x24BDF43B0]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Button<Text>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration;
  if (!lazy protocol witness table cache variable for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration)
  {
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUIAuthButtonConfiguration, &type metadata for LACUIAuthButtonConfiguration);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthButtonConfiguration and conformance LACUIAuthButtonConfiguration);
  }
  return result;
}

double partial apply for closure #1 in LACUIAuthCountdownView.primaryButton(with:action:)@<D0>(_OWORD *a1@<X8>)
{
  return closure #1 in LACUIAuthCountdownView.primaryButton(with:action:)(a1);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<Text, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<Text, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<Text, _PaddingLayout>, MEMORY[0x24BDF1F80], MEMORY[0x24BDECC60]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in LACUIAuthCountdownView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_240AD0704@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_240AD0710(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_retain();
  result = swift_release();
  *(_QWORD *)(a2 + 8) = v3;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LACUIAuthCountdownView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (uint64_t *)((char *)a1 + v6);
    v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = type metadata accessor for ColorScheme();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for LACUIAuthCountdownView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = type metadata accessor for ColorScheme();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for LACUIAuthCountdownView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (_QWORD *)((char *)a1 + v5);
  v7 = (_QWORD *)((char *)a2 + v5);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = type metadata accessor for ColorScheme();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    *v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for LACUIAuthCountdownView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 20);
    v7 = (_QWORD *)((char *)a1 + v6);
    v8 = (_QWORD *)((char *)a2 + v6);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)a1 + v6, &demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = type metadata accessor for ColorScheme();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for LACUIAuthCountdownView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

_QWORD *assignWithTake for LACUIAuthCountdownView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_release();
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)a1 + v7, &demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthCountdownView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240AD0BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for LACUIAuthCountdownView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240AD0C38(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

void type metadata completion function for LACUIAuthCountdownView()
{
  unint64_t v0;

  type metadata accessor for Environment<ColorScheme>.Content();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for Environment<ColorScheme>.Content()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Environment<ColorScheme>.Content)
  {
    type metadata accessor for ColorScheme();
    v0 = type metadata accessor for Environment.Content();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Environment<ColorScheme>.Content);
  }
}

unint64_t lazy protocol witness table accessor for type EmbedInScrollViewIfNeededModifier and conformance EmbedInScrollViewIfNeededModifier()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EmbedInScrollViewIfNeededModifier and conformance EmbedInScrollViewIfNeededModifier;
  if (!lazy protocol witness table cache variable for type EmbedInScrollViewIfNeededModifier and conformance EmbedInScrollViewIfNeededModifier)
  {
    result = MEMORY[0x242688798](&protocol conformance descriptor for EmbedInScrollViewIfNeededModifier, &type metadata for EmbedInScrollViewIfNeededModifier);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EmbedInScrollViewIfNeededModifier and conformance EmbedInScrollViewIfNeededModifier);
  }
  return result;
}

uint64_t sub_240AD0EC8()
{
  return lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>> and conformance HStack<A>, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, MEMORY[0x24BDF4498]);
}

uint64_t sub_240AD0EF4()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>, _FrameLayout>, (uint64_t (*)(void))lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>, MEMORY[0x24BDEBEE0]);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<Color?> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Color?>, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _EnvironmentKeyWritingModifier<Color?>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<Text, _PaddingLayout> and conformance <> ModifiedContent<A, B>((unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Image, _AspectRatioLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<Image, _AspectRatioLayout>, MEMORY[0x24BDF40E8], MEMORY[0x24BDEEC40]);
    v2[1] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<SymbolRenderingMode?> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t sub_240AD1050()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>> and conformance <> ModifiedContent<A, B>(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _TraitWritingModifier<LayoutPriorityTraitKey> and conformance _TraitWritingModifier<A>, &demangling cache variable for type metadata for _TraitWritingModifier<LayoutPriorityTraitKey>, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>, _PaddingLayout>, (uint64_t (*)(void))lazy protocol witness table accessor for type ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, MEMORY[0x24BDECC60]);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout>);
    v2[0] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>> and conformance VStack<A>, &demangling cache variable for type metadata for VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<VStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>, AccessibilityAttachmentModifier>, ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>)>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t sub_240AD11A8()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>, lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>, _PaddingLayout>, (uint64_t (*)(void))lazy protocol witness table accessor for type ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, MEMORY[0x24BDECC60]);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout>);
    v2[0] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>> and conformance VStack<A>, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<VStack<ForEach<[LACUIAuthCountdownItemConfiguration], String, LACUIAuthCountdownItemView>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t sub_240AD127C()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>, _PaddingLayout>, (uint64_t (*)(void))lazy protocol witness table accessor for type ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>, MEMORY[0x24BDECC60]);
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout>);
    v2[0] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>> and conformance VStack<A>, &demangling cache variable for type metadata for VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<VStack<ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>>, _PaddingLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t outlined retain of ModifiedContent<Text, _PaddingLayout>(uint64_t a1)
{
  outlined copy of Text.Storage(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t outlined retain of LACUIAuthButtonConfiguration(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t outlined retain of String(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t objectdestroy_22Tm()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for LACUIAuthCountdownView();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  v3 = v0 + v2 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = type metadata accessor for ColorScheme();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #3 in closure #1 in LACUIAuthCountdownView.button(with:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  void (*v6)(_OWORD *);
  _OWORD v8[2];
  char v9;

  v1 = *(_QWORD *)(type metadata accessor for LACUIAuthCountdownView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(_QWORD *)(v0 + v2 + 8);
  v5 = *(_OWORD *)(v3 + 16);
  v8[0] = *(_OWORD *)v3;
  v8[1] = v5;
  v9 = *(_BYTE *)(v3 + 32);
  v6 = *(void (**)(_OWORD *))(*(_QWORD *)v4 + 168);
  swift_retain();
  v6(v8);
  return swift_release();
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>);
    v2 = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<TextAlignment> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<TextAlignment>, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout>);
    v2[0] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>> and conformance HStack<A>, &demangling cache variable for type metadata for HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDEDB80];
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(Spacer, ForEach<[LACUIAuthButtonConfiguration], String, Group<_ConditionalContent<_ConditionalContent<ModifiedContent<<<opaque return type of View.buttonStyle<A>(_:)>>.0, _ClipEffect<RoundedRectangle>>, ModifiedContent<<<opaque return type of View.fontWeight(_:)>>.0, _PaddingLayout>>, ModifiedContent<Button<Text>, _PaddingLayout>>>>)>>, _FixedSizeLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<Text, _PaddingLayout> and conformance <> ModifiedContent<A, B>(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3;
    v9[1] = a4;
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for LACUIAuthCountdownView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  v3 = v0 + ((v2 + 16) & ~v2) + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in LACUIAuthCountdownView.buttons.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  __int128 v6;
  _OWORD v8[2];
  char v9;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LACUIAuthCountdownView() - 8) + 80);
  v6 = *(_OWORD *)(a1 + 16);
  v8[0] = *(_OWORD *)a1;
  v8[1] = v6;
  v9 = *(_BYTE *)(a1 + 32);
  return closure #1 in LACUIAuthCountdownView.button(with:)((uint64_t)v8, v2 + ((v5 + 16) & ~v5), a2);
}

id static LACUIIcon.genericIcon.getter()
{
  id v0;
  id result;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_genericApplicationIcon);
  result = LACUIImageWithIcon(v0);
  if (result)
  {
    v2 = result;

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id static LACUIIcon.image(forBundleIdentifier:)(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  id result;
  id v8;

  if (!a2)
    return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_genericIcon);
  v4 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  swift_bridgeObjectRetain();
  v5 = (void *)MEMORY[0x242687FC4](a1, a2);
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithBundleIdentifier_, v5);

  result = LACUIImageWithIcon(v6);
  if (result)
  {
    v8 = result;

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id static LACUIIcon.image(forPath:)(uint64_t a1, unint64_t a2)
{
  id v2;
  void *v3;
  id result;
  id v5;

  v2 = specialized static LACUIIcon.icon(forPath:)(a1, a2);
  if (!v2)
    return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_genericIcon);
  v3 = v2;
  result = LACUIImageWithIcon(v2);
  if (result)
  {
    v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

LACUIIcon __swiftcall LACUIIcon.init()()
{
  return (LACUIIcon)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id LACUIIcon.init()()
{
  objc_super v1;

  v1.super_class = (Class)LACUIIcon;
  return objc_msgSendSuper2(&v1, sel_init);
}

id specialized static LACUIIcon.icon(forPath:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  unsigned __int8 v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  NSURL *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v4 = type metadata accessor for URL.DirectoryHint();
  v43 = *(_QWORD *)(v4 - 8);
  v44 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for URL();
  v45 = *(_QWORD *)(v10 - 8);
  v46 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for UTType();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v43 - v21;
  if (!a2)
    return 0;
  v23 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v23 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v23)
    return 0;
  swift_bridgeObjectRetain();
  UTType.init(_:)();
  outlined init with copy of UTType?((uint64_t)v22, (uint64_t)v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v20, 1, v13) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v20, v13);
    v37 = UTType.identifier.getter();
    v39 = v38;
    v40 = objc_allocWithZone(MEMORY[0x24BE51A90]);
    v41 = (void *)MEMORY[0x242687FC4](v37, v39);
    swift_bridgeObjectRelease();
    v36 = objc_msgSend(v40, sel_initWithType_, v41);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    goto LABEL_11;
  }
  outlined destroy of UTType?((uint64_t)v20);
  v24 = (void *)MEMORY[0x242687FC4](a1, a2);
  v25 = objc_msgSend(v24, sel_stringByExpandingTildeInPath);

  v26 = v25;
  if (!v25)
  {
    v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v26 = (void *)MEMORY[0x242687FC4](v27);
    swift_bridgeObjectRelease();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v28 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v29 = objc_msgSend(v28, sel_fileExistsAtPath_, v26);

  if ((v29 & 1) == 0)
  {
    outlined destroy of UTType?((uint64_t)v22);
    swift_bridgeObjectRelease();
    return 0;
  }
  v31 = v45;
  v30 = v46;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56))(v9, 1, 1, v46);
  (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v6, *MEMORY[0x24BDCD7A0], v44);
  URL.init(filePath:directoryHint:relativeTo:)();
  v32 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  URL._bridgeToObjectiveC()(v33);
  v35 = v34;
  v36 = objc_msgSend(v32, sel_initWithURL_, v34);

  (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v30);
LABEL_11:
  outlined destroy of UTType?((uint64_t)v22);
  return v36;
}

unint64_t type metadata accessor for LACUIIcon()
{
  unint64_t result;

  result = lazy cache variable for type metadata for LACUIIcon;
  if (!lazy cache variable for type metadata for LACUIIcon)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for LACUIIcon);
  }
  return result;
}

uint64_t outlined init with copy of UTType?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of UTType?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UTType?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id LACUIDTOSensorNotTrustedScenePresentationHandler.__allocating_init()()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return LACUIDTOSensorNotTrustedScenePresentationHandler.init()();
}

id LACUIDTOSensorNotTrustedScenePresentationHandler.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  objc_super v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;

  v14._countAndFlagsBits = 0x74656863746152;
  v14._object = (void *)0xE700000000000000;
  v1 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000240AE42C0, v14);
  v3 = v2;
  if (objc_msgSend((id)objc_opt_self(), sel_deviceHasFaceID))
  {
    v4 = 0xD000000000000022;
    v5 = "DTO_UNAPPROVED_SENSOR_TEXT_FACE_ID";
  }
  else
  {
    v4 = 0xD000000000000023;
    v5 = "DTO_UNAPPROVED_SENSOR_TEXT_TOUCH_ID";
  }
  v15._countAndFlagsBits = 0x74656863746152;
  v15._object = (void *)0xE700000000000000;
  v6 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(v4, (void *)((unint64_t)(v5 - 32) | 0x8000000000000000), v15);
  v8 = v7;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v9 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x4F5F4E4F54545542, (void *)0xE90000000000004BLL, v16);
  v10 = &v0[OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration];
  *(_QWORD *)v10 = 1;
  *((_QWORD *)v10 + 1) = v1;
  *((_QWORD *)v10 + 2) = v3;
  *((_QWORD *)v10 + 3) = v6;
  *((_QWORD *)v10 + 4) = v8;
  *((_QWORD *)v10 + 5) = v9;
  *((_QWORD *)v10 + 6) = v11;
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for LACUIAlertScenePresentationHandler();
  return objc_msgSendSuper2(&v13, sel_init);
}

void LACUIDTOSensorNotTrustedScenePresentationHandler.__allocating_init(configuration:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void LACUIDTOSensorNotTrustedScenePresentationHandler.init(configuration:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LACUIDTOSensorNotTrustedScenePresentationHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LACUIDTOSensorNotTrustedScenePresentationHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LACUIDTOSensorNotTrustedScenePresentationHandler()
{
  return objc_opt_self();
}

uint64_t method lookup function for LACUIDTOSensorNotTrustedScenePresentationHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LACUIDTOSensorNotTrustedScenePresentationHandler.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t LACUIAuthContainerViewModel.__allocating_init(dataSource:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v22 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LACUIAuthState();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v22 - v13;
  v15 = swift_allocObject();
  v16 = v15 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel__state;
  v17 = type metadata accessor for LACUIAuthCountdownConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  outlined init with copy of LACUIAuthState((uint64_t)v14, (uint64_t)v12);
  Published.init(initialValue:)();
  outlined destroy of LACUIAuthState((uint64_t)v14);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v16, v8, v5);
  v18 = v15 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource;
  *(_QWORD *)(v15 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource + 8) = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  *(_QWORD *)(v18 + 8) = v22;
  swift_unknownObjectWeakAssign();
  v23 = xmmword_240AE13E0;
  v19 = type metadata accessor for TaskPriority();
  v24 = 0;
  v25 = 0;
  v26 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v4, 1, 1, v19);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = v15;
  outlined init with take of LACUIAuthAction((uint64_t)&v23, (uint64_t)(v20 + 5));
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v4, (uint64_t)&async function pointer to partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:), (uint64_t)v20);
  swift_unknownObjectRelease();
  swift_release();
  return v15;
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for TaskPriority();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  outlined destroy of TaskPriority?(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t key path getter for LACUIAuthContainerViewModel.state : LACUIAuthContainerViewModel(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 96))();
}

uint64_t key path setter for LACUIAuthContainerViewModel.state : LACUIAuthContainerViewModel(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = type metadata accessor for LACUIAuthState();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  outlined init with copy of LACUIAuthState(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  outlined init with copy of LACUIAuthState((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  static Published.subscript.setter();
  return outlined destroy of LACUIAuthState((uint64_t)v7);
}

uint64_t LACUIAuthContainerViewModel.state.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  return swift_release();
}

uint64_t key path setter for LACUIAuthContainerViewModel.$state : LACUIAuthContainerViewModel(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>.Publisher);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t LACUIAuthContainerViewModel.$state.getter()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  Published.projectedValue.getter();
  return swift_endAccess();
}

uint64_t LACUIAuthContainerViewModel.dataSource.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource;
  swift_beginAccess();
  return MEMORY[0x2426888D0](v1);
}

uint64_t LACUIAuthContainerViewModel.dataSource.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*LACUIAuthContainerViewModel.dataSource.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x2426888D0](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return LACUIAuthContainerViewModel.dataSource.modify;
}

void LACUIAuthContainerViewModel.dataSource.modify(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t LACUIAuthContainerViewModel.init(dataSource:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v22 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for LACUIAuthState();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v22 - v14;
  v16 = v2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel__state;
  v17 = type metadata accessor for LACUIAuthCountdownConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v15, 1, 1, v17);
  outlined init with copy of LACUIAuthState((uint64_t)v15, (uint64_t)v13);
  Published.init(initialValue:)();
  outlined destroy of LACUIAuthState((uint64_t)v15);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v16, v9, v6);
  v18 = v2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource + 8) = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  *(_QWORD *)(v18 + 8) = v22;
  swift_unknownObjectWeakAssign();
  v23 = xmmword_240AE13E0;
  v19 = type metadata accessor for TaskPriority();
  v24 = 0;
  v25 = 0;
  v26 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v5, 1, 1, v19);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = v2;
  outlined init with take of LACUIAuthAction((uint64_t)&v23, (uint64_t)(v20 + 5));
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v5, (uint64_t)&closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)partial apply, (uint64_t)v20);
  swift_unknownObjectRelease();
  swift_release();
  return v2;
}

uint64_t outlined init with copy of LACUIAuthState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LACUIAuthState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of LACUIAuthState(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LACUIAuthState();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Void __swiftcall LACUIAuthContainerViewModel.refresh()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = xmmword_240AE13E0;
  v4 = type metadata accessor for TaskPriority();
  v7 = 0;
  v8 = 0;
  v9 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  outlined init with take of LACUIAuthAction((uint64_t)&v6, (uint64_t)(v5 + 5));
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v3, (uint64_t)&closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)partial apply, (uint64_t)v5);
  swift_release();
}

uint64_t LACUIAuthContainerViewModel.send(action:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v4;
  uint64_t v5;

  *(_QWORD *)(v2 + 56) = v1;
  type metadata accessor for LACUIAuthState();
  *(_QWORD *)(v2 + 64) = swift_task_alloc();
  *(_QWORD *)(v2 + 72) = swift_task_alloc();
  *(_QWORD *)(v2 + 80) = swift_task_alloc();
  *(_QWORD *)(v2 + 88) = swift_task_alloc();
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 96) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 112) = v4;
  *(_BYTE *)(v2 + 49) = *(_BYTE *)(a1 + 32);
  type metadata accessor for MainActor();
  *(_QWORD *)(v2 + 128) = static MainActor.shared.getter();
  *(_QWORD *)(v2 + 136) = dispatch thunk of Actor.unownedExecutor.getter();
  *(_QWORD *)(v2 + 144) = v5;
  return swift_task_switch();
}

uint64_t LACUIAuthContainerViewModel.send(action:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v1 = (*(uint64_t (**)(void))(**(_QWORD **)(v0 + 56) + 144))();
  *(_QWORD *)(v0 + 152) = v1;
  if (v1)
  {
    v3 = v2;
    v4 = *(_BYTE *)(v0 + 49);
    v6 = *(_QWORD *)(v0 + 112);
    v5 = *(_QWORD *)(v0 + 120);
    v18 = *(_OWORD *)(v0 + 96);
    v7 = *(_QWORD *)(v0 + 56);
    ObjectType = swift_getObjectType();
    (*(void (**)(void))(*(_QWORD *)v7 + 96))();
    *(_OWORD *)(v0 + 16) = v18;
    *(_QWORD *)(v0 + 32) = v6;
    *(_QWORD *)(v0 + 40) = v5;
    *(_BYTE *)(v0 + 48) = v4;
    *(_QWORD *)&v18 = **(int **)(v3 + 8) + *(_QWORD *)(v3 + 8);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v9;
    *v9 = v0;
    v9[1] = LACUIAuthContainerViewModel.send(action:);
    return ((uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))v18)(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 72), v0 + 16, ObjectType, v3);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 88);
    swift_release();
    v12 = type metadata accessor for LACUIAuthCountdownConfiguration();
    v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
    v14 = *(_QWORD *)(v0 + 88);
    v15 = *(_QWORD *)(v0 + 72);
    (*(void (**)(uint64_t))(**(_QWORD **)(v0 + 56) + 96))(v13);
    LOBYTE(v11) = specialized static LACUIAuthState.== infix(_:_:)(v14, v15);
    outlined destroy of LACUIAuthState(v15);
    if ((v11 & 1) == 0)
    {
      v16 = *(_QWORD *)(v0 + 64);
      v17 = *(_QWORD *)(v0 + 72);
      outlined init with copy of LACUIAuthState(*(_QWORD *)(v0 + 88), v17);
      swift_getKeyPath();
      swift_getKeyPath();
      outlined init with copy of LACUIAuthState(v17, v16);
      swift_retain();
      static Published.subscript.setter();
      outlined destroy of LACUIAuthState(v17);
    }
    outlined destroy of LACUIAuthState(*(_QWORD *)(v0 + 88));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 72);
  swift_task_dealloc();
  swift_unknownObjectRelease();
  outlined destroy of LACUIAuthState(v1);
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  swift_release();
  v3 = outlined init with take of LACUIAuthState(v1, v2);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 72);
  (*(void (**)(uint64_t))(**(_QWORD **)(v0 + 56) + 96))(v3);
  LOBYTE(v2) = specialized static LACUIAuthState.== infix(_:_:)(v4, v5);
  outlined destroy of LACUIAuthState(v5);
  if ((v2 & 1) == 0)
  {
    v6 = *(_QWORD *)(v0 + 64);
    v7 = *(_QWORD *)(v0 + 72);
    outlined init with copy of LACUIAuthState(*(_QWORD *)(v0 + 88), v7);
    swift_getKeyPath();
    swift_getKeyPath();
    outlined init with copy of LACUIAuthState(v7, v6);
    swift_retain();
    static Published.subscript.setter();
    outlined destroy of LACUIAuthState(v7);
  }
  outlined destroy of LACUIAuthState(*(_QWORD *)(v0 + 88));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LACUIAuthContainerViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  outlined destroy of weak LACUIAuthCountdownViewModelHandler?(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource);
  return v0;
}

uint64_t LACUIAuthContainerViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<LACUIAuthState>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  outlined destroy of weak LACUIAuthCountdownViewModelHandler?(v0 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI27LACUIAuthContainerViewModel_dataSource);
  return swift_deallocClassInstance();
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance LACUIAuthContainerViewModel@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for LACUIAuthContainerViewModel();
  result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t LACUIAuthContainerViewModel.handle(action:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v14[4];
  char v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v14[0] = *(_QWORD *)a1;
  v6 = v14[0];
  v14[1] = v7;
  v14[2] = v8;
  v14[3] = v9;
  v15 = *(_BYTE *)(a1 + 32);
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v1;
  outlined init with take of LACUIAuthAction((uint64_t)v14, (uint64_t)(v11 + 5));
  outlined copy of LACUIAuthActionCountdown(v6, v7);
  outlined copy of LACUIAuthActionCountdown(v6, v7);
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v5, (uint64_t)&closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)partial apply, (uint64_t)v11);
  swift_release();
  return outlined consume of LACUIAuthActionCountdown(v6, v7);
}

uint64_t protocol witness for LACUIAuthCountdownViewModelHandler.handle(action:) in conformance LACUIAuthContainerViewModel(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v14[4];
  char v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v14[0] = *(_QWORD *)a1;
  v6 = v14[0];
  v14[1] = v7;
  v14[2] = v8;
  v14[3] = v9;
  v15 = *(_BYTE *)(a1 + 32);
  v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v1;
  outlined init with take of LACUIAuthAction((uint64_t)v14, (uint64_t)(v11 + 5));
  outlined copy of LACUIAuthActionCountdown(v6, v7);
  outlined copy of LACUIAuthActionCountdown(v6, v7);
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v5, (uint64_t)&closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)partial apply, (uint64_t)v11);
  swift_release();
  return outlined consume of LACUIAuthActionCountdown(v6, v7);
}

uint64_t closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t);

  outlined init with take of LACUIAuthAction(a5, v5 + 16);
  v9 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)a4 + 184) + *(_QWORD *)(*(_QWORD *)a4 + 184));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 56) = v7;
  *v7 = v5;
  v7[1] = closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:);
  return v9(v5 + 16);
}

uint64_t closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t _s25LocalAuthenticationCoreUI27LACUIAuthContainerViewModelC15sendToMainActor33_B25DC98AA5C9D048A72856B75FF5B62ELL6actionyAA0E6ActionO_tFyyYacfU_TA_0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:)(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

uint64_t sub_240AD373C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 96))();
}

uint64_t outlined init with take of LACUIAuthState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LACUIAuthState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t outlined consume of LACUIAuthActionCountdown(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_240AD3898(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 120))();
}

uint64_t sub_240AD38C4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 144))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_240AD38F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 152);
  v4 = swift_unknownObjectRetain();
  return v3(v4, v2);
}

uint64_t ObjC metadata update function for LACUIAuthContainerViewModel()
{
  return type metadata accessor for LACUIAuthContainerViewModel();
}

uint64_t type metadata accessor for LACUIAuthContainerViewModel()
{
  uint64_t result;

  result = type metadata singleton initialization cache for LACUIAuthContainerViewModel;
  if (!type metadata singleton initialization cache for LACUIAuthContainerViewModel)
    return swift_getSingletonMetadata();
  return result;
}

void type metadata completion function for LACUIAuthContainerViewModel()
{
  unint64_t v0;

  type metadata accessor for Published<LACUIAuthState>();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for LACUIAuthContainerViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.$state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.dataSource.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.dataSource.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.dataSource.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.__allocating_init(dataSource:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.refresh()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of LACUIAuthContainerViewModel.send(action:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 184) + *(_QWORD *)(*(_QWORD *)v1 + 184));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = partial apply for closure #1 in LACUIRatchetViewModel.start();
  return v6(a1);
}

void type metadata accessor for Published<LACUIAuthState>()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Published<LACUIAuthState>)
  {
    type metadata accessor for LACUIAuthState();
    v0 = type metadata accessor for Published();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Published<LACUIAuthState>);
  }
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  if (*(_QWORD *)(v0 + 48) >= 2uLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_deallocObject();
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_240AD3B88()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #1 in LACUIAuthContainerViewModel.sendToMainActor(action:);
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu))(a1, v4);
}

void specialized == infix<A>(_:_:)(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_240AD3C68(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_240AD3D14 + 4 * byte_240AE24C7[a2]))(0x726F4D6E7261656CLL);
}

uint64_t sub_240AD3D14(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x726F4D6E7261656CLL && v1 == 0xE900000000000065)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void specialized RawRepresentable<>.hash(into:)(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_240AD3E5C()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

void specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, char a2)
{
  Hasher.init(_seed:)();
  __asm { BR              X10 }
}

Swift::Int sub_240AD3F54()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

LocalAuthenticationCoreUI::LACUIAuthCountdownConfiguration::ActionButtonIdentifier_optional __swiftcall LACUIAuthCountdownConfiguration.ActionButtonIdentifier.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  Swift::String v3;
  char *v4;
  unint64_t v5;
  LocalAuthenticationCoreUI::LACUIAuthCountdownConfiguration::ActionButtonIdentifier_optional result;
  char v7;

  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of LACUIAuthCountdownConfiguration.ActionButtonIdentifier.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  v7 = 7;
  if (v5 < 7)
    v7 = v5;
  *v4 = v7;
  return result;
}

uint64_t static LACUIAuthCountdownConfiguration.begin(title:message:strictModeEnabled:showsLocationWarning:customCancelTitle:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::String v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  Swift::String v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  Swift::String v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  const char *v35;
  unint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t result;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  unint64_t v59;
  unint64_t v60;
  __int128 v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  char v68;
  uint64_t v69;
  unint64_t v70;
  Swift::String v71;
  Swift::String v72;
  Swift::String v73;
  Swift::String v74;
  Swift::String v75;
  Swift::String v76;
  Swift::String v77;

  v62 = a4;
  v63 = a8;
  v57 = a7;
  LODWORD(v59) = a6;
  HIDWORD(v56) = a5;
  v64 = a3;
  v65 = a1;
  v60 = a2;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  MEMORY[0x24BDAC7A8](v10);
  v66 = (uint64_t)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthCountdownItemConfiguration>);
  v12 = swift_allocObject();
  v61 = xmmword_240AE26F0;
  *(_OWORD *)(v12 + 16) = xmmword_240AE26F0;
  v13 = specialized static LocalizedStrings.ratchetCoolOffSecurityDelayDuration.getter();
  v15 = v14;
  v69 = 0;
  v70 = 0xE000000000000000;
  *(_QWORD *)&v67 = 0xD000000000000015;
  *((_QWORD *)&v67 + 1) = 0x8000000240AE4440;
  v68 = 0;
  _print_unlocked<A, B>(_:_:)();
  v16._countAndFlagsBits = 0x656C74697425;
  v16._object = (void *)0xE600000000000000;
  String.append(_:)(v16);
  v17 = v70;
  *(_QWORD *)(v12 + 32) = v69;
  *(_QWORD *)(v12 + 40) = v17;
  *(_QWORD *)(v12 + 48) = 0xD000000000000015;
  *(_QWORD *)(v12 + 56) = 0x8000000240AE4440;
  *(_BYTE *)(v12 + 64) = 0;
  *(_QWORD *)(v12 + 72) = v13;
  *(_QWORD *)(v12 + 80) = v15;
  v71._countAndFlagsBits = 0x74656863746152;
  v71._object = (void *)0xE700000000000000;
  v18 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002ALL, (void *)0x8000000240AE4460, v71);
  v20 = v19;
  v69 = 0;
  v70 = 0xE000000000000000;
  v58 = xmmword_240AE2700;
  v67 = xmmword_240AE2700;
  v68 = 1;
  _print_unlocked<A, B>(_:_:)();
  v21._countAndFlagsBits = 0x656C74697425;
  v21._object = (void *)0xE600000000000000;
  String.append(_:)(v21);
  v22 = v70;
  *(_QWORD *)(v12 + 88) = v69;
  *(_QWORD *)(v12 + 96) = v22;
  *(_OWORD *)(v12 + 104) = v58;
  *(_BYTE *)(v12 + 120) = 1;
  *(_QWORD *)(v12 + 128) = v18;
  *(_QWORD *)(v12 + 136) = v20;
  if ((v59 & 1) != 0)
  {
    v72._countAndFlagsBits = 0x74656863746152;
    v72._object = (void *)0xE700000000000000;
    v23 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002CLL, (void *)0x8000000240AE4560, v72);
    v25 = v24;
    v69 = 0;
    v70 = 0xE000000000000000;
    *(_QWORD *)&v67 = 0xD000000000000013;
    *((_QWORD *)&v67 + 1) = 0x8000000240AE4540;
    v68 = 1;
    _print_unlocked<A, B>(_:_:)();
    v26._countAndFlagsBits = 0x656C74697425;
    v26._object = (void *)0xE600000000000000;
    String.append(_:)(v26);
    v27 = v69;
    v28 = v70;
    v30 = *(_QWORD *)(v12 + 16);
    v29 = *(_QWORD *)(v12 + 24);
    if (v30 >= v29 >> 1)
      v12 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v29 > 1), v30 + 1, 1, (char *)v12);
    *(_QWORD *)(v12 + 16) = v30 + 1;
    v31 = v12 + 56 * v30;
    *(_QWORD *)(v31 + 32) = v27;
    *(_QWORD *)(v31 + 40) = v28;
    *(_QWORD *)(v31 + 48) = 0xD000000000000013;
    *(_QWORD *)(v31 + 56) = 0x8000000240AE4540;
    *(_BYTE *)(v31 + 64) = 1;
    *(_QWORD *)(v31 + 72) = v23;
    *(_QWORD *)(v31 + 80) = v25;
  }
  v32 = v62;
  if (v60)
  {
    v59 = v60;
    if (v62)
    {
LABEL_7:
      swift_bridgeObjectRetain();
      v60 = v32;
      goto LABEL_13;
    }
  }
  else
  {
    v73._countAndFlagsBits = 0x74656863746152;
    v73._object = (void *)0xE700000000000000;
    v65 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000240AE4490, v73);
    v59 = v33;
    if (v32)
      goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  if ((v56 & 0x100000000) != 0)
  {
    v34 = 0xD00000000000002ALL;
    v35 = "RATCHET_COOL_OFF_MESSAGE_BEGIN_STRICT_MODE";
  }
  else
  {
    v34 = 0xD00000000000001ELL;
    v35 = "RATCHET_COOL_OFF_MESSAGE_BEGIN";
  }
  v74._countAndFlagsBits = 0x74656863746152;
  v74._object = (void *)0xE700000000000000;
  v64 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(v34, (void *)((unint64_t)(v35 - 32) | 0x8000000000000000), v74);
  v60 = v36;
LABEL_13:
  v37 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v38 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56);
  v38(v66, 1, 1, v37);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthButtonConfiguration>);
  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = v61;
  swift_bridgeObjectRetain();
  v75._countAndFlagsBits = 0x74656863746152;
  v75._object = (void *)0xE700000000000000;
  v40 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001DLL, (void *)0x8000000240AE44D0, v75);
  *(_QWORD *)(v39 + 32) = 0xD000000000000012;
  *(_QWORD *)(v39 + 40) = 0x8000000240AE3880;
  *(_QWORD *)(v39 + 48) = v40;
  *(_QWORD *)(v39 + 56) = v41;
  *(_BYTE *)(v39 + 64) = 0;
  v76._countAndFlagsBits = 0x74656863746152;
  v76._object = (void *)0xE700000000000000;
  v42 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000240AE44F0, v76);
  *(_QWORD *)(v39 + 72) = 0x726F4D6E7261656CLL;
  *(_QWORD *)(v39 + 80) = 0xE900000000000065;
  *(_QWORD *)(v39 + 88) = v42;
  *(_QWORD *)(v39 + 96) = v43;
  *(_BYTE *)(v39 + 104) = 1;
  if (v63)
  {
    v62 = 0xEC0000006C65636ELL;
    v44 = 0x61436D6F74737563;
    *(_QWORD *)&v61 = v63;
    v45 = v57;
  }
  else
  {
    v77._countAndFlagsBits = 0;
    v77._object = (void *)0xE000000000000000;
    v45 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xED00004C45434E41, v77);
    *(_QWORD *)&v61 = v46;
    v62 = 0xE600000000000000;
    v44 = 0x6C65636E6163;
  }
  v47 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  v48 = a9 + v47[7];
  v38(v48, 1, 1, v37);
  v49 = v47[8];
  *(_QWORD *)(a9 + v49) = 0;
  v50 = a9 + v47[10];
  *(_BYTE *)(v50 + 32) = 0;
  *(_OWORD *)v50 = 0u;
  *(_OWORD *)(v50 + 16) = 0u;
  *(_BYTE *)(a9 + v47[11]) = 1;
  *(_OWORD *)a9 = xmmword_240AE2710;
  *(_BYTE *)(a9 + 16) = 0;
  v51 = v59;
  *(_QWORD *)(a9 + 24) = v65;
  *(_QWORD *)(a9 + 32) = v51;
  v52 = v60;
  *(_QWORD *)(a9 + 40) = v64;
  *(_QWORD *)(a9 + 48) = v52;
  swift_bridgeObjectRetain();
  outlined assign with take of LACUIAuthCountdownDelayConfiguration?(v66, v48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a9 + v49) = v12;
  *(_QWORD *)(a9 + v47[9]) = v39;
  result = outlined consume of LACUIAuthActionCountdown(*(_QWORD *)v50, *(_QWORD *)(v50 + 8));
  v54 = v62;
  *(_QWORD *)v50 = v44;
  *(_QWORD *)(v50 + 8) = v54;
  v55 = v61;
  *(_QWORD *)(v50 + 16) = v45;
  *(_QWORD *)(v50 + 24) = v55;
  *(_BYTE *)(v50 + 32) = 2;
  return result;
}

uint64_t static LACUIAuthCountdownConfiguration.gracePeriod(customCancelTitle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  Swift::String v39;
  Swift::String v40;
  Swift::String v41;
  Swift::String v42;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38._countAndFlagsBits = 0x74656863746152;
  v38._object = (void *)0xE700000000000000;
  v9 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001ALL, (void *)0x8000000240AE4590, v38);
  v36 = v10;
  v37 = v9;
  v39._countAndFlagsBits = 0x74656863746152;
  v39._object = (void *)0xE700000000000000;
  v11 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000240AE45B0, v39);
  v34 = v12;
  v35 = v11;
  v13 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v14(v8, 1, 1, v13);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthButtonConfiguration>);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_240AE26F0;
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  v16 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xEF45554E49544E4FLL, v40);
  *(_QWORD *)(v15 + 32) = 0xD000000000000015;
  *(_QWORD *)(v15 + 40) = 0x8000000240AE38B0;
  *(_QWORD *)(v15 + 48) = v16;
  *(_QWORD *)(v15 + 56) = v17;
  *(_BYTE *)(v15 + 64) = 0;
  v41._countAndFlagsBits = 0x74656863746152;
  v41._object = (void *)0xE700000000000000;
  v18 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000240AE44F0, v41);
  *(_QWORD *)(v15 + 72) = 0x726F4D6E7261656CLL;
  *(_QWORD *)(v15 + 80) = 0xE900000000000065;
  *(_QWORD *)(v15 + 88) = v18;
  *(_QWORD *)(v15 + 96) = v19;
  *(_BYTE *)(v15 + 104) = 1;
  if (a2)
  {
    v32 = 0xEC0000006C65636ELL;
    v33 = a1;
    v20 = 0x61436D6F74737563;
    v21 = a2;
  }
  else
  {
    v42._countAndFlagsBits = 0;
    v42._object = (void *)0xE000000000000000;
    v22 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xED00004C45434E41, v42);
    v21 = v23;
    v32 = 0xE600000000000000;
    v33 = v22;
    v20 = 0x6C65636E6163;
  }
  v24 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  v25 = a3 + v24[7];
  v14((char *)v25, 1, 1, v13);
  v26 = v24[8];
  *(_QWORD *)(a3 + v26) = 0;
  v27 = a3 + v24[10];
  *(_BYTE *)(v27 + 32) = 0;
  *(_OWORD *)v27 = 0u;
  *(_OWORD *)(v27 + 16) = 0u;
  *(_BYTE *)(a3 + v24[11]) = 1;
  *(_OWORD *)a3 = xmmword_240AE2710;
  *(_BYTE *)(a3 + 16) = 0;
  v28 = v36;
  *(_QWORD *)(a3 + 24) = v37;
  *(_QWORD *)(a3 + 32) = v28;
  v29 = v34;
  *(_QWORD *)(a3 + 40) = v35;
  *(_QWORD *)(a3 + 48) = v29;
  swift_bridgeObjectRetain();
  outlined assign with take of LACUIAuthCountdownDelayConfiguration?((uint64_t)v8, v25);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a3 + v26) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a3 + v24[9]) = v15;
  result = outlined consume of LACUIAuthActionCountdown(*(_QWORD *)v27, *(_QWORD *)(v27 + 8));
  v31 = v32;
  *(_QWORD *)v27 = v20;
  *(_QWORD *)(v27 + 8) = v31;
  *(_QWORD *)(v27 + 16) = v33;
  *(_QWORD *)(v27 + 24) = v21;
  *(_BYTE *)(v27 + 32) = 2;
  return result;
}

uint64_t static LACUIAuthCountdownConfiguration.countdown(message:delayExpiration:customCancelTitle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  void (*v25)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];
  int v44;
  uint64_t v45;
  Swift::String v46;
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t *)((char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a5)
  {
    v44 = 2;
    BYTE5(v43[1]) = 0;
    HIWORD(v43[1]) = -5120;
    strcpy((char *)v43, "customCancel");
  }
  else
  {
    v43[0] = 0;
    v43[1] = 0;
    a4 = 0;
    v44 = 0;
  }
  swift_bridgeObjectRetain();
  v46._countAndFlagsBits = 0x74656863746152;
  v46._object = (void *)0xE700000000000000;
  v15 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001ELL, (void *)0x8000000240AE45D0, v46);
  v41 = v16;
  v42 = v15;
  v45 = a4;
  if (a2)
  {
    v39 = a1;
    v40 = a2;
  }
  else
  {
    v47._countAndFlagsBits = 0x74656863746152;
    v47._object = (void *)0xE700000000000000;
    v39 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000020, (void *)0x8000000240AE45F0, v47);
    v40 = v17;
  }
  swift_bridgeObjectRetain();
  v48._countAndFlagsBits = 0x74656863746152;
  v48._object = (void *)0xE700000000000000;
  v18 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000240AE4620, v48);
  v20 = v19;
  v21 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v22 = (char *)v14 + *(int *)(v21 + 20);
  v23 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v22, a3, v23);
  v24 = (uint64_t *)((char *)v14 + *(int *)(v21 + 24));
  *v14 = v18;
  v14[1] = v20;
  *v24 = 0;
  v24[1] = 0;
  v25 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v25(v14, 0, 1, v21);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthButtonConfiguration>);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_240AE26F0;
  v49._countAndFlagsBits = 0;
  v49._object = (void *)0xE000000000000000;
  v27 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x445F4E4F54545542, (void *)0xEB00000000454E4FLL, v49);
  *(_QWORD *)(v26 + 32) = 1701736292;
  *(_QWORD *)(v26 + 40) = 0xE400000000000000;
  *(_QWORD *)(v26 + 48) = v27;
  *(_QWORD *)(v26 + 56) = v28;
  *(_BYTE *)(v26 + 64) = 0;
  v50._countAndFlagsBits = 0x74656863746152;
  v50._object = (void *)0xE700000000000000;
  v29 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000240AE44F0, v50);
  *(_QWORD *)(v26 + 72) = 0x726F4D6E7261656CLL;
  *(_QWORD *)(v26 + 80) = 0xE900000000000065;
  *(_QWORD *)(v26 + 88) = v29;
  *(_QWORD *)(v26 + 96) = v30;
  *(_BYTE *)(v26 + 104) = 1;
  v31 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  v32 = a6 + v31[7];
  v25((uint64_t *)v32, 1, 1, v21);
  v33 = v31[8];
  *(_QWORD *)(a6 + v33) = 0;
  v34 = a6 + v31[10];
  *(_BYTE *)(v34 + 32) = 0;
  *(_OWORD *)v34 = 0u;
  *(_OWORD *)(v34 + 16) = 0u;
  *(_BYTE *)(a6 + v31[11]) = 1;
  *(_QWORD *)a6 = 0xD000000000000015;
  *(_QWORD *)(a6 + 8) = 0x8000000240AE4440;
  *(_BYTE *)(a6 + 16) = 0;
  v35 = v41;
  *(_QWORD *)(a6 + 24) = v42;
  *(_QWORD *)(a6 + 32) = v35;
  v36 = v40;
  *(_QWORD *)(a6 + 40) = v39;
  *(_QWORD *)(a6 + 48) = v36;
  outlined assign with take of LACUIAuthCountdownDelayConfiguration?((uint64_t)v14, v32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a6 + v33) = 0;
  *(_QWORD *)(a6 + v31[9]) = v26;
  result = outlined consume of LACUIAuthActionCountdown(*(_QWORD *)v34, *(_QWORD *)(v34 + 8));
  v38 = v43[1];
  *(_QWORD *)v34 = v43[0];
  *(_QWORD *)(v34 + 8) = v38;
  *(_QWORD *)(v34 + 16) = v45;
  *(_QWORD *)(v34 + 24) = a5;
  *(_BYTE *)(v34 + 32) = v44;
  return result;
}

uint64_t static LACUIAuthCountdownConfiguration.ready(message:customCancelTitle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];
  uint64_t v33;
  int v34;
  Swift::String v35;
  Swift::String v36;
  Swift::String v37;

  v33 = a1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v34 = 2;
    BYTE5(v32[1]) = 0;
    HIWORD(v32[1]) = -5120;
    v31 = a3;
    strcpy((char *)v32, "customCancel");
  }
  else
  {
    v32[0] = 0;
    v32[1] = 0;
    v31 = 0;
    v34 = 0;
  }
  swift_bridgeObjectRetain();
  v35._countAndFlagsBits = 0x74656863746152;
  v35._object = (void *)0xE700000000000000;
  v12 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000240AE4640, v35);
  v29 = v13;
  v30 = v12;
  v14 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v15(v11, 1, 1, v14);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<LACUIAuthButtonConfiguration>);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_240AE26F0;
  swift_bridgeObjectRetain();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  v17 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xEF45554E49544E4FLL, v36);
  *(_QWORD *)(v16 + 32) = 0x65756E69746E6F63;
  *(_QWORD *)(v16 + 40) = 0xE800000000000000;
  *(_QWORD *)(v16 + 48) = v17;
  *(_QWORD *)(v16 + 56) = v18;
  *(_BYTE *)(v16 + 64) = 0;
  v37._countAndFlagsBits = 0x74656863746152;
  v37._object = (void *)0xE700000000000000;
  v19 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000240AE44F0, v37);
  *(_QWORD *)(v16 + 72) = 0x726F4D6E7261656CLL;
  *(_QWORD *)(v16 + 80) = 0xE900000000000065;
  *(_QWORD *)(v16 + 88) = v19;
  *(_QWORD *)(v16 + 96) = v20;
  *(_BYTE *)(v16 + 104) = 1;
  v21 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  v22 = a5 + v21[7];
  v15((char *)v22, 1, 1, v14);
  v23 = v21[8];
  *(_QWORD *)(a5 + v23) = 0;
  v24 = a5 + v21[10];
  *(_BYTE *)(v24 + 32) = 0;
  *(_OWORD *)v24 = 0u;
  *(_OWORD *)(v24 + 16) = 0u;
  *(_BYTE *)(a5 + v21[11]) = 1;
  *(_OWORD *)a5 = xmmword_240AE2720;
  *(_BYTE *)(a5 + 16) = 1;
  v25 = v29;
  *(_QWORD *)(a5 + 24) = v30;
  *(_QWORD *)(a5 + 32) = v25;
  *(_QWORD *)(a5 + 40) = v33;
  *(_QWORD *)(a5 + 48) = a2;
  outlined assign with take of LACUIAuthCountdownDelayConfiguration?((uint64_t)v11, v22);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a5 + v23) = 0;
  *(_QWORD *)(a5 + v21[9]) = v16;
  result = outlined consume of LACUIAuthActionCountdown(*(_QWORD *)v24, *(_QWORD *)(v24 + 8));
  v27 = v32[1];
  *(_QWORD *)v24 = v32[0];
  *(_QWORD *)(v24 + 8) = v27;
  *(_QWORD *)(v24 + 16) = v31;
  *(_QWORD *)(v24 + 24) = a4;
  *(_BYTE *)(v24 + 32) = v34;
  return result;
}

uint64_t LACUIAuthCountdownConfiguration.ActionButtonIdentifier.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_240AD4FCC + 4 * byte_240AE24DC[*v0]))(0xD000000000000012, 0x8000000240AE3880);
}

uint64_t sub_240AD4FCC()
{
  return 0x726F4D6E7261656CLL;
}

uint64_t sub_240AD4FE8()
{
  return 1701736292;
}

uint64_t sub_240AD4FF8()
{
  return 0x65756E69746E6F63;
}

uint64_t sub_240AD5010(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_240AD5028()
{
  return 0x6C65636E6163;
}

uint64_t sub_240AD503C()
{
  return 0x61436D6F74737563;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier(char *a1)
{
  specialized == infix<A>(_:_:)(*a1);
}

void protocol witness for Hashable.hashValue.getter in conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier()
{
  char *v0;

  specialized RawRepresentable<>._rawHashValue(seed:)(0, *v0);
}

void protocol witness for Hashable.hash(into:) in conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier(uint64_t a1)
{
  char *v1;

  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier(uint64_t a1)
{
  char *v1;

  specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

LocalAuthenticationCoreUI::LACUIAuthCountdownConfiguration::ActionButtonIdentifier_optional protocol witness for RawRepresentable.init(rawValue:) in conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier(Swift::String *a1)
{
  return LACUIAuthCountdownConfiguration.ActionButtonIdentifier.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = LACUIAuthCountdownConfiguration.ActionButtonIdentifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t LACUIAuthCountdownConfiguration.image.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_BYTE *)(v1 + 16);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = v3;
  return outlined copy of LACUIAuthImageConfiguration();
}

uint64_t LACUIAuthCountdownConfiguration.image.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  result = outlined consume of LACUIAuthImageConfiguration();
  *(_QWORD *)v1 = v2;
  *(_QWORD *)(v1 + 8) = v3;
  *(_BYTE *)(v1 + 16) = v4;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.image.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthCountdownConfiguration.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.title.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.message.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthCountdownConfiguration.message.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.message.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.delayConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 28);
  return outlined init with copy of LACUIAuthCountdownDelayConfiguration?(v3, a1);
}

uint64_t LACUIAuthCountdownConfiguration.delayConfiguration.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 28);
  return outlined assign with take of LACUIAuthCountdownDelayConfiguration?(a1, v3);
}

uint64_t (*LACUIAuthCountdownConfiguration.delayConfiguration.modify())(_QWORD)
{
  type metadata accessor for LACUIAuthCountdownConfiguration();
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.actionItems.getter()
{
  type metadata accessor for LACUIAuthCountdownConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t LACUIAuthCountdownConfiguration.actionItems.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 32);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.actionItems.modify())(_QWORD)
{
  type metadata accessor for LACUIAuthCountdownConfiguration();
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.actionButtons.getter()
{
  type metadata accessor for LACUIAuthCountdownConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t LACUIAuthCountdownConfiguration.actionButtons.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 36);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.actionButtons.modify())(_QWORD)
{
  type metadata accessor for LACUIAuthCountdownConfiguration();
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.rightBarButton.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 40);
  v4 = *(_QWORD *)v3;
  v5 = *(_QWORD *)(v3 + 8);
  v6 = *(_QWORD *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)a1 = *(_QWORD *)v3;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(v3 + 32);
  return outlined copy of LACUIAuthActionCountdown(v4, v5);
}

__n128 LACUIAuthCountdownConfiguration.rightBarButton.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  __n128 result;
  __n128 v7;

  v7 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  v4 = a1[2].n128_u8[0];
  v5 = v1 + *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 40);
  outlined consume of LACUIAuthActionCountdown(*(_QWORD *)v5, *(_QWORD *)(v5 + 8));
  result = v7;
  *(__n128 *)v5 = v7;
  *(_QWORD *)(v5 + 16) = v2;
  *(_QWORD *)(v5 + 24) = v3;
  *(_BYTE *)(v5 + 32) = v4;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.rightBarButton.modify())(_QWORD)
{
  type metadata accessor for LACUIAuthCountdownConfiguration();
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownConfiguration.isShowingTopBar.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for LACUIAuthCountdownConfiguration() + 44));
}

uint64_t LACUIAuthCountdownConfiguration.isShowingTopBar.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for LACUIAuthCountdownConfiguration();
  *(_BYTE *)(v1 + *(int *)(result + 44)) = a1;
  return result;
}

uint64_t (*LACUIAuthCountdownConfiguration.isShowingTopBar.modify())(_QWORD)
{
  type metadata accessor for LACUIAuthCountdownConfiguration();
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

__n128 LACUIAuthCountdownConfiguration.init(image:title:message:delayConfiguration:actionItems:actionButtons:rightBarButton:)@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 *a10)
{
  uint64_t v13;
  uint64_t v14;
  char v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __n128 result;
  unsigned __int8 v27;
  unint64_t v28;
  unint64_t v29;
  __n128 v30;

  v13 = *a1;
  v14 = a1[1];
  v15 = *((_BYTE *)a1 + 16);
  v30 = *a10;
  v28 = a10[1].n128_u64[1];
  v29 = a10[1].n128_u64[0];
  v27 = a10[2].n128_u8[0];
  v16 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  v17 = a9 + v16[7];
  v18 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = v16[8];
  *(_QWORD *)(a9 + v19) = 0;
  v20 = a9 + v16[10];
  *(_BYTE *)(v20 + 32) = 0;
  *(_OWORD *)v20 = 0u;
  *(_OWORD *)(v20 + 16) = 0u;
  *(_BYTE *)(a9 + v16[11]) = 1;
  *(_QWORD *)a9 = v13;
  *(_QWORD *)(a9 + 8) = v14;
  *(_BYTE *)(a9 + 16) = v15;
  *(_QWORD *)(a9 + 24) = a2;
  *(_QWORD *)(a9 + 32) = a3;
  *(_QWORD *)(a9 + 40) = a4;
  *(_QWORD *)(a9 + 48) = a5;
  outlined assign with take of LACUIAuthCountdownDelayConfiguration?(a6, v17);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a9 + v19) = a7;
  *(_QWORD *)(a9 + v16[9]) = a8;
  outlined consume of LACUIAuthActionCountdown(*(_QWORD *)v20, *(_QWORD *)(v20 + 8));
  result = v30;
  *(__n128 *)v20 = v30;
  *(_QWORD *)(v20 + 16) = v29;
  *(_QWORD *)(v20 + 24) = v28;
  *(_BYTE *)(v20 + 32) = v27;
  return result;
}

uint64_t static LACUIAuthCountdownConfiguration.learnMoreButton.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  Swift::String v4;

  v4._countAndFlagsBits = 0x74656863746152;
  v4._object = (void *)0xE700000000000000;
  result = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000240AE44F0, v4);
  *(_QWORD *)a1 = 0x726F4D6E7261656CLL;
  *(_QWORD *)(a1 + 8) = 0xE900000000000065;
  *(_QWORD *)(a1 + 16) = result;
  *(_QWORD *)(a1 + 24) = v3;
  *(_BYTE *)(a1 + 32) = 1;
  return result;
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  char v15;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = 0;
    do
    {
      v6 = *(_QWORD *)(a1 + v3 + 48);
      v5 = *(_QWORD *)(a1 + v3 + 56);
      v7 = *(_BYTE *)(a1 + v3 + 64);
      v8 = *(_QWORD *)(a1 + v3 + 80);
      v9 = *(_QWORD *)(a2 + v3 + 48);
      v10 = *(_BYTE *)(a2 + v3 + 64);
      v18 = *(_QWORD *)(a2 + v3 + 72);
      v19 = *(_QWORD *)(a1 + v3 + 72);
      v20 = *(_QWORD *)(a2 + v3 + 80);
      v21 = *(_QWORD *)(a2 + v3 + 56);
      if ((*(_QWORD *)(a1 + v3 + 32) != *(_QWORD *)(a2 + v3 + 32)
         || *(_QWORD *)(a1 + v3 + 40) != *(_QWORD *)(a2 + v3 + 40))
        && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        return 0;
      }
      if ((v7 & 1) != 0)
      {
        if ((v10 & 1) == 0)
          goto LABEL_25;
        if (v6 == v9 && v5 == v21)
          goto LABEL_19;
        v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRetain();
        outlined copy of LACUIAuthImageConfiguration();
        v11 = v8;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        outlined copy of LACUIAuthImageConfiguration();
        v12 = v20;
        swift_bridgeObjectRetain();
        outlined copy of LACUIAuthImageConfiguration();
        outlined copy of LACUIAuthImageConfiguration();
        outlined consume of LACUIAuthImageConfiguration();
        outlined consume of LACUIAuthImageConfiguration();
        if ((v14 & 1) == 0)
          goto LABEL_27;
      }
      else
      {
        if ((v10 & 1) != 0)
        {
LABEL_25:
          outlined copy of LACUIAuthImageConfiguration();
          outlined copy of LACUIAuthImageConfiguration();
          outlined consume of LACUIAuthImageConfiguration();
          outlined consume of LACUIAuthImageConfiguration();
          return 0;
        }
        if (v6 == v9 && v5 == v21)
        {
LABEL_19:
          swift_bridgeObjectRetain();
          outlined copy of LACUIAuthImageConfiguration();
          v11 = v8;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          outlined copy of LACUIAuthImageConfiguration();
          v12 = v20;
          swift_bridgeObjectRetain();
          outlined copy of LACUIAuthImageConfiguration();
          outlined copy of LACUIAuthImageConfiguration();
          outlined consume of LACUIAuthImageConfiguration();
          outlined consume of LACUIAuthImageConfiguration();
          goto LABEL_21;
        }
        v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRetain();
        outlined copy of LACUIAuthImageConfiguration();
        v11 = v8;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        outlined copy of LACUIAuthImageConfiguration();
        v12 = v20;
        swift_bridgeObjectRetain();
        outlined copy of LACUIAuthImageConfiguration();
        outlined copy of LACUIAuthImageConfiguration();
        outlined consume of LACUIAuthImageConfiguration();
        outlined consume of LACUIAuthImageConfiguration();
        if ((v15 & 1) == 0)
        {
LABEL_27:
          swift_bridgeObjectRelease();
          outlined consume of LACUIAuthImageConfiguration();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          outlined consume of LACUIAuthImageConfiguration();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
LABEL_21:
      if (v19 == v18 && v11 == v12)
      {
        swift_bridgeObjectRelease();
        outlined consume of LACUIAuthImageConfiguration();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        outlined consume of LACUIAuthImageConfiguration();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        outlined consume of LACUIAuthImageConfiguration();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        outlined consume of LACUIAuthImageConfiguration();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
          return 0;
      }
      v3 += 56;
      --v2;
    }
    while (v2);
  }
  return 1;
}

{
  uint64_t v2;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  char v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    for (i = 0; ; i += 40)
    {
      v6 = *(_QWORD *)(a1 + i + 48);
      v7 = *(_QWORD *)(a1 + i + 56);
      v8 = *(unsigned __int8 *)(a1 + i + 64);
      v9 = *(_QWORD *)(a2 + i + 48);
      v10 = *(_QWORD *)(a2 + i + 56);
      v11 = *(unsigned __int8 *)(a2 + i + 64);
      v12 = *(_QWORD *)(a1 + i + 32) == *(_QWORD *)(a2 + i + 32) && *(_QWORD *)(a1 + i + 40) == *(_QWORD *)(a2 + i + 40);
      if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        break;
      if (v6 == v9 && v7 == v10)
      {
        if (v8 != v11)
          return 0;
      }
      else
      {
        v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
        result = 0;
        if ((v14 & 1) == 0 || v8 != v11)
          return result;
      }
      if (!--v2)
        return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t one-time initialization function for learnMoreURL()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  uint64_t v8;

  v0 = type metadata accessor for URL();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, static LACUIAuthCountdownConfiguration.learnMoreURL);
  v5 = __swift_project_value_buffer(v0, (uint64_t)static LACUIAuthCountdownConfiguration.learnMoreURL);
  v6 = objc_msgSend((id)objc_opt_self(), sel_dtoLearnMoreLinkURL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v4, v0);
}

uint64_t LACUIAuthCountdownConfiguration.learnMoreURL.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for learnMoreURL != -1)
    swift_once();
  v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)static LACUIAuthCountdownConfiguration.learnMoreURL);
}

uint64_t static LACUIAuthCountdownConfiguration.learnMoreURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for learnMoreURL != -1)
    swift_once();
  v2 = type metadata accessor for URL();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static LACUIAuthCountdownConfiguration.learnMoreURL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static LACUIAuthCountdownConfiguration.empty.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t);
  uint64_t v11;

  v2 = type metadata accessor for Date();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  static Date.now.getter();
  Date.addingTimeInterval(_:)();
  v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v9(v6, v2);
  static LACUIAuthCountdownConfiguration.countdown(message:delayExpiration:customCancelTitle:)(0, 0xE000000000000000, (uint64_t)v8, 0, 0, a1);
  return ((uint64_t (*)(char *, uint64_t))v9)(v8, v2);
}

uint64_t specialized static LACUIAuthCountdownConfiguration.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  char v55;
  int v57;
  char v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;

  v63 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v4 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v62 = (uint64_t *)((char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (LACUIAuthCountdownDelayConfiguration?, LACUIAuthCountdownDelayConfiguration?));
  MEMORY[0x24BDAC7A8](v6);
  v64 = (uint64_t)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v59 - v13;
  v15 = *a1;
  v16 = a1[1];
  v17 = *a2;
  v18 = a2[1];
  if ((a1[2] & 1) != 0)
  {
    if ((a2[2] & 1) != 0)
    {
      v60 = (_QWORD *)v11;
      v61 = v12;
      if (v15 != v17 || v16 != v18)
        goto LABEL_11;
LABEL_10:
      outlined copy of LACUIAuthImageConfiguration();
      outlined copy of LACUIAuthImageConfiguration();
      outlined consume of LACUIAuthImageConfiguration();
      outlined consume of LACUIAuthImageConfiguration();
      goto LABEL_12;
    }
LABEL_7:
    outlined copy of LACUIAuthImageConfiguration();
    outlined copy of LACUIAuthImageConfiguration();
    outlined consume of LACUIAuthImageConfiguration();
    outlined consume of LACUIAuthImageConfiguration();
    goto LABEL_51;
  }
  if ((a2[2] & 1) != 0)
    goto LABEL_7;
  v60 = (_QWORD *)v11;
  v61 = v12;
  if (v15 == v17 && v16 == v18)
    goto LABEL_10;
LABEL_11:
  v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
  outlined copy of LACUIAuthImageConfiguration();
  outlined copy of LACUIAuthImageConfiguration();
  outlined consume of LACUIAuthImageConfiguration();
  outlined consume of LACUIAuthImageConfiguration();
  v20 = 0;
  if ((v19 & 1) == 0)
    return v20 & 1;
LABEL_12:
  if (a1[3] != a2[3] || a1[4] != a2[4])
  {
    v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
    v20 = 0;
    if ((v21 & 1) == 0)
      return v20 & 1;
  }
  if (a1[5] != a2[5] || a1[6] != a2[6])
  {
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
    v20 = 0;
    if ((v22 & 1) == 0)
      return v20 & 1;
  }
  v23 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  outlined init with copy of LACUIAuthCountdownDelayConfiguration?((uint64_t)a1 + v23[7], (uint64_t)v14);
  v24 = v61;
  outlined init with copy of LACUIAuthCountdownDelayConfiguration?((uint64_t)a2 + v23[7], v61);
  v25 = v64;
  v26 = v64 + *(int *)(v6 + 48);
  outlined init with copy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v14, v64);
  outlined init with copy of LACUIAuthCountdownDelayConfiguration?(v24, v26);
  v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  v28 = v63;
  if (v27(v25, 1, v63) == 1)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v24, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v14, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    if (v27(v26, 1, v28) == 1)
      goto LABEL_20;
    goto LABEL_26;
  }
  v33 = v60;
  outlined init with copy of LACUIAuthCountdownDelayConfiguration?(v25, (uint64_t)v60);
  if (v27(v26, 1, v28) == 1)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v24, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v14, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v33);
LABEL_26:
    v34 = &demangling cache variable for type metadata for (LACUIAuthCountdownDelayConfiguration?, LACUIAuthCountdownDelayConfiguration?);
    v35 = v25;
LABEL_50:
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v35, v34);
    goto LABEL_51;
  }
  v36 = v26;
  v37 = v62;
  outlined init with take of LACUIAuthCountdownDelayConfiguration(v36, (uint64_t)v62);
  if ((*v33 != *v37 || v33[1] != v37[1]) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
    || (static Date.== infix(_:_:)() & 1) == 0)
  {
    goto LABEL_49;
  }
  v38 = *(int *)(v28 + 24);
  v39 = (_QWORD *)((char *)v33 + v38);
  v40 = *(_QWORD *)((char *)v33 + v38 + 8);
  v41 = (_QWORD *)((char *)v37 + v38);
  v42 = v41[1];
  if (v40)
  {
    if (v42 && (*v39 == *v41 && v40 == v42 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
      goto LABEL_36;
LABEL_49:
    outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v37);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?(v24, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v14, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v33);
    v35 = v25;
    v34 = &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?;
    goto LABEL_50;
  }
  if (v42)
    goto LABEL_49;
LABEL_36:
  outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v37);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v24, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v14, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v33);
LABEL_20:
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v25, &demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  v29 = v23[8];
  v30 = *(uint64_t *)((char *)a2 + v29);
  if (*(uint64_t *)((char *)a1 + v29))
  {
    if (!v30)
      goto LABEL_51;
    swift_bridgeObjectRetain();
    v31 = swift_bridgeObjectRetain();
    v32 = specialized static Array<A>.== infix(_:_:)(v31, v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v32 & 1) == 0)
      goto LABEL_51;
  }
  else if (v30)
  {
    goto LABEL_51;
  }
  if ((specialized static Array<A>.== infix(_:_:)(*(uint64_t *)((char *)a1 + v23[9]), *(uint64_t *)((char *)a2 + v23[9])) & 1) == 0)
    goto LABEL_51;
  v43 = v23[10];
  v45 = *(uint64_t *)((char *)a1 + v43);
  v44 = *(uint64_t *)((char *)a1 + v43 + 8);
  v46 = *(uint64_t *)((char *)a1 + v43 + 16);
  v64 = *(uint64_t *)((char *)a1 + v43 + 24);
  v47 = *((unsigned __int8 *)a1 + v43 + 32);
  v48 = (uint64_t)a2 + v43;
  v50 = *(_QWORD *)v48;
  v49 = *(_QWORD *)(v48 + 8);
  v51 = *(_QWORD *)(v48 + 16);
  v52 = *(_QWORD *)(v48 + 24);
  v53 = *(unsigned __int8 *)(v48 + 32);
  LODWORD(v63) = v47;
  if (!v44)
  {
    if (!v49)
      goto LABEL_59;
    goto LABEL_56;
  }
  if (!v49)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_56:
    outlined copy of LACUIAuthActionCountdown(v50, v49);
    outlined consume of LACUIAuthActionCountdown(v45, v44);
    outlined consume of LACUIAuthActionCountdown(v50, v49);
    goto LABEL_51;
  }
  if (v45 == v50 && v44 == v49
    || (v54 = v53, v55 = _stringCompareWithSmolCheck(_:_:expecting:)(), v53 = v54, v20 = 0, (v55 & 1) != 0))
  {
    if (v46 == v51 && v64 == v52)
    {
      if ((_DWORD)v63 == v53)
      {
LABEL_59:
        v20 = *((_BYTE *)a1 + v23[11]) ^ *((_BYTE *)a2 + v23[11]) ^ 1;
        return v20 & 1;
      }
LABEL_51:
      v20 = 0;
      return v20 & 1;
    }
    v57 = v53;
    v58 = _stringCompareWithSmolCheck(_:_:expecting:)();
    v20 = 0;
    if ((v58 & 1) != 0 && (_DWORD)v63 == v57)
      goto LABEL_59;
  }
  return v20 & 1;
}

uint64_t type metadata accessor for LACUIAuthCountdownConfiguration()
{
  uint64_t result;

  result = type metadata singleton initialization cache for LACUIAuthCountdownConfiguration;
  if (!type metadata singleton initialization cache for LACUIAuthCountdownConfiguration)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t outlined assign with take of LACUIAuthCountdownDelayConfiguration?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t lazy protocol witness table accessor for type LACUIAuthCountdownConfiguration.ActionButtonIdentifier and conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LACUIAuthCountdownConfiguration.ActionButtonIdentifier and conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier;
  if (!lazy protocol witness table cache variable for type LACUIAuthCountdownConfiguration.ActionButtonIdentifier and conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier)
  {
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUIAuthCountdownConfiguration.ActionButtonIdentifier, &type metadata for LACUIAuthCountdownConfiguration.ActionButtonIdentifier);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownConfiguration.ActionButtonIdentifier and conformance LACUIAuthCountdownConfiguration.ActionButtonIdentifier);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(_QWORD *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  void (*v28)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  char *v37;
  char *v38;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v19 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    v9 = *((_BYTE *)a2 + 16);
    outlined copy of LACUIAuthImageConfiguration();
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = v9;
    v10 = a2[4];
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_QWORD *)(a1 + 32) = v10;
    v11 = a2[6];
    v12 = a3[7];
    v13 = (_QWORD *)(a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_QWORD *)(a1 + 48) = v11;
    v15 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    v16 = *(_QWORD *)(v15 - 8);
    v17 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v17(v14, 1, v15))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v20 = v14[1];
      *v13 = *v14;
      v13[1] = v20;
      v21 = *(int *)(v15 + 20);
      v37 = (char *)v14 + v21;
      v38 = (char *)v13 + v21;
      v22 = type metadata accessor for Date();
      v23 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
      swift_bridgeObjectRetain();
      v23(v38, v37, v22);
      v24 = *(int *)(v15 + 24);
      v25 = (_QWORD *)((char *)v13 + v24);
      v26 = (_QWORD *)((char *)v14 + v24);
      v27 = v26[1];
      *v25 = *v26;
      v25[1] = v27;
      v28 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v16 + 56);
      swift_bridgeObjectRetain();
      v28(v13, 0, 1, v15);
    }
    v29 = a3[9];
    *(_QWORD *)(a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    *(_QWORD *)(a1 + v29) = *(uint64_t *)((char *)a2 + v29);
    v30 = a3[10];
    v31 = a1 + v30;
    v32 = (uint64_t)a2 + v30;
    v33 = *(uint64_t *)((char *)a2 + v30 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v33)
    {
      *(_QWORD *)v31 = *(_QWORD *)v32;
      *(_QWORD *)(v31 + 8) = v33;
      v34 = *(_QWORD *)(v32 + 24);
      *(_QWORD *)(v31 + 16) = *(_QWORD *)(v32 + 16);
      *(_QWORD *)(v31 + 24) = v34;
      *(_BYTE *)(v31 + 32) = *(_BYTE *)(v32 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v35 = *(_OWORD *)(v32 + 16);
      *(_OWORD *)v31 = *(_OWORD *)v32;
      *(_OWORD *)(v31 + 16) = v35;
      *(_BYTE *)(v31 + 32) = *(_BYTE *)(v32 + 32);
    }
    *(_BYTE *)(a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  }
  return a1;
}

uint64_t destroy for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  outlined consume of LACUIAuthImageConfiguration();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    swift_bridgeObjectRelease();
    v6 = v4 + *(int *)(v5 + 20);
    v7 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = *(_QWORD *)(a1 + *(int *)(a2 + 40) + 8);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(_QWORD *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  void (*v26)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  char *v35;
  char *v36;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  outlined copy of LACUIAuthImageConfiguration();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  v9 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v9;
  v10 = a2[6];
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)((char *)a2 + v11);
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = v10;
  v14 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v15 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v16(v13, 1, v14))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v18 = v13[1];
    *v12 = *v13;
    v12[1] = v18;
    v19 = *(int *)(v14 + 20);
    v35 = (char *)v13 + v19;
    v36 = (char *)v12 + v19;
    v20 = type metadata accessor for Date();
    v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    v21(v36, v35, v20);
    v22 = *(int *)(v14 + 24);
    v23 = (_QWORD *)((char *)v12 + v22);
    v24 = (_QWORD *)((char *)v13 + v22);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    v26 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56);
    swift_bridgeObjectRetain();
    v26(v12, 0, 1, v14);
  }
  v27 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  *(_QWORD *)(a1 + v27) = *(uint64_t *)((char *)a2 + v27);
  v28 = a3[10];
  v29 = a1 + v28;
  v30 = (uint64_t)a2 + v28;
  v31 = *(uint64_t *)((char *)a2 + v28 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v31)
  {
    *(_QWORD *)v29 = *(_QWORD *)v30;
    *(_QWORD *)(v29 + 8) = v31;
    v32 = *(_QWORD *)(v30 + 24);
    *(_QWORD *)(v29 + 16) = *(_QWORD *)(v30 + 16);
    *(_QWORD *)(v29 + 24) = v32;
    *(_BYTE *)(v29 + 32) = *(_BYTE *)(v30 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v33 = *(_OWORD *)(v30 + 16);
    *(_OWORD *)v29 = *(_OWORD *)v30;
    *(_OWORD *)(v29 + 16) = v33;
    *(_BYTE *)(v29 + 32) = *(_BYTE *)(v30 + 32);
  }
  *(_BYTE *)(a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  return a1;
}

uint64_t assignWithCopy for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  void (*v23)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  __int128 v39;
  __int128 v40;
  char *v42;
  char *v43;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  outlined copy of LACUIAuthImageConfiguration();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  outlined consume of LACUIAuthImageConfiguration();
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = a3[7];
  v10 = (_QWORD *)(a1 + v9);
  v11 = (uint64_t *)((char *)a2 + v9);
  v12 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      *v10 = *v11;
      v10[1] = v11[1];
      v17 = *(int *)(v12 + 20);
      v42 = (char *)v11 + v17;
      v43 = (char *)v10 + v17;
      v18 = type metadata accessor for Date();
      v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
      swift_bridgeObjectRetain();
      v19(v43, v42, v18);
      v20 = *(int *)(v12 + 24);
      v21 = (_QWORD *)((char *)v10 + v20);
      v22 = (_QWORD *)((char *)v11 + v20);
      *v21 = *v22;
      v21[1] = v22[1];
      v23 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v13 + 56);
      swift_bridgeObjectRetain();
      v23(v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v10);
LABEL_6:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  *v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v32 = *(int *)(v12 + 20);
  v33 = (char *)v10 + v32;
  v34 = (char *)v11 + v32;
  v35 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 24))(v33, v34, v35);
  v36 = *(int *)(v12 + 24);
  v37 = (_QWORD *)((char *)v10 + v36);
  v38 = (_QWORD *)((char *)v11 + v36);
  *v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_7:
  *(_QWORD *)(a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v25 = a3[10];
  v26 = a1 + v25;
  v27 = (__int128 *)((char *)a2 + v25);
  v28 = *(_QWORD *)(a1 + v25 + 8);
  v29 = *(uint64_t *)((char *)a2 + v25 + 8);
  if (v28)
  {
    if (v29)
    {
      *(_QWORD *)v26 = *(_QWORD *)v27;
      *(_QWORD *)(v26 + 8) = *((_QWORD *)v27 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v26 + 16) = *((_QWORD *)v27 + 2);
      *(_QWORD *)(v26 + 24) = *((_QWORD *)v27 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(v26 + 32) = *((_BYTE *)v27 + 32);
    }
    else
    {
      outlined destroy of LACUIAuthButtonConfiguration(v26);
      v30 = *((_BYTE *)v27 + 32);
      v31 = v27[1];
      *(_OWORD *)v26 = *v27;
      *(_OWORD *)(v26 + 16) = v31;
      *(_BYTE *)(v26 + 32) = v30;
    }
  }
  else if (v29)
  {
    *(_QWORD *)v26 = *(_QWORD *)v27;
    *(_QWORD *)(v26 + 8) = *((_QWORD *)v27 + 1);
    *(_QWORD *)(v26 + 16) = *((_QWORD *)v27 + 2);
    *(_QWORD *)(v26 + 24) = *((_QWORD *)v27 + 3);
    *(_BYTE *)(v26 + 32) = *((_BYTE *)v27 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v39 = *v27;
    v40 = v27[1];
    *(_BYTE *)(v26 + 32) = *((_BYTE *)v27 + 32);
    *(_OWORD *)v26 = v39;
    *(_OWORD *)(v26 + 16) = v40;
  }
  *(_BYTE *)(a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  return a1;
}

uint64_t outlined destroy of LACUIAuthCountdownDelayConfiguration(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined destroy of LACUIAuthButtonConfiguration(uint64_t a1)
{
  destroy for LACUIAuthButtonConfiguration();
  return a1;
}

uint64_t initializeWithTake for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v6 = a3[7];
  v7 = (_OWORD *)(a1 + v6);
  v8 = (_OWORD *)(a2 + v6);
  v9 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    *v7 = *v8;
    v12 = *(int *)(v9 + 20);
    v13 = (char *)v7 + v12;
    v14 = (char *)v8 + v12;
    v15 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
    *(_OWORD *)((char *)v7 + *(int *)(v9 + 24)) = *(_OWORD *)((char *)v8 + *(int *)(v9 + 24));
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v16 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);
  v17 = a3[10];
  v18 = a3[11];
  v19 = a1 + v17;
  v20 = a2 + v17;
  v21 = *(_OWORD *)(v20 + 16);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *(_OWORD *)(v19 + 16) = v21;
  *(_BYTE *)(v19 + 32) = *(_BYTE *)(v20 + 32);
  *(_BYTE *)(a1 + v18) = *(_BYTE *)(a2 + v18);
  return a1;
}

uint64_t assignWithTake for LACUIAuthCountdownConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v6 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  outlined consume of LACUIAuthImageConfiguration();
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  v9 = a3[7];
  v10 = (_QWORD *)(a1 + v9);
  v11 = (_QWORD *)(a2 + v9);
  v12 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      *(_OWORD *)v10 = *(_OWORD *)v11;
      v17 = *(int *)(v12 + 20);
      v18 = (char *)v10 + v17;
      v19 = (char *)v11 + v17;
      v20 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
      *(_OWORD *)((char *)v10 + *(int *)(v12 + 24)) = *(_OWORD *)((char *)v11 + *(int *)(v12 + 24));
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    outlined destroy of LACUIAuthCountdownDelayConfiguration((uint64_t)v10);
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  v29 = v11[1];
  *v10 = *v11;
  v10[1] = v29;
  swift_bridgeObjectRelease();
  v30 = *(int *)(v12 + 20);
  v31 = (char *)v10 + v30;
  v32 = (char *)v11 + v30;
  v33 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 40))(v31, v32, v33);
  v34 = *(int *)(v12 + 24);
  v35 = (_QWORD *)((char *)v10 + v34);
  v36 = (_QWORD *)((char *)v11 + v34);
  v38 = *v36;
  v37 = v36[1];
  *v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease();
LABEL_7:
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  v22 = a3[10];
  v23 = a1 + v22;
  v24 = a2 + v22;
  if (!*(_QWORD *)(a1 + v22 + 8))
  {
LABEL_11:
    v27 = *(_OWORD *)(v24 + 16);
    *(_OWORD *)v23 = *(_OWORD *)v24;
    *(_OWORD *)(v23 + 16) = v27;
    goto LABEL_12;
  }
  v25 = *(_QWORD *)(v24 + 8);
  if (!v25)
  {
    outlined destroy of LACUIAuthButtonConfiguration(v23);
    goto LABEL_11;
  }
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_QWORD *)(v23 + 8) = v25;
  swift_bridgeObjectRelease();
  v26 = *(_QWORD *)(v24 + 24);
  *(_QWORD *)(v23 + 16) = *(_QWORD *)(v24 + 16);
  *(_QWORD *)(v23 + 24) = v26;
  swift_bridgeObjectRelease();
LABEL_12:
  *(_BYTE *)(v23 + 32) = *(_BYTE *)(v24 + 32);
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthCountdownConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240AD72C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for LACUIAuthCountdownConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240AD7354(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 32) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void type metadata completion function for LACUIAuthCountdownConfiguration()
{
  unint64_t v0;

  type metadata accessor for LACUIAuthCountdownDelayConfiguration?();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for LACUIAuthCountdownDelayConfiguration?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?)
  {
    type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
  }
}

uint64_t getEnumTagSinglePayload for LACUIAuthCountdownConfiguration.ActionButtonIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LACUIAuthCountdownConfiguration.ActionButtonIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_240AD75A8 + 4 * byte_240AE24E8[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_240AD75DC + 4 * byte_240AE24E3[v4]))();
}

uint64_t sub_240AD75DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240AD75E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240AD75ECLL);
  return result;
}

uint64_t sub_240AD75F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240AD7600);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_240AD7604(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240AD760C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for LACUIAuthCountdownConfiguration.ActionButtonIdentifier(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthCountdownConfiguration.ActionButtonIdentifier()
{
  return &type metadata for LACUIAuthCountdownConfiguration.ActionButtonIdentifier;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t outlined init with take of LACUIAuthCountdownDelayConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static LocalizedStrings.operationNotSupportedOnCompanionFaceId(applicationName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];
  Swift::String v8;
  Swift::String v9;

  if (a2)
  {
    v7[3] = MEMORY[0x24BEE0D00];
    v7[4] = lazy protocol witness table accessor for type String and conformance String();
    v7[0] = a1;
    v7[1] = a2;
    swift_bridgeObjectRetain_n();
    v8._countAndFlagsBits = 0x75676F6C61746143;
    v8._object = (void *)0xE900000000000065;
    specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000026, (void *)0x8000000240AE4230, v8);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_240AE1F20;
    outlined init with copy of CVarArg((uint64_t)v7, v4 + 32);
    v5 = String.init(format:_:)();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
    swift_bridgeObjectRelease();
    return v5;
  }
  else
  {
    v9._countAndFlagsBits = 0x75676F6C61746143;
    v9._object = (void *)0xE900000000000065;
    return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000030, (void *)0x8000000240AE41F0, v9);
  }
}

uint64_t static LocalizedStrings.operationNotSupportedOnCompanionTouchId(applicationName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];
  Swift::String v8;
  Swift::String v9;

  if (a2)
  {
    v7[3] = MEMORY[0x24BEE0D00];
    v7[4] = lazy protocol witness table accessor for type String and conformance String();
    v7[0] = a1;
    v7[1] = a2;
    swift_bridgeObjectRetain_n();
    v8._countAndFlagsBits = 0x75676F6C61746143;
    v8._object = (void *)0xE900000000000065;
    specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000027, (void *)0x8000000240AE41C0, v8);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_240AE1F20;
    outlined init with copy of CVarArg((uint64_t)v7, v4 + 32);
    v5 = String.init(format:_:)();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
    swift_bridgeObjectRelease();
    return v5;
  }
  else
  {
    v9._countAndFlagsBits = 0x75676F6C61746143;
    v9._object = (void *)0xE900000000000065;
    return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000031, (void *)0x8000000240AE4160, v9);
  }
}

uint64_t static LocalizedStrings.authenticationRequired.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x75676F6C61746143;
  v1._object = (void *)0xE900000000000065;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000017, (void *)0x8000000240AE41A0, v1);
}

uint64_t static LocalizedStrings.cancel.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xED00004C45434E41, v1);
}

uint64_t static LocalizedStrings.dtoUnapprovedSensor.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000240AE42C0, v1);
}

uint64_t static LocalizedStrings.dtoUnapprovedSensorTextFaceID.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000022, (void *)0x8000000240AE4310, v1);
}

uint64_t static LocalizedStrings.dtoUnapprovedSensorTextTouchID.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000023, (void *)0x8000000240AE42E0, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffWillBeAbleToUsePhone.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002ALL, (void *)0x8000000240AE4460, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffiPhoneLocationNotVisible.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002CLL, (void *)0x8000000240AE4560, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffTitleBegin.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000240AE4490, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffMessageBeginStrictMode.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002ALL, (void *)0x8000000240AE4510, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffMessageBegin.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001ELL, (void *)0x8000000240AE44B0, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffBeginSecurityDelay.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001DLL, (void *)0x8000000240AE44D0, v1);
}

uint64_t static LocalizedStrings.ratchetGracePeriodTitle.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001ALL, (void *)0x8000000240AE4590, v1);
}

uint64_t static LocalizedStrings.ratchetGracePeriodMessage.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000240AE45B0, v1);
}

uint64_t static LocalizedStrings.continue.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x435F4E4F54545542, (void *)0xEF45554E49544E4FLL, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffTitlePending.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001ELL, (void *)0x8000000240AE45D0, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffMessagePending.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000020, (void *)0x8000000240AE45F0, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffDelayTitle.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000240AE4620, v1);
}

uint64_t static LocalizedStrings.done.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x445F4E4F54545542, (void *)0xEB00000000454E4FLL, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffTitleReady.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001CLL, (void *)0x8000000240AE4640, v1);
}

uint64_t static LocalizedStrings.ratchetCoolOffLearnMore.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000001BLL, (void *)0x8000000240AE44F0, v1);
}

const char *LocalizedStrings.catalogueSuffix.unsafeMutableAddressor()
{
  return "Catalogue";
}

uint64_t static LocalizedStrings.catalogueSuffix.getter()
{
  return 0x75676F6C61746143;
}

uint64_t static LocalizedStrings.next.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(1415071054, (void *)0xE400000000000000, v1);
}

uint64_t static LocalizedStrings.ok.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x4F5F4E4F54545542, (void *)0xE90000000000004BLL, v1);
}

const char *LocalizedStrings.ratchetTable.unsafeMutableAddressor()
{
  return "Ratchet";
}

uint64_t static LocalizedStrings.ratchetTable.getter()
{
  return 0x74656863746152;
}

uint64_t static LocalizedStrings.dtoUnapprovedSensorStrictMode.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000027, (void *)0x8000000240AE4660, v1);
}

uint64_t static LocalizedStrings.dtoUnapprovedSensorStrictModeTextFaceID.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002ELL, (void *)0x8000000240AE4690, v1);
}

uint64_t static LocalizedStrings.dtoUnapprovedSensorStrictModeTextTouchID.getter()
{
  Swift::String v1;

  v1._countAndFlagsBits = 0x74656863746152;
  v1._object = (void *)0xE700000000000000;
  return specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD00000000000002FLL, (void *)0x8000000240AE46C0, v1);
}

uint64_t specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(uint64_t a1, void *a2, Swift::String a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  Swift::String v10;
  Swift::String_optional v11;
  Swift::String v12;
  uint64_t countAndFlagsBits;
  Swift::String v15;

  v5 = HIBYTE(a3._object) & 0xF;
  if (((uint64_t)a3._object & 0x2000000000000000) == 0)
    v5 = a3._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    String.append(_:)(a3);
    v6 = 45;
    v7 = 0xE100000000000000;
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  v8 = v7;
  String.append(_:)(*(Swift::String *)&v6);
  swift_bridgeObjectRelease();
  if (one-time initialization token for current != -1)
    swift_once();
  v9 = (id)static NSBundle.current;
  v15._object = (void *)0xE000000000000000;
  v10._countAndFlagsBits = a1;
  v10._object = a2;
  v11.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v11.value._object = (void *)0xEB00000000656C62;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  v15._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, v11, (NSBundle)v9, v12, v15)._countAndFlagsBits;
  swift_bridgeObjectRelease();

  return countAndFlagsBits;
}

uint64_t specialized static LocalizedStrings.ratchetCoolOffSecurityDelayDuration.getter()
{
  void *v0;
  Class isa;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  Swift::String v10;

  v0 = (void *)objc_opt_self();
  type metadata accessor for NSNumber();
  isa = NSNumber.init(integerLiteral:)(1).super.super.isa;
  v2 = objc_msgSend(v0, sel_localizedStringFromNumber_numberStyle_, isa, 1);

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;

  v9[3] = MEMORY[0x24BEE0D00];
  v9[4] = lazy protocol witness table accessor for type String and conformance String();
  v9[0] = v3;
  v9[1] = v5;
  swift_bridgeObjectRetain();
  v10._countAndFlagsBits = 0x74656863746152;
  v10._object = (void *)0xE700000000000000;
  specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000028, (void *)0x8000000240AE4750, v10);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_240AE1F20;
  outlined init with copy of CVarArg((uint64_t)v9, v6 + 32);
  v7 = String.init(format:_:)();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  swift_bridgeObjectRelease();
  return v7;
}

ValueMetadata *type metadata accessor for LocalizedStrings()
{
  return &type metadata for LocalizedStrings;
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

void LACUIAuthCountdownItemConfiguration.init(image:title:)(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  Swift::String v10;

  v7 = *a1;
  v8 = a1[1];
  v9 = *((_BYTE *)a1 + 16);
  _print_unlocked<A, B>(_:_:)();
  v10._countAndFlagsBits = 0x656C74697425;
  v10._object = (void *)0xE600000000000000;
  String.append(_:)(v10);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0xE000000000000000;
  *(_QWORD *)(a4 + 16) = v7;
  *(_QWORD *)(a4 + 24) = v8;
  *(_BYTE *)(a4 + 32) = v9;
  *(_QWORD *)(a4 + 40) = a2;
  *(_QWORD *)(a4 + 48) = a3;
}

uint64_t LACUIAuthCountdownItemConfiguration.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthCountdownItemConfiguration.image.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_BYTE *)(v1 + 32);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = v3;
  return outlined copy of LACUIAuthImageConfiguration();
}

uint64_t LACUIAuthCountdownItemConfiguration.image.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  result = outlined consume of LACUIAuthImageConfiguration();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v3;
  *(_BYTE *)(v1 + 32) = v4;
  return result;
}

uint64_t (*LACUIAuthCountdownItemConfiguration.image.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthCountdownItemConfiguration.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthCountdownItemConfiguration.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*LACUIAuthCountdownItemConfiguration.title.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t protocol witness for Identifiable.id.getter in conformance LACUIAuthCountdownItemConfiguration@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t specialized static LACUIAuthCountdownItemConfiguration.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t result;
  char v14;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_BYTE *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v9 = *(_BYTE *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
    || (v12 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v12 & 1) != 0))
  {
    if ((v4 & 1) != 0)
    {
      if ((v9 & 1) != 0)
      {
        if (v2 != v8 || v3 != v7)
          goto LABEL_14;
        goto LABEL_13;
      }
    }
    else if ((v9 & 1) == 0)
    {
      if (v2 != v8 || v3 != v7)
      {
LABEL_14:
        v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
        outlined copy of LACUIAuthImageConfiguration();
        outlined copy of LACUIAuthImageConfiguration();
        outlined consume of LACUIAuthImageConfiguration();
        outlined consume of LACUIAuthImageConfiguration();
        result = 0;
        if ((v14 & 1) == 0)
          return result;
        goto LABEL_15;
      }
LABEL_13:
      outlined copy of LACUIAuthImageConfiguration();
      outlined copy of LACUIAuthImageConfiguration();
      outlined consume of LACUIAuthImageConfiguration();
      outlined consume of LACUIAuthImageConfiguration();
LABEL_15:
      if (v5 == v10 && v6 == v11)
        return 1;
      else
        return _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    outlined copy of LACUIAuthImageConfiguration();
    outlined copy of LACUIAuthImageConfiguration();
    outlined consume of LACUIAuthImageConfiguration();
    outlined consume of LACUIAuthImageConfiguration();
    return 0;
  }
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in LACUIAuthCountdownItemConfiguration()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t initializeBufferWithCopyOfBuffer for LACUIAuthCountdownItemConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LACUIAuthCountdownItemConfiguration()
{
  swift_bridgeObjectRelease();
  outlined consume of LACUIAuthImageConfiguration();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LACUIAuthCountdownItemConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  outlined copy of LACUIAuthImageConfiguration();
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v8;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LACUIAuthCountdownItemConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_BYTE *)(a2 + 32);
  outlined copy of LACUIAuthImageConfiguration();
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  outlined consume of LACUIAuthImageConfiguration();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for LACUIAuthCountdownItemConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = v5;
  outlined consume of LACUIAuthImageConfiguration();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthCountdownItemConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LACUIAuthCountdownItemConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthCountdownItemConfiguration()
{
  return &type metadata for LACUIAuthCountdownItemConfiguration;
}

id LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.__allocating_init()()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.init()();
}

id LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  objc_super v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;

  v14._countAndFlagsBits = 0x74656863746152;
  v14._object = (void *)0xE700000000000000;
  v1 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0xD000000000000027, (void *)0x8000000240AE4660, v14);
  v3 = v2;
  if (objc_msgSend((id)objc_opt_self(), sel_deviceHasFaceID))
  {
    v4 = 0xD00000000000002ELL;
    v5 = "DTO_UNAPPROVED_SENSOR_STRICT_MODE_TEXT_FACE_ID";
  }
  else
  {
    v4 = 0xD00000000000002FLL;
    v5 = "DTO_UNAPPROVED_SENSOR_STRICT_MODE_TEXT_TOUCH_ID";
  }
  v15._countAndFlagsBits = 0x74656863746152;
  v15._object = (void *)0xE700000000000000;
  v6 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(v4, (void *)((unint64_t)(v5 - 32) | 0x8000000000000000), v15);
  v8 = v7;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v9 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x4F5F4E4F54545542, (void *)0xE90000000000004BLL, v16);
  v10 = &v0[OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration];
  *(_QWORD *)v10 = 2;
  *((_QWORD *)v10 + 1) = v1;
  *((_QWORD *)v10 + 2) = v3;
  *((_QWORD *)v10 + 3) = v6;
  *((_QWORD *)v10 + 4) = v8;
  *((_QWORD *)v10 + 5) = v9;
  *((_QWORD *)v10 + 6) = v11;
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for LACUIAlertScenePresentationHandler();
  return objc_msgSendSuper2(&v13, sel_init);
}

void LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.__allocating_init(configuration:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.init(configuration:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler()
{
  return objc_opt_self();
}

uint64_t method lookup function for LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t initializeWithCopy for LACUIAuthAction(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF)
    v4 = *(_QWORD *)(a2 + 8);
  if ((v4 + 1) <= 1 && (_DWORD)v4 == -1)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v6;
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  }
  return a1;
}

uint64_t assignWithCopy for LACUIAuthAction(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;
  unsigned int v7;
  __int128 v8;
  __int128 v9;

  if (*(_QWORD *)(a1 + 8) >= 0xFFFFFFFFuLL)
    LODWORD(v4) = -1;
  else
    v4 = *(_QWORD *)(a1 + 8);
  v5 = v4 + 1;
  v6 = *((_QWORD *)a2 + 1);
  if (v6 >= 0xFFFFFFFF)
    LODWORD(v6) = -1;
  v7 = v6 + 1;
  if (v5 > 1)
  {
    if (v7 <= 1 && (_DWORD)v6 == -1)
      goto LABEL_13;
LABEL_18:
    v8 = *a2;
    v9 = a2[1];
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    *(_OWORD *)a1 = v8;
    *(_OWORD *)(a1 + 16) = v9;
    return a1;
  }
  if (v7 > 1)
  {
    if (v5)
      goto LABEL_18;
LABEL_17:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  if (!v5)
  {
    if ((_DWORD)v6 == -1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
      *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
      return a1;
    }
    goto LABEL_17;
  }
  if ((_DWORD)v6 != -1)
    goto LABEL_18;
LABEL_13:
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LACUIAuthAction(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  __int128 v11;

  v4 = *(_QWORD *)(a1 + 8);
  LODWORD(v5) = -1;
  if (v4 >= 0xFFFFFFFF)
    v6 = -1;
  else
    v6 = v4;
  v7 = v6 + 1;
  v8 = *(_QWORD *)(a2 + 8);
  if (v8 < 0xFFFFFFFF)
    v5 = *(_QWORD *)(a2 + 8);
  if (v7 > 1)
    goto LABEL_13;
  v9 = v5 + 1;
  if (v9 > 1)
  {
    if (!v7)
      goto LABEL_12;
LABEL_13:
    v11 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v11;
    goto LABEL_14;
  }
  if (v7)
    goto LABEL_13;
  if (v9)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v8;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v10;
  swift_bridgeObjectRelease();
LABEL_14:
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthAction(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) < 2)
    LODWORD(v3) = 0;
  if (v3 >= 2)
    return (v3 - 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LACUIAuthAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_BYTE *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t getEnumTag for LACUIAuthAction(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  if ((v1 + 1) >= 2)
    return v1;
  else
    return 0;
}

double destructiveInjectEnumTag for LACUIAuthAction(uint64_t a1, unsigned int a2)
{
  double result;

  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(a1 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_DWORD *)a1 = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    *(_QWORD *)(a1 + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthAction()
{
  return &type metadata for LACUIAuthAction;
}

unint64_t destroy for LACUIAuthAction(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for LACUIAuthActionCountdown(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  __int128 v5;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    v4 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v4;
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for LACUIAuthActionCountdown(uint64_t a1, __int128 *a2)
{
  unint64_t v4;
  __int128 v5;
  __int128 v6;

  v4 = *((_QWORD *)a2 + 1);
  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
      *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
      *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
      *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    v5 = *a2;
    v6 = a2[1];
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  return a1;
}

uint64_t assignWithTake for LACUIAuthActionCountdown(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  __int128 v6;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    goto LABEL_6;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
LABEL_6:
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthActionCountdown(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LACUIAuthActionCountdown(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t getEnumTag for LACUIAuthActionCountdown(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t destructiveInjectEnumTag for LACUIAuthActionCountdown(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
  }
  else if (a2)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthActionCountdown()
{
  return &type metadata for LACUIAuthActionCountdown;
}

uint64_t LACUIAlertScenePresentationHandler.Configuration.init(requestIdentifier:title:message:dismissActionTitle:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v12;
  uint64_t v14;
  Swift::String v15;

  v12 = result;
  if (!a7)
  {
    v15._countAndFlagsBits = 0;
    v15._object = (void *)0xE000000000000000;
    result = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x4F5F4E4F54545542, (void *)0xE90000000000004BLL, v15);
    a6 = result;
    a7 = v14;
  }
  *a8 = v12;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  a8[6] = a7;
  return result;
}

id LACUIAlertScenePresentationHandler.init(configuration:)(uint64_t a1)
{
  char *v1;
  __int128 v2;
  __int128 v3;
  uint64_t v4;
  char *v5;
  objc_super v7;

  v3 = *(_OWORD *)(a1 + 16);
  v2 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = &v1[OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration];
  *(_OWORD *)v5 = *(_OWORD *)a1;
  *((_OWORD *)v5 + 1) = v3;
  *((_OWORD *)v5 + 2) = v2;
  *((_QWORD *)v5 + 6) = v4;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for LACUIAlertScenePresentationHandler();
  return objc_msgSendSuper2(&v7, sel_init);
}

Swift::Bool __swiftcall LACUIAlertScenePresentationHandler.canHandle(request:)(LACUIScenePresentationRequest request)
{
  uint64_t v1;
  id v2;
  unsigned int v3;

  v2 = -[objc_class userInterfaceRequest](request.super.isa, sel_userInterfaceRequest);
  v3 = objc_msgSend(v2, sel_identifier);

  return *(_QWORD *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration) == v3;
}

Swift::Void __swiftcall LACUIAlertScenePresentationHandler.handle(request:inContext:)(LACUIScenePresentationRequest request, LACUIScenePresentationContext inContext)
{
  _QWORD *v2;
  _QWORD *v3;
  LACUserInterfaceRequest *userInterfaceRequest;
  Class isa;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  LACUserInterfaceRequest *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  Swift::String v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  Swift::String v34;
  Swift::String aBlock;
  void (*v36)(uint64_t, void *);
  void *v37;
  uint64_t (*v38)();
  uint64_t v39;
  Swift::String v40;

  v3 = v2;
  userInterfaceRequest = request._userInterfaceRequest;
  isa = request.super.isa;
  v6 = type metadata accessor for LACLogger();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (((*(uint64_t (**)(Class))((*MEMORY[0x24BEE4EA0] & *v2) + 0x60))(isa) & 1) != 0)
  {
    v10 = *(_QWORD *)((char *)v2
                    + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                    + 8);
    v11 = *(_QWORD *)((char *)v3
                    + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                    + 16);
    v12 = *(_QWORD *)((char *)v3
                    + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                    + 24);
    v13 = *(_QWORD *)((char *)v3
                    + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                    + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14 = (void *)MEMORY[0x242687FC4](v10, v11);
    swift_bridgeObjectRelease();
    v15 = (void *)MEMORY[0x242687FC4](v12, v13);
    swift_bridgeObjectRelease();
    v16 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v14, v15, 1);

    v40._countAndFlagsBits = 0;
    v40._object = (void *)0xE000000000000000;
    v17 = specialized static LocalizedStrings.localizedString(key:value:tableSuffix:)(0x4F5F4E4F54545542, (void *)0xE90000000000004BLL, v40);
    v19 = v18;
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = userInterfaceRequest;
    v21 = userInterfaceRequest;
    v22 = (void *)MEMORY[0x242687FC4](v17, v19);
    swift_bridgeObjectRelease();
    v38 = partial apply for closure #1 in LACUIAlertScenePresentationHandler.handle(request:inContext:);
    v39 = v20;
    aBlock._countAndFlagsBits = MEMORY[0x24BDAC760];
    aBlock._object = (void *)1107296256;
    v36 = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed NSTimer) -> ();
    v37 = &block_descriptor_2;
    v23 = _Block_copy(&aBlock);
    swift_release();
    v24 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v22, 0, v23);
    _Block_release(v23);

    objc_msgSend(v16, sel_addAction_, v24);
    objc_msgSend(-[LACUserInterfaceRequest presenter](v21, sel_presenter), sel_present_animated_, v16, 1);

  }
  else
  {
    static LACLogger.ui.getter();
    aBlock._countAndFlagsBits = 0;
    aBlock._object = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(28);
    v25 = objc_msgSend(v2, sel_description);
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v28 = v27;
    swift_bridgeObjectRelease();

    aBlock._countAndFlagsBits = v26;
    aBlock._object = v28;
    v29._object = (void *)0x8000000240AE4840;
    v29._countAndFlagsBits = 0xD000000000000018;
    String.append(_:)(v29);
    v30 = -[objc_class description](isa, sel_description);
    v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v33 = v32;

    v34._countAndFlagsBits = v31;
    v34._object = v33;
    String.append(_:)(v34);
    swift_bridgeObjectRelease();
    LACLogger.error(_:)(aBlock);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    objc_msgSend(-[LACUserInterfaceRequest presenter](userInterfaceRequest, sel_presenter), sel_dismiss);
  }
  swift_unknownObjectRelease();
}

uint64_t LACUIAlertScenePresentationHandler.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (_OWORD *)(v1 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration);
  v3 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                 + 16);
  v4 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                 + 24);
  v6 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                 + 32);
  v5 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                 + 40);
  v7 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration
                 + 48);
  *(_OWORD *)a1 = *v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id LACUIAlertScenePresentationHandler.__allocating_init(configuration:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  char *v7;
  objc_super v9;

  v3 = (char *)objc_allocWithZone(v1);
  v5 = *(_OWORD *)(a1 + 16);
  v4 = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = &v3[OBJC_IVAR____TtC25LocalAuthenticationCoreUI34LACUIAlertScenePresentationHandler_configuration];
  *(_OWORD *)v7 = *(_OWORD *)a1;
  *((_OWORD *)v7 + 1) = v5;
  *((_OWORD *)v7 + 2) = v4;
  *((_QWORD *)v7 + 6) = v6;
  v9.receiver = v3;
  v9.super_class = v1;
  return objc_msgSendSuper2(&v9, sel_init);
}

id LACUIAlertScenePresentationHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void LACUIAlertScenePresentationHandler.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LACUIAlertScenePresentationHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LACUIAlertScenePresentationHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t LACUIAlertScenePresentationHandler.Configuration.requestIdentifier.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t LACUIAlertScenePresentationHandler.Configuration.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAlertScenePresentationHandler.Configuration.message.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAlertScenePresentationHandler.Configuration.dismissActionTitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for LACUIAlertScenePresentationHandler()
{
  return objc_opt_self();
}

uint64_t sub_240AD98B8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in LACUIAlertScenePresentationHandler.handle(request:inContext:)()
{
  uint64_t v0;

  objc_msgSend(objc_msgSend(*(id *)(v0 + 16), sel_presenter), sel_dismiss);
  return swift_unknownObjectRelease();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t method lookup function for LACUIAlertScenePresentationHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LACUIAlertScenePresentationHandler.__allocating_init(configuration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of LACUIAlertScenePresentationHandler.canHandle(request:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of LACUIAlertScenePresentationHandler.handle(request:inContext:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t destroy for LACUIAlertScenePresentationHandler.Configuration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LACUIAlertScenePresentationHandler.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for LACUIAlertScenePresentationHandler.Configuration(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for LACUIAlertScenePresentationHandler.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAlertScenePresentationHandler.Configuration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LACUIAlertScenePresentationHandler.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIAlertScenePresentationHandler.Configuration()
{
  return &type metadata for LACUIAlertScenePresentationHandler.Configuration;
}

void __swiftcall LACUIAuthButtonConfiguration.init(id:title:style:)(LocalAuthenticationCoreUI::LACUIAuthButtonConfiguration *__return_ptr retstr, Swift::String id, Swift::String title, LocalAuthenticationCoreUI::LACUIAuthButtonStyle style)
{
  LocalAuthenticationCoreUI::LACUIAuthButtonStyle v4;

  v4 = *(_BYTE *)style;
  retstr->id = id;
  retstr->title = title;
  retstr->style = v4;
}

BOOL static LACUIAuthButtonStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void LACUIAuthButtonStyle.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int LACUIAuthButtonStyle.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance LACUIAuthButtonStyle(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LACUIAuthButtonConfiguration.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthButtonConfiguration.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LACUIAuthButtonConfiguration.id.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUIAuthButtonConfiguration.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LACUIAuthButtonConfiguration.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*LACUIAuthButtonConfiguration.title.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

void LACUIAuthButtonConfiguration.style.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32);
}

_BYTE *LACUIAuthButtonConfiguration.style.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = *result;
  return result;
}

uint64_t (*LACUIAuthButtonConfiguration.style.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

void __swiftcall LACUIAuthButtonConfiguration.init(title:style:)(LocalAuthenticationCoreUI::LACUIAuthButtonConfiguration *__return_ptr retstr, Swift::String title, LocalAuthenticationCoreUI::LACUIAuthButtonStyle style)
{
  LocalAuthenticationCoreUI::LACUIAuthButtonStyle *v3;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  LocalAuthenticationCoreUI::LACUIAuthButtonStyle v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v3 = (LocalAuthenticationCoreUI::LACUIAuthButtonStyle *)style;
  object = title._object;
  countAndFlagsBits = title._countAndFlagsBits;
  v7 = type metadata accessor for UUID();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v3;
  UUID.init()();
  v12 = UUID.uuidString.getter();
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  retstr->id._countAndFlagsBits = v12;
  retstr->id._object = v14;
  retstr->title._countAndFlagsBits = countAndFlagsBits;
  retstr->title._object = object;
  retstr->style = v11;
}

BOOL specialized static LACUIAuthButtonConfiguration.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  char v9;
  _BOOL8 result;
  char v12;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(unsigned __int8 *)(a2 + 32);
  v8 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v8 || (v9 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v9 & 1) != 0))
  {
    if (v2 == v5 && v3 == v6)
      return v4 == v7;
    v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
    result = 0;
    if ((v12 & 1) != 0)
      return v4 == v7;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LACUIAuthButtonStyle and conformance LACUIAuthButtonStyle()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LACUIAuthButtonStyle and conformance LACUIAuthButtonStyle;
  if (!lazy protocol witness table cache variable for type LACUIAuthButtonStyle and conformance LACUIAuthButtonStyle)
  {
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUIAuthButtonStyle, &type metadata for LACUIAuthButtonStyle);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthButtonStyle and conformance LACUIAuthButtonStyle);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LACUIAuthButtonStyle(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LACUIAuthButtonStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_240AD9FDC + 4 * byte_240AE29F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_240ADA010 + 4 * asc_240AE29F0[v4]))();
}

uint64_t sub_240ADA010(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240ADA018(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240ADA020);
  return result;
}

uint64_t sub_240ADA02C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240ADA034);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_240ADA038(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240ADA040(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthButtonStyle()
{
  return &type metadata for LACUIAuthButtonStyle;
}

uint64_t destroy for LACUIAuthButtonConfiguration()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LACUIAuthButtonConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LACUIAuthButtonConfiguration(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t assignWithTake for LACUIAuthButtonConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthButtonConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LACUIAuthButtonConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LACUIAuthButtonConfiguration()
{
  return &type metadata for LACUIAuthButtonConfiguration;
}

uint64_t LACUILockView_SwiftUI.viewModel.getter()
{
  return swift_retain();
}

uint64_t LACUILockView_SwiftUI.viewModel.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*LACUILockView_SwiftUI.viewModel.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t LACUILockView_SwiftUI.$viewModel.getter()
{
  type metadata accessor for LACUILockViewModel();
  lazy protocol witness table accessor for type LACUILockViewModel and conformance LACUILockViewModel();
  return ObservedObject.projectedValue.getter();
}

unint64_t lazy protocol witness table accessor for type LACUILockViewModel and conformance LACUILockViewModel()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type LACUILockViewModel and conformance LACUILockViewModel;
  if (!lazy protocol witness table cache variable for type LACUILockViewModel and conformance LACUILockViewModel)
  {
    v1 = type metadata accessor for LACUILockViewModel();
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUILockViewModel, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUILockViewModel and conformance LACUILockViewModel);
  }
  return result;
}

uint64_t LACUILockView_SwiftUI.init(viewModel:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for LACUILockViewModel();
  lazy protocol witness table accessor for type LACUILockViewModel and conformance LACUILockViewModel();
  result = ObservedObject.init(wrappedValue:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void LACUILockView_SwiftUI.updateUIView<A>(_:context:)(void *a1)
{
  LACUILockView_SwiftUI.updateView<A>(_:context:)(a1);
}

void LACUILockView_SwiftUI.updateView<A>(_:context:)(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(uint64_t);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  id v12;

  v3 = *(_QWORD *)(v1 + 8);
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 96);
    v7 = a1;
    v8 = swift_retain();
    v9 = v6(v8);
    swift_release();
    objc_msgSend(v5, sel_setState_, v9);
    v10 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 144);
    v11 = swift_retain();
    v12 = (id)v10(v11);
    swift_release();
    objc_msgSend(v5, sel_setColor_, v12);

  }
}

id LACUILockView_SwiftUI.makeUIView(context:)()
{
  return objc_msgSend(objc_allocWithZone((Class)LACUILockView), sel_init);
}

unint64_t instantiation function for generic protocol witness table for LACUILockView_SwiftUI(uint64_t a1)
{
  unint64_t result;

  result = lazy protocol witness table accessor for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI;
  if (!lazy protocol witness table cache variable for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI)
  {
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUILockView_SwiftUI, &type metadata for LACUILockView_SwiftUI);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI;
  if (!lazy protocol witness table cache variable for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI)
  {
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUILockView_SwiftUI, &type metadata for LACUILockView_SwiftUI);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI);
  }
  return result;
}

id protocol witness for UIViewRepresentable.makeUIView(context:) in conformance LACUILockView_SwiftUI()
{
  return objc_msgSend(objc_allocWithZone((Class)LACUILockView), sel_init);
}

void protocol witness for UIViewRepresentable.updateUIView(_:context:) in conformance LACUILockView_SwiftUI(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  id v9;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 96);
  v4 = a1;
  v5 = swift_retain();
  v6 = v3(v5);
  swift_release();
  objc_msgSend(v4, sel_setState_, v6);
  v7 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 144);
  v8 = swift_retain();
  v9 = (id)v7(v8);
  swift_release();
  objc_msgSend(v4, sel_setColor_, v9);

}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance LACUILockView_SwiftUI()
{
  lazy protocol witness table accessor for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI();
  return static UIViewRepresentable._makeView(view:inputs:)();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance LACUILockView_SwiftUI()
{
  lazy protocol witness table accessor for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI();
  return static UIViewRepresentable._makeViewList(view:inputs:)();
}

void protocol witness for View.body.getter in conformance LACUILockView_SwiftUI()
{
  lazy protocol witness table accessor for type LACUILockView_SwiftUI and conformance LACUILockView_SwiftUI();
  UIViewRepresentable.body.getter();
  __break(1u);
}

uint64_t sub_240ADA6A8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_240ADA6B4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_retain();
  result = swift_release();
  *(_QWORD *)(a2 + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for LACUILockView_SwiftUI()
{
  return &type metadata for LACUILockView_SwiftUI;
}

uint64_t specialized static LACUIAuthState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unsigned int (*v16)(uint64_t, uint64_t, uint64_t);
  char v17;
  uint64_t v19;

  v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = type metadata accessor for LACUIAuthState();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (LACUIAuthState, LACUIAuthState));
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t)&v14[*(int *)(v12 + 48)];
  outlined init with copy of LACUIAuthState(a1, (uint64_t)v14);
  outlined init with copy of LACUIAuthState(a2, v15);
  v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v16((uint64_t)v14, 1, v4) != 1)
  {
    outlined init with copy of LACUIAuthState((uint64_t)v14, (uint64_t)v10);
    if (v16(v15, 1, v4) != 1)
    {
      outlined init with take of LACUIAuthCountdownConfiguration(v15, (uint64_t)v7);
      v17 = specialized static LACUIAuthCountdownConfiguration.== infix(_:_:)(v10, v7);
      outlined destroy of LACUIAuthCountdownView((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
      outlined destroy of LACUIAuthCountdownView((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
      outlined destroy of LACUIAuthCountdownView((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthState);
      return v17 & 1;
    }
    outlined destroy of LACUIAuthCountdownView((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
    goto LABEL_6;
  }
  if (v16(v15, 1, v4) != 1)
  {
LABEL_6:
    outlined destroy of (LACUIAuthState, LACUIAuthState)((uint64_t)v14);
    v17 = 0;
    return v17 & 1;
  }
  outlined destroy of LACUIAuthCountdownView((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthState);
  v17 = 1;
  return v17 & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for LACUIAuthState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  unsigned int (*v19)(_QWORD *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  void (*v29)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  char *v37;
  char *v38;
  uint64_t v39;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
    v8 = *((_QWORD *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = *a2;
      v11 = a2[1];
      v12 = *((_BYTE *)a2 + 16);
      outlined copy of LACUIAuthImageConfiguration();
      *a1 = v10;
      a1[1] = v11;
      *((_BYTE *)a1 + 16) = v12;
      v13 = a2[4];
      a1[3] = a2[3];
      a1[4] = v13;
      v14 = a2[6];
      a1[5] = a2[5];
      a1[6] = v14;
      v15 = v7[7];
      v16 = (uint64_t *)((char *)a1 + v15);
      v17 = (uint64_t *)((char *)a2 + v15);
      v18 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      v39 = *(_QWORD *)(v18 - 8);
      v19 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v39 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v19(v17, 1, v18))
      {
        v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
      }
      else
      {
        v21 = v17[1];
        *v16 = *v17;
        v16[1] = v21;
        v22 = *(int *)(v18 + 20);
        v37 = (char *)v17 + v22;
        v38 = (char *)v16 + v22;
        v23 = type metadata accessor for Date();
        v24 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16);
        swift_bridgeObjectRetain();
        v24(v38, v37, v23);
        v25 = *(int *)(v18 + 24);
        v26 = (_QWORD *)((char *)v16 + v25);
        v27 = (_QWORD *)((char *)v17 + v25);
        v28 = v27[1];
        *v26 = *v27;
        v26[1] = v28;
        v29 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v39 + 56);
        swift_bridgeObjectRetain();
        v29(v16, 0, 1, v18);
      }
      *(uint64_t *)((char *)a1 + v7[8]) = *(uint64_t *)((char *)a2 + v7[8]);
      *(uint64_t *)((char *)a1 + v7[9]) = *(uint64_t *)((char *)a2 + v7[9]);
      v30 = v7[10];
      v31 = (char *)a1 + v30;
      v32 = (char *)a2 + v30;
      v33 = *(uint64_t *)((char *)a2 + v30 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v33)
      {
        *(_QWORD *)v31 = *(_QWORD *)v32;
        *((_QWORD *)v31 + 1) = v33;
        v34 = *((_QWORD *)v32 + 3);
        *((_QWORD *)v31 + 2) = *((_QWORD *)v32 + 2);
        *((_QWORD *)v31 + 3) = v34;
        v31[32] = v32[32];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        v35 = *((_OWORD *)v32 + 1);
        *(_OWORD *)v31 = *(_OWORD *)v32;
        *((_OWORD *)v31 + 1) = v35;
        v31[32] = v32[32];
      }
      *((_BYTE *)a1 + v7[11]) = *((_BYTE *)a2 + v7[11]);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, int *))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for LACUIAuthState(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = type metadata accessor for LACUIAuthCountdownConfiguration();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    outlined consume of LACUIAuthImageConfiguration();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v4 = a1 + *(int *)(v2 + 28);
    v5 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
    {
      swift_bridgeObjectRelease();
      v6 = v4 + *(int *)(v5 + 20);
      v7 = type metadata accessor for Date();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = *(_QWORD *)(a1 + *(int *)(v2 + 40) + 8);
    if (result)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

_QWORD *initializeWithCopy for LACUIAuthState(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unsigned int (*v17)(_QWORD *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  void (*v27)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  char *v35;
  char *v36;
  uint64_t v37;

  v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = *a2;
    v9 = a2[1];
    v10 = *((_BYTE *)a2 + 16);
    outlined copy of LACUIAuthImageConfiguration();
    *a1 = v8;
    a1[1] = v9;
    *((_BYTE *)a1 + 16) = v10;
    v11 = a2[4];
    a1[3] = a2[3];
    a1[4] = v11;
    v12 = a2[6];
    a1[5] = a2[5];
    a1[6] = v12;
    v13 = v6[7];
    v14 = (_QWORD *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    v37 = *(_QWORD *)(v16 - 8);
    v17 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v37 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v17(v15, 1, v16))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v19 = v15[1];
      *v14 = *v15;
      v14[1] = v19;
      v20 = *(int *)(v16 + 20);
      v35 = (char *)v15 + v20;
      v36 = (char *)v14 + v20;
      v21 = type metadata accessor for Date();
      v22 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
      swift_bridgeObjectRetain();
      v22(v36, v35, v21);
      v23 = *(int *)(v16 + 24);
      v24 = (_QWORD *)((char *)v14 + v23);
      v25 = (_QWORD *)((char *)v15 + v23);
      v26 = v25[1];
      *v24 = *v25;
      v24[1] = v26;
      v27 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v37 + 56);
      swift_bridgeObjectRetain();
      v27(v14, 0, 1, v16);
    }
    *(_QWORD *)((char *)a1 + v6[8]) = *(uint64_t *)((char *)a2 + v6[8]);
    *(_QWORD *)((char *)a1 + v6[9]) = *(uint64_t *)((char *)a2 + v6[9]);
    v28 = v6[10];
    v29 = (char *)a1 + v28;
    v30 = (char *)a2 + v28;
    v31 = *(uint64_t *)((char *)a2 + v28 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v31)
    {
      *(_QWORD *)v29 = *(_QWORD *)v30;
      *((_QWORD *)v29 + 1) = v31;
      v32 = *((_QWORD *)v30 + 3);
      *((_QWORD *)v29 + 2) = *((_QWORD *)v30 + 2);
      *((_QWORD *)v29 + 3) = v32;
      v29[32] = v30[32];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v33 = *((_OWORD *)v30 + 1);
      *(_OWORD *)v29 = *(_OWORD *)v30;
      *((_OWORD *)v29 + 1) = v33;
      v29[32] = v30[32];
    }
    *((_BYTE *)a1 + v6[11]) = *((_BYTE *)a2 + v6[11]);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

uint64_t assignWithCopy for LACUIAuthState(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, int *);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  unsigned int (*v18)(_QWORD *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(_QWORD *, uint64_t, uint64_t);
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  void (*v37)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  void (*v44)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  __int128 *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 *v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  __int128 v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  __int128 v66;
  __int128 v67;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;

  v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8((uint64_t)a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      v11 = *a2;
      v12 = a2[1];
      v13 = *((_BYTE *)a2 + 16);
      outlined copy of LACUIAuthImageConfiguration();
      *(_QWORD *)a1 = v11;
      *(_QWORD *)(a1 + 8) = v12;
      *(_BYTE *)(a1 + 16) = v13;
      *(_QWORD *)(a1 + 24) = a2[3];
      *(_QWORD *)(a1 + 32) = a2[4];
      *(_QWORD *)(a1 + 40) = a2[5];
      *(_QWORD *)(a1 + 48) = a2[6];
      v14 = v6[7];
      v15 = (_QWORD *)(a1 + v14);
      v16 = (uint64_t *)((char *)a2 + v14);
      v17 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
      v72 = *(_QWORD *)(v17 - 8);
      v18 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v72 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v18(v16, 1, v17))
      {
        v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
        memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        *v15 = *v16;
        v15[1] = v16[1];
        v38 = *(int *)(v17 + 20);
        v69 = (char *)v16 + v38;
        v71 = (char *)v15 + v38;
        v39 = type metadata accessor for Date();
        v40 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 16);
        swift_bridgeObjectRetain();
        v40(v71, v69, v39);
        v41 = *(int *)(v17 + 24);
        v42 = (_QWORD *)((char *)v15 + v41);
        v43 = (_QWORD *)((char *)v16 + v41);
        *v42 = *v43;
        v42[1] = v43[1];
        v44 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v72 + 56);
        swift_bridgeObjectRetain();
        v44(v15, 0, 1, v17);
      }
      *(_QWORD *)(a1 + v6[8]) = *(uint64_t *)((char *)a2 + v6[8]);
      *(_QWORD *)(a1 + v6[9]) = *(uint64_t *)((char *)a2 + v6[9]);
      v45 = v6[10];
      v46 = a1 + v45;
      v47 = (__int128 *)((char *)a2 + v45);
      v48 = *(uint64_t *)((char *)a2 + v45 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v48)
      {
        *(_QWORD *)v46 = *(_QWORD *)v47;
        *(_QWORD *)(v46 + 8) = *((_QWORD *)v47 + 1);
        *(_QWORD *)(v46 + 16) = *((_QWORD *)v47 + 2);
        *(_QWORD *)(v46 + 24) = *((_QWORD *)v47 + 3);
        *(_BYTE *)(v46 + 32) = *((_BYTE *)v47 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        v49 = *v47;
        v50 = v47[1];
        *(_BYTE *)(v46 + 32) = *((_BYTE *)v47 + 32);
        *(_OWORD *)v46 = v49;
        *(_OWORD *)(v46 + 16) = v50;
      }
      *(_BYTE *)(a1 + v6[11]) = *((_BYTE *)a2 + v6[11]);
      (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
      return a1;
    }
LABEL_7:
    memcpy((void *)a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  if (v10)
  {
    outlined destroy of LACUIAuthCountdownView(a1, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
    goto LABEL_7;
  }
  v20 = *a2;
  v21 = a2[1];
  v22 = *((_BYTE *)a2 + 16);
  outlined copy of LACUIAuthImageConfiguration();
  *(_QWORD *)a1 = v20;
  *(_QWORD *)(a1 + 8) = v21;
  *(_BYTE *)(a1 + 16) = v22;
  outlined consume of LACUIAuthImageConfiguration();
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23 = v6[7];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (uint64_t *)((char *)a2 + v23);
  v26 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v27 + 48);
  v29 = v28(v24, 1, v26);
  v30 = v28(v25, 1, v26);
  if (!v29)
  {
    if (!v30)
    {
      *v24 = *v25;
      v24[1] = v25[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v59 = *(int *)(v26 + 20);
      v60 = (char *)v24 + v59;
      v61 = (char *)v25 + v59;
      v62 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v62 - 8) + 24))(v60, v61, v62);
      v63 = *(int *)(v26 + 24);
      v64 = (_QWORD *)((char *)v24 + v63);
      v65 = (_QWORD *)((char *)v25 + v63);
      *v64 = *v65;
      v64[1] = v65[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    outlined destroy of LACUIAuthCountdownView((uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
    goto LABEL_18;
  }
  if (v30)
  {
LABEL_18:
    v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
    goto LABEL_19;
  }
  *v24 = *v25;
  v24[1] = v25[1];
  v31 = *(int *)(v26 + 20);
  v70 = (char *)v25 + v31;
  v73 = (char *)v24 + v31;
  v32 = type metadata accessor for Date();
  v33 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16);
  swift_bridgeObjectRetain();
  v33(v73, v70, v32);
  v34 = *(int *)(v26 + 24);
  v35 = (_QWORD *)((char *)v24 + v34);
  v36 = (_QWORD *)((char *)v25 + v34);
  *v35 = *v36;
  v35[1] = v36[1];
  v37 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v27 + 56);
  swift_bridgeObjectRetain();
  v37(v24, 0, 1, v26);
LABEL_19:
  *(_QWORD *)(a1 + v6[8]) = *(uint64_t *)((char *)a2 + v6[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + v6[9]) = *(uint64_t *)((char *)a2 + v6[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v52 = v6[10];
  v53 = a1 + v52;
  v54 = (__int128 *)((char *)a2 + v52);
  v55 = *(_QWORD *)(a1 + v52 + 8);
  v56 = *(uint64_t *)((char *)a2 + v52 + 8);
  if (v55)
  {
    if (v56)
    {
      *(_QWORD *)v53 = *(_QWORD *)v54;
      *(_QWORD *)(v53 + 8) = *((_QWORD *)v54 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v53 + 16) = *((_QWORD *)v54 + 2);
      *(_QWORD *)(v53 + 24) = *((_QWORD *)v54 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(v53 + 32) = *((_BYTE *)v54 + 32);
    }
    else
    {
      outlined destroy of LACUIAuthButtonConfiguration(v53);
      v57 = *((_BYTE *)v54 + 32);
      v58 = v54[1];
      *(_OWORD *)v53 = *v54;
      *(_OWORD *)(v53 + 16) = v58;
      *(_BYTE *)(v53 + 32) = v57;
    }
  }
  else if (v56)
  {
    *(_QWORD *)v53 = *(_QWORD *)v54;
    *(_QWORD *)(v53 + 8) = *((_QWORD *)v54 + 1);
    *(_QWORD *)(v53 + 16) = *((_QWORD *)v54 + 2);
    *(_QWORD *)(v53 + 24) = *((_QWORD *)v54 + 3);
    *(_BYTE *)(v53 + 32) = *((_BYTE *)v54 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v66 = *v54;
    v67 = v54[1];
    *(_BYTE *)(v53 + 32) = *((_BYTE *)v54 + 32);
    *(_OWORD *)v53 = v66;
    *(_OWORD *)(v53 + 16) = v67;
  }
  *(_BYTE *)(a1 + v6[11]) = *((_BYTE *)a2 + v6[11]);
  return a1;
}

_OWORD *initializeWithTake for LACUIAuthState(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  __int128 v21;

  v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
    *(_OWORD *)((char *)a1 + 24) = *(_OWORD *)((char *)a2 + 24);
    *(_OWORD *)((char *)a1 + 40) = *(_OWORD *)((char *)a2 + 40);
    v8 = v6[7];
    v9 = (_OWORD *)((char *)a1 + v8);
    v10 = (_OWORD *)((char *)a2 + v8);
    v11 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      *v9 = *v10;
      v14 = *(int *)(v11 + 20);
      v15 = (char *)v9 + v14;
      v16 = (char *)v10 + v14;
      v17 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
      *(_OWORD *)((char *)v9 + *(int *)(v11 + 24)) = *(_OWORD *)((char *)v10 + *(int *)(v11 + 24));
      (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *(_QWORD *)((char *)a1 + v6[8]) = *(_QWORD *)((char *)a2 + v6[8]);
    *(_QWORD *)((char *)a1 + v6[9]) = *(_QWORD *)((char *)a2 + v6[9]);
    v18 = v6[10];
    v19 = (char *)a1 + v18;
    v20 = (char *)a2 + v18;
    v19[32] = v20[32];
    v21 = *((_OWORD *)v20 + 1);
    *(_OWORD *)v19 = *(_OWORD *)v20;
    *((_OWORD *)v19 + 1) = v21;
    *((_BYTE *)a1 + v6[11]) = *((_BYTE *)a2 + v6[11]);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

uint64_t assignWithTake for LACUIAuthState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, int *);
  int v9;
  int v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD *, uint64_t, uint64_t);
  int v26;
  int v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;

  v6 = (int *)type metadata accessor for LACUIAuthCountdownConfiguration();
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      outlined destroy of LACUIAuthCountdownView(a1, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
      goto LABEL_7;
    }
    v17 = *(_BYTE *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_BYTE *)(a1 + 16) = v17;
    outlined consume of LACUIAuthImageConfiguration();
    v18 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = v18;
    swift_bridgeObjectRelease();
    v19 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = v19;
    swift_bridgeObjectRelease();
    v20 = v6[7];
    v21 = (_QWORD *)(a1 + v20);
    v22 = (_QWORD *)(a2 + v20);
    v23 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
    v24 = *(_QWORD *)(v23 - 8);
    v25 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v24 + 48);
    v26 = v25(v21, 1, v23);
    v27 = v25(v22, 1, v23);
    if (v26)
    {
      if (!v27)
      {
        *(_OWORD *)v21 = *(_OWORD *)v22;
        v28 = *(int *)(v23 + 20);
        v29 = (char *)v21 + v28;
        v30 = (char *)v22 + v28;
        v31 = type metadata accessor for Date();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
        *(_OWORD *)((char *)v21 + *(int *)(v23 + 24)) = *(_OWORD *)((char *)v22 + *(int *)(v23 + 24));
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
        goto LABEL_16;
      }
    }
    else
    {
      if (!v27)
      {
        v48 = v22[1];
        *v21 = *v22;
        v21[1] = v48;
        swift_bridgeObjectRelease();
        v49 = *(int *)(v23 + 20);
        v50 = (char *)v21 + v49;
        v51 = (char *)v22 + v49;
        v52 = type metadata accessor for Date();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 40))(v50, v51, v52);
        v53 = *(int *)(v23 + 24);
        v54 = (_QWORD *)((char *)v21 + v53);
        v55 = (_QWORD *)((char *)v22 + v53);
        v57 = *v55;
        v56 = v55[1];
        *v54 = v57;
        v54[1] = v56;
        swift_bridgeObjectRelease();
LABEL_16:
        *(_QWORD *)(a1 + v6[8]) = *(_QWORD *)(a2 + v6[8]);
        swift_bridgeObjectRelease();
        *(_QWORD *)(a1 + v6[9]) = *(_QWORD *)(a2 + v6[9]);
        swift_bridgeObjectRelease();
        v41 = v6[10];
        v42 = a1 + v41;
        v43 = a2 + v41;
        if (*(_QWORD *)(a1 + v41 + 8))
        {
          v44 = *(_QWORD *)(v43 + 8);
          if (v44)
          {
            *(_QWORD *)v42 = *(_QWORD *)v43;
            *(_QWORD *)(v42 + 8) = v44;
            swift_bridgeObjectRelease();
            v45 = *(_QWORD *)(v43 + 24);
            *(_QWORD *)(v42 + 16) = *(_QWORD *)(v43 + 16);
            *(_QWORD *)(v42 + 24) = v45;
            swift_bridgeObjectRelease();
LABEL_21:
            *(_BYTE *)(v42 + 32) = *(_BYTE *)(v43 + 32);
            *(_BYTE *)(a1 + v6[11]) = *(_BYTE *)(a2 + v6[11]);
            return a1;
          }
          outlined destroy of LACUIAuthButtonConfiguration(v42);
        }
        v46 = *(_OWORD *)(v43 + 16);
        *(_OWORD *)v42 = *(_OWORD *)v43;
        *(_OWORD *)(v42 + 16) = v46;
        goto LABEL_21;
      }
      outlined destroy of LACUIAuthCountdownView((uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownDelayConfiguration);
    }
    v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
    goto LABEL_16;
  }
  if (v10)
  {
LABEL_7:
    memcpy((void *)a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v11 = v6[7];
  v12 = (_OWORD *)(a1 + v11);
  v13 = (_OWORD *)(a2 + v11);
  v14 = type metadata accessor for LACUIAuthCountdownDelayConfiguration();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LACUIAuthCountdownDelayConfiguration?);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    *v12 = *v13;
    v32 = *(int *)(v14 + 20);
    v33 = (char *)v12 + v32;
    v34 = (char *)v13 + v32;
    v35 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 32))(v33, v34, v35);
    *(_OWORD *)((char *)v12 + *(int *)(v14 + 24)) = *(_OWORD *)((char *)v13 + *(int *)(v14 + 24));
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  *(_QWORD *)(a1 + v6[8]) = *(_QWORD *)(a2 + v6[8]);
  *(_QWORD *)(a1 + v6[9]) = *(_QWORD *)(a2 + v6[9]);
  v36 = v6[10];
  v37 = a1 + v36;
  v38 = a2 + v36;
  *(_BYTE *)(v37 + 32) = *(_BYTE *)(v38 + 32);
  v39 = *(_OWORD *)(v38 + 16);
  *(_OWORD *)v37 = *(_OWORD *)v38;
  *(_OWORD *)(v37 + 16) = v39;
  *(_BYTE *)(a1 + v6[11]) = *(_BYTE *)(a2 + v6[11]);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LACUIAuthState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240ADB9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LACUIAuthState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240ADBA20(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = type metadata accessor for LACUIAuthCountdownConfiguration();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t getEnumTag for LACUIAuthState(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LACUIAuthCountdownConfiguration();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t destructiveInjectEnumTag for LACUIAuthState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t type metadata accessor for LACUIAuthState()
{
  uint64_t result;

  result = type metadata singleton initialization cache for LACUIAuthState;
  if (!type metadata singleton initialization cache for LACUIAuthState)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for LACUIAuthState()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LACUIAuthCountdownConfiguration();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t outlined destroy of (LACUIAuthState, LACUIAuthState)(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (LACUIAuthState, LACUIAuthState));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static ViewBuilder.buildEither<A, B>(first:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = type metadata accessor for _ConditionalContent.Storage();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return _ConditionalContent<>.init(storage:)();
}

uint64_t static ViewBuilder.buildEither<A, B>(second:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = type metadata accessor for _ConditionalContent.Storage();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return _ConditionalContent<>.init(storage:)();
}

uint64_t DynamicStack.init(spacing:content:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t *v7;

  *(_QWORD *)a7 = a1;
  *(_BYTE *)(a7 + 8) = a2 & 1;
  *(_QWORD *)(a7 + 16) = a3;
  *(_QWORD *)(a7 + 24) = a4;
  v7 = (uint64_t *)(a7 + *(int *)(type metadata accessor for DynamicStack(0, a5, a6, a4) + 40));
  *v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata accessor for DynamicStack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DynamicStack);
}

uint64_t DynamicStack.spacing.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t DynamicStack.spacing.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*DynamicStack.spacing.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t DynamicStack.content.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t DynamicStack.content.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*DynamicStack.content.modify())()
{
  return destructiveProjectEnumData for LACUIRatchetViewModelPresentationStyle;
}

uint64_t DynamicStack.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  void (*v19)(char *, uint64_t);
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v22 = a2;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = type metadata accessor for VStack();
  v6 = type metadata accessor for HStack();
  v7 = type metadata accessor for _ConditionalContent();
  v8 = type metadata accessor for Group();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21 - v13;
  v23 = v3;
  v24 = v4;
  v25 = v2;
  v15 = MEMORY[0x242688798](MEMORY[0x24BDF4700], v5);
  v16 = MEMORY[0x242688798](MEMORY[0x24BDF4498], v6);
  v27[0] = v15;
  v27[1] = v16;
  v17 = MEMORY[0x242688798](MEMORY[0x24BDEF3E0], v7, v27);
  Group<A>.init(content:)();
  v26 = v17;
  MEMORY[0x242688798](MEMORY[0x24BDF3F50], v8, &v26);
  v18 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v18(v14, v12, v8);
  v19 = *(void (**)(char *, uint64_t))(v9 + 8);
  v19(v12, v8);
  v18(v22, v14, v8);
  return ((uint64_t (*)(char *, uint64_t))v19)(v14, v8);
}

uint64_t closure #1 in DynamicStack.body.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  char *v26;
  void (*v27)(char *, char *, uint64_t);
  void (*v28)(char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, uint64_t, uint64_t);
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[2];

  v51 = a3;
  v5 = type metadata accessor for HStack();
  v43 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v45 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)&v40 - v8;
  v9 = type metadata accessor for VStack();
  v41 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v42 = (char *)&v40 - v13;
  v14 = type metadata accessor for DynamicTypeSize();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v40 - v19;
  v21 = type metadata accessor for _ConditionalContent();
  v49 = *(_QWORD *)(v21 - 8);
  v50 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v47 = a2;
  v48 = (char *)&v40 - v22;
  v46 = a1;
  type metadata accessor for DynamicStack(0, a1, a2, v23);
  specialized Environment.wrappedValue.getter((uint64_t)v20);
  (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v18, *MEMORY[0x24BDECF38], v14);
  lazy protocol witness table accessor for type DynamicTypeSize and conformance DynamicTypeSize();
  LOBYTE(a1) = dispatch thunk of static Comparable.< infix(_:_:)();
  v24 = *(void (**)(char *, uint64_t))(v15 + 8);
  v24(v18, v14);
  v24(v20, v14);
  if ((a1 & 1) != 0)
  {
    static HorizontalAlignment.center.getter();
    VStack.init(alignment:spacing:content:)();
    MEMORY[0x242688798](MEMORY[0x24BDF4700], v9);
    v25 = v41;
    v26 = v42;
    v27 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
    v27(v42, v12, v9);
    v28 = *(void (**)(char *, uint64_t))(v25 + 8);
    v28(v12, v9);
    v27(v12, v26, v9);
    MEMORY[0x242688798](MEMORY[0x24BDF4498], v5);
    v29 = v48;
    static ViewBuilder.buildEither<A, B>(first:)((uint64_t)v12, v9);
    v28(v12, v9);
    v28(v26, v9);
  }
  else
  {
    static VerticalAlignment.center.getter();
    v30 = (uint64_t)v45;
    HStack.init(alignment:spacing:content:)();
    MEMORY[0x242688798](MEMORY[0x24BDF4498], v5);
    v31 = v43;
    v32 = v44;
    v33 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 16);
    v33(v44, v30, v5);
    v34 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    v34(v30, v5);
    v33((char *)v30, (uint64_t)v32, v5);
    MEMORY[0x242688798](MEMORY[0x24BDF4700], v9);
    v29 = v48;
    static ViewBuilder.buildEither<A, B>(second:)(v30, v9, v5);
    v34(v30, v5);
    v34((uint64_t)v32, v5);
  }
  v35 = MEMORY[0x242688798](MEMORY[0x24BDF4700], v9);
  v36 = MEMORY[0x242688798](MEMORY[0x24BDF4498], v5);
  v52[0] = v35;
  v52[1] = v36;
  v37 = v50;
  MEMORY[0x242688798](MEMORY[0x24BDEF3E0], v50, v52);
  v38 = v49;
  (*(void (**)(uint64_t, char *, uint64_t))(v49 + 16))(v51, v29, v37);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v29, v37);
}

uint64_t key path getter for EnvironmentValues.dynamicTypeSize : EnvironmentValues()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_240ADC418()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t key path setter for EnvironmentValues.dynamicTypeSize : EnvironmentValues(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = type metadata accessor for DynamicTypeSize();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t partial apply for closure #1 in DynamicStack.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return closure #1 in DynamicStack.body.getter(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t associated type witness table accessor for View.Body : View in DynamicStack<A>()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata instantiation function for DynamicStack()
{
  return swift_allocateGenericValueMetadata();
}

void type metadata completion function for DynamicStack()
{
  unint64_t v0;

  type metadata accessor for Environment<DynamicTypeSize>.Content();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *initializeBufferWithCopyOfBuffer for DynamicStack(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v5 = a2[3];
    v3[2] = a2[2];
    v3[3] = v5;
    v6 = *(int *)(a3 + 40);
    v7 = (_QWORD *)((char *)v3 + v6);
    v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t destroy for DynamicStack(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = type metadata accessor for DynamicTypeSize();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for DynamicStack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(int *)(a3 + 40);
  v6 = (_QWORD *)(a1 + v5);
  v7 = (_QWORD *)(a2 + v5);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    *v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for DynamicStack(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v6 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v6;
  v7 = a2[3];
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v7;
  swift_retain();
  swift_release();
  if ((uint64_t *)a1 != a2)
  {
    v8 = *(int *)(a3 + 40);
    v9 = (_QWORD *)(a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    outlined destroy of Environment<DynamicTypeSize>.Content(a1 + v8);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t outlined destroy of Environment<DynamicTypeSize>.Content(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for DynamicStack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 40);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for DynamicStack(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 40);
    v7 = (void *)(a1 + v6);
    v8 = (const void *)(a2 + v6);
    outlined destroy of Environment<DynamicTypeSize>.Content(a1 + v6);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicStack()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240ADCA58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for DynamicStack()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240ADCAE4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

void type metadata accessor for Environment<DynamicTypeSize>.Content()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Environment<DynamicTypeSize>.Content)
  {
    type metadata accessor for DynamicTypeSize();
    v0 = type metadata accessor for Environment.Content();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  }
}

uint64_t sub_240ADCBB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD v6[2];

  v0 = type metadata accessor for VStack();
  v1 = type metadata accessor for HStack();
  v2 = type metadata accessor for _ConditionalContent();
  v3 = type metadata accessor for Group();
  v6[0] = MEMORY[0x242688798](MEMORY[0x24BDF4700], v0);
  v6[1] = MEMORY[0x242688798](MEMORY[0x24BDF4498], v1);
  v5 = MEMORY[0x242688798](MEMORY[0x24BDEF3E0], v2, v6);
  return MEMORY[0x242688798](MEMORY[0x24BDF3F50], v3, &v5);
}

unint64_t lazy protocol witness table accessor for type DynamicTypeSize and conformance DynamicTypeSize()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type DynamicTypeSize and conformance DynamicTypeSize;
  if (!lazy protocol witness table cache variable for type DynamicTypeSize and conformance DynamicTypeSize)
  {
    v1 = type metadata accessor for DynamicTypeSize();
    result = MEMORY[0x242688798](MEMORY[0x24BDECF70], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DynamicTypeSize and conformance DynamicTypeSize);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24268872C](a1, v6, a5);
}

__n128 LACUIAuthCountdownItemView.init(configuration:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unint64_t v2;
  unsigned __int8 v3;
  unint64_t v4;
  unint64_t v5;
  __n128 result;

  v2 = a1->n128_u64[1];
  v3 = a1[2].n128_u8[0];
  v4 = a1[2].n128_u64[1];
  v5 = a1[3].n128_u64[0];
  a2->n128_u64[0] = a1->n128_u64[0];
  a2->n128_u64[1] = v2;
  result = a1[1];
  a2[1] = result;
  a2[2].n128_u8[0] = v3;
  a2[2].n128_u64[1] = v4;
  a2[3].n128_u64[0] = v5;
  return result;
}

uint64_t LACUIAuthCountdownItemView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *v1;
  v2 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  v6 = *((_BYTE *)v1 + 32);
  v7 = v1[5];
  v8 = v1[6];
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  swift_bridgeObjectRetain();
  outlined copy of LACUIAuthImageConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t LACUIAuthCountdownItemView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t *v11;
  _OWORD v13[3];
  uint64_t v14;

  v1 = type metadata accessor for AccessibilityChildBehavior();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_OWORD *)(v0 + 16);
  v13[0] = *(_OWORD *)v0;
  v13[1] = v8;
  v13[2] = *(_OWORD *)(v0 + 32);
  v14 = *(_QWORD *)(v0 + 48);
  v9 = swift_allocObject();
  v10 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v9 + 32) = v10;
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v9 + 64) = *(_QWORD *)(v0 + 48);
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  *((_QWORD *)v7 + 2) = partial apply for closure #1 in LACUIAuthCountdownItemView.body.getter;
  *((_QWORD *)v7 + 3) = v9;
  v11 = (uint64_t *)&v7[*(int *)(v5 + 40)];
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  swift_storeEnumTagMultiPayload();
  outlined retain of LACUIAuthCountdownItemView((uint64_t)v13);
  static AccessibilityChildBehavior.combine.getter();
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>> and conformance DynamicStack<A>, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>, (uint64_t)&protocol conformance descriptor for DynamicStack<A>);
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v7, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>);
}

uint64_t closure #1 in LACUIAuthCountdownItemView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  char *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;

  v63 = a2;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
  MEMORY[0x24BDAC7A8](v56);
  v4 = (uint64_t *)((char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymbolRenderingMode?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
  MEMORY[0x24BDAC7A8](v53);
  v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>);
  MEMORY[0x24BDAC7A8](v54);
  v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>);
  MEMORY[0x24BDAC7A8](v55);
  v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>);
  MEMORY[0x24BDAC7A8](v58);
  v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v62 = (uint64_t)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v57 = (char *)&v53 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v61 = (uint64_t)&v53 - v21;
  v22 = *(_BYTE *)(a1 + 32);
  v60 = *(_QWORD *)(a1 + 40);
  v59 = *(_QWORD *)(a1 + 48);
  if ((v22 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v25 = Image.init(systemName:)();
  }
  else
  {
    v23 = one-time initialization token for current;
    swift_bridgeObjectRetain_n();
    if (v23 != -1)
      swift_once();
    v24 = (id)static NSBundle.current;
    v25 = Image.init(_:bundle:)();
    outlined consume of LACUIAuthImageConfiguration();
  }
  static SymbolRenderingMode.monochrome.getter();
  v26 = type metadata accessor for SymbolRenderingMode();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v7, 0, 1, v26);
  KeyPath = swift_getKeyPath();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v7, (uint64_t)v4 + *(int *)(v56 + 28), &demangling cache variable for type metadata for SymbolRenderingMode?);
  *v4 = KeyPath;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v4, (uint64_t)&v9[*(int *)(v53 + 36)], &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
  *(_QWORD *)v9 = v25;
  *((_QWORD *)v9 + 1) = 0;
  *((_WORD *)v9 + 8) = 1;
  swift_retain();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v4, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<SymbolRenderingMode?>);
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v7, &demangling cache variable for type metadata for SymbolRenderingMode?);
  swift_release();
  v28 = static Color.blue.getter();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v9, (uint64_t)v11, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
  *(_QWORD *)&v11[*(int *)(v54 + 36)] = v28;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v9, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>);
  v29 = static Font.title.getter();
  v30 = swift_getKeyPath();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v11, (uint64_t)v13, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>);
  v31 = (uint64_t *)&v13[*(int *)(v55 + 36)];
  *v31 = v30;
  v31[1] = v29;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v11, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>);
  static Alignment.center.getter();
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>((uint64_t)v13, (uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>);
  v32 = &v15[*(int *)(v58 + 36)];
  v33 = v69;
  *((_OWORD *)v32 + 4) = v68;
  *((_OWORD *)v32 + 5) = v33;
  *((_OWORD *)v32 + 6) = v70;
  v34 = v65;
  *(_OWORD *)v32 = v64;
  *((_OWORD *)v32 + 1) = v34;
  v35 = v67;
  *((_OWORD *)v32 + 2) = v66;
  *((_OWORD *)v32 + 3) = v35;
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v13, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>);
  lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>();
  v36 = (uint64_t)v57;
  View.accessibilityHidden(_:)();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>);
  v37 = v61;
  outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>(v36, v61);
  v38 = swift_getKeyPath();
  v39 = v59;
  swift_bridgeObjectRetain();
  LOBYTE(v30) = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v48 = v62;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v37, v62, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>);
  v49 = v63;
  outlined init with copy of ModifiedContent<DynamicStack<TupleView<(ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, Spacer, TimelineView<PeriodicTimelineSchedule, ModifiedContent<Text, AccessibilityAttachmentModifier>>)>>, _FlexFrameLayout>(v48, v63, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>);
  v50 = v49
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>))
               + 48);
  v51 = v60;
  *(_QWORD *)v50 = v60;
  *(_QWORD *)(v50 + 8) = v39;
  *(_BYTE *)(v50 + 16) = 0;
  *(_QWORD *)(v50 + 24) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v50 + 32) = v38;
  *(_BYTE *)(v50 + 40) = 0;
  *(_BYTE *)(v50 + 48) = v30;
  *(_QWORD *)(v50 + 56) = v41;
  *(_QWORD *)(v50 + 64) = v43;
  *(_QWORD *)(v50 + 72) = v45;
  *(_QWORD *)(v50 + 80) = v47;
  *(_BYTE *)(v50 + 88) = 0;
  outlined copy of Text.Storage(v51, v39, 0);
  swift_bridgeObjectRetain();
  swift_retain();
  outlined destroy of LACUIAuthCountdownDelayConfiguration?(v37, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>);
  outlined consume of Text.Storage(v51, v39, 0);
  swift_release();
  swift_bridgeObjectRelease();
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?(v48, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>);
}

uint64_t partial apply for closure #1 in LACUIAuthCountdownItemView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return closure #1 in LACUIAuthCountdownItemView.body.getter(v1 + 16, a1);
}

uint64_t outlined retain of LACUIAuthCountdownItemView(uint64_t a1)
{
  swift_bridgeObjectRetain();
  outlined copy of LACUIAuthImageConfiguration();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t associated type witness table accessor for View.Body : View in LACUIAuthCountdownItemView()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t protocol witness for View.body.getter in conformance LACUIAuthCountdownItemView()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t *v11;
  _OWORD v13[3];
  uint64_t v14;

  v1 = type metadata accessor for AccessibilityChildBehavior();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_OWORD *)(v0 + 16);
  v13[0] = *(_OWORD *)v0;
  v13[1] = v8;
  v13[2] = *(_OWORD *)(v0 + 32);
  v14 = *(_QWORD *)(v0 + 48);
  v9 = swift_allocObject();
  v10 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v9 + 32) = v10;
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v9 + 64) = *(_QWORD *)(v0 + 48);
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  *((_QWORD *)v7 + 2) = closure #1 in LACUIAuthCountdownItemView.body.getterpartial apply;
  *((_QWORD *)v7 + 3) = v9;
  v11 = (uint64_t *)&v7[*(int *)(v5 + 40)];
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
  swift_storeEnumTagMultiPayload();
  outlined retain of LACUIAuthCountdownItemView((uint64_t)v13);
  static AccessibilityChildBehavior.combine.getter();
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>> and conformance DynamicStack<A>, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>, (uint64_t)&protocol conformance descriptor for DynamicStack<A>);
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return outlined destroy of LACUIAuthCountdownDelayConfiguration?((uint64_t)v7, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>);
}

ValueMetadata *type metadata accessor for LACUIAuthCountdownItemView()
{
  return &type metadata for LACUIAuthCountdownItemView;
}

uint64_t sub_240ADD770()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>);
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>> and conformance DynamicStack<A>, &demangling cache variable for type metadata for DynamicStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>, ModifiedContent<ModifiedContent<Text, _EnvironmentKeyWritingModifier<TextAlignment>>, _PaddingLayout>)>>, (uint64_t)&protocol conformance descriptor for DynamicStack<A>);
  return swift_getOpaqueTypeConformance2();
}

uint64_t objectdestroyTm_2()
{
  swift_bridgeObjectRelease();
  outlined consume of LACUIAuthImageConfiguration();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t key path getter for EnvironmentValues.multilineTextAlignment : EnvironmentValues, serialized@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t key path setter for EnvironmentValues.multilineTextAlignment : EnvironmentValues, serialized()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_240ADD864@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_240ADD88C()
{
  swift_retain();
  return EnvironmentValues.font.setter();
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<Font?> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Font?>, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _ForegroundStyleModifier<Color> and conformance _ForegroundStyleModifier<A>, &demangling cache variable for type metadata for _ForegroundStyleModifier<Color>, MEMORY[0x24BDF0710]);
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<Image, _AspectRatioLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<Image, _AspectRatioLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<Image, _AspectRatioLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<Image, _AspectRatioLayout>);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Image, _AspectRatioLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Image, _AspectRatioLayout>, _EnvironmentKeyWritingModifier<SymbolRenderingMode?>>, _ForegroundStyleModifier<Color>>, _EnvironmentKeyWritingModifier<Font?>>, _FlexFrameLayout>, AccessibilityAttachmentModifier>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_240ADDAD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_240ADDAFC()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t LACUIDTOViewController.__allocating_init(configuration:handler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v7 = type metadata accessor for LACUIAuthCountdownConfiguration();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for LACUIAuthCountdownView();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (uint64_t *)((char *)&v20 - v14);
  v16 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v16[direct field offset for LACUIDTOViewController.handler + 8] = 0;
  swift_unknownObjectWeakInit();
  outlined init with copy of LACUIAuthCountdownConfiguration(a1, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
  type metadata accessor for LACUIAuthCountdownViewModel();
  swift_allocObject();
  swift_unknownObjectRetain();
  LACUIAuthCountdownViewModel.init(configuration:handler:)((uint64_t)v9, a2, a3);
  *(uint64_t *)((char *)v15 + *(int *)(v10 + 20)) = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel();
  *v15 = ObservedObject.init(wrappedValue:)();
  v15[1] = v17;
  outlined init with copy of LACUIAuthCountdownConfiguration((uint64_t)v15, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
  v18 = UIHostingController.init(rootView:)();
  outlined destroy of LACUIAuthCountdownView(a1, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
  outlined destroy of LACUIAuthCountdownView((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
  *(_QWORD *)(v18 + direct field offset for LACUIDTOViewController.handler + 8) = a3;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v18;
}

uint64_t LACUIDTOViewController.init(configuration:handler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v7 = type metadata accessor for LACUIAuthCountdownConfiguration();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for LACUIAuthCountdownView();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (uint64_t *)((char *)&v19 - v14);
  *(_QWORD *)(v3 + direct field offset for LACUIDTOViewController.handler + 8) = 0;
  swift_unknownObjectWeakInit();
  outlined init with copy of LACUIAuthCountdownConfiguration(a1, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
  type metadata accessor for LACUIAuthCountdownViewModel();
  swift_allocObject();
  swift_unknownObjectRetain();
  LACUIAuthCountdownViewModel.init(configuration:handler:)((uint64_t)v9, a2, a3);
  *(uint64_t *)((char *)v15 + *(int *)(v10 + 20)) = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  swift_storeEnumTagMultiPayload();
  lazy protocol witness table accessor for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel();
  *v15 = ObservedObject.init(wrappedValue:)();
  v15[1] = v16;
  outlined init with copy of LACUIAuthCountdownConfiguration((uint64_t)v15, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
  v17 = UIHostingController.init(rootView:)();
  outlined destroy of LACUIAuthCountdownView(a1, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownConfiguration);
  outlined destroy of LACUIAuthCountdownView((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for LACUIAuthCountdownView);
  *(_QWORD *)(v17 + direct field offset for LACUIDTOViewController.handler + 8) = a3;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v17;
}

id LACUIDTOViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void LACUIDTOViewController.init(coder:)()
{
  char *v0;

  *(_QWORD *)&v0[direct field offset for LACUIDTOViewController.handler + 8] = 0;
  swift_unknownObjectWeakInit();

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void @objc LACUIDTOViewController.init(coder:)(char *a1, uint64_t a2, void *a3)
{
  id v5;

  *(_QWORD *)&a1[direct field offset for LACUIDTOViewController.handler + 8] = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t LACUIDTOViewController.refresh(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t (*v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(_BYTE *, _QWORD);
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[32];

  v2 = v1;
  v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  outlined init with copy of LACUIAuthCountdownConfiguration(a1, (uint64_t)v6, v7);
  v8 = v2 + direct field offset for LACUIDTOViewController.handler;
  v9 = MEMORY[0x2426888D0](v2 + direct field offset for LACUIDTOViewController.handler);
  v10 = *(_QWORD *)(v8 + 8);
  type metadata accessor for LACUIAuthCountdownViewModel();
  swift_allocObject();
  v11 = LACUIAuthCountdownViewModel.init(configuration:handler:)((uint64_t)v6, v9, v10);
  v12 = (uint64_t (*)(_BYTE *, _QWORD))dispatch thunk of UIHostingController.rootView.modify();
  v14 = v13;
  swift_release();
  *(_QWORD *)(v14 + 8) = v11;
  return v12(v16, 0);
}

void LACUIDTOViewController.__allocating_init(rootView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void LACUIDTOViewController.init(rootView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void LACUIDTOViewController.__allocating_init(coder:rootView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void LACUIDTOViewController.init(coder:rootView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t LACUIDTOViewController.__ivar_destroyer()
{
  uint64_t v0;

  return outlined destroy of weak LACUIAuthCountdownViewModelHandler?(v0 + direct field offset for LACUIDTOViewController.handler);
}

id LACUIDTOViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LACUIDTOViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t @objc LACUIDTOViewController.__ivar_destroyer(uint64_t a1)
{
  return outlined destroy of weak LACUIAuthCountdownViewModelHandler?(a1 + direct field offset for LACUIDTOViewController.handler);
}

unint64_t lazy protocol witness table accessor for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel;
  if (!lazy protocol witness table cache variable for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel)
  {
    v1 = type metadata accessor for LACUIAuthCountdownViewModel();
    result = MEMORY[0x242688798](&protocol conformance descriptor for LACUIAuthCountdownViewModel, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LACUIAuthCountdownViewModel and conformance LACUIAuthCountdownViewModel);
  }
  return result;
}

uint64_t type metadata accessor for LACUIDTOViewController()
{
  uint64_t result;

  result = type metadata singleton initialization cache for LACUIDTOViewController;
  if (!type metadata singleton initialization cache for LACUIDTOViewController)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for LACUIDTOViewController()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for LACUIDTOViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LACUIDTOViewController.__allocating_init(configuration:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for LACUIDTOViewController + v0 + 32))();
}

uint64_t dispatch thunk of LACUIDTOViewController.refresh(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for LACUIDTOViewController + (*MEMORY[0x24BEE4EA0] & *v0) + 40))();
}

uint64_t ObjC metadata update function for LACUIDTOViewController()
{
  return type metadata accessor for LACUIDTOViewController();
}

uint64_t View.embedInScrollView(fillAvailableSpace:)(char a1, uint64_t a2, uint64_t a3)
{
  char v4;

  v4 = a1;
  return MEMORY[0x242687EB0](&v4, a2, &type metadata for EmbedInScrollViewIfNeededModifier, a3);
}

uint64_t EmbedInScrollViewIfNeededModifier.fillAvailableSpace.getter(char a1)
{
  return a1 & 1;
}

uint64_t EmbedInScrollViewIfNeededModifier.body(content:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_BYTE *)(v10 + 16) = a2;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *a3 = partial apply for closure #1 in EmbedInScrollViewIfNeededModifier.body(content:);
  a3[1] = v10;
  return result;
}

uint64_t closure #1 in EmbedInScrollViewIfNeededModifier.body(content:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;

  v23 = a4;
  v7 = type metadata accessor for ScrollBounceBehavior();
  v21 = *(_QWORD *)(v7 - 8);
  v22 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ScrollView<_ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>>>);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of View.scrollBounceBehavior(_:axes:)>>.0);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = a2;
  v25 = a3;
  v26 = a1;
  static Axis.Set.vertical.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>>);
  lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>> and conformance <> _ConditionalContent<A, B>();
  v18 = ScrollView.init(_:showsIndicators:content:)();
  MEMORY[0x242687D0C](v18);
  LOBYTE(a1) = static Axis.Set.vertical.getter();
  Axis.Set.init(rawValue:)();
  Axis.Set.init(rawValue:)();
  if (Axis.Set.init(rawValue:)() != a1)
    Axis.Set.init(rawValue:)();
  lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type ScrollView<_ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>>> and conformance ScrollView<A>, &demangling cache variable for type metadata for ScrollView<_ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>>>, MEMORY[0x24BDEB238]);
  View.scrollBounceBehavior(_:axes:)();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v22);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v23, v17, v14);
}

uint64_t closure #1 in closure #1 in EmbedInScrollViewIfNeededModifier.body(content:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void (*v24)(char *, uint64_t, uint64_t);
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v27 = a3;
  v28 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>>.Storage);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v25 - v17;
  if ((a1 & 1) != 0)
  {
    v25[1] = v10;
    v26 = a2;
    GeometryProxy.size.getter();
    static Alignment.center.getter();
    _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v16, v26, v6);
    v19 = &v16[*(int *)(v13 + 36)];
    v20 = v34;
    *((_OWORD *)v19 + 4) = v33;
    *((_OWORD *)v19 + 5) = v20;
    *((_OWORD *)v19 + 6) = v35;
    v21 = v30;
    *(_OWORD *)v19 = v29;
    *((_OWORD *)v19 + 1) = v21;
    v22 = v32;
    *((_OWORD *)v19 + 2) = v31;
    *((_OWORD *)v19 + 3) = v22;
    outlined init with take of ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>((uint64_t)v16, (uint64_t)v18);
    outlined init with copy of ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>((uint64_t)v18, (uint64_t)v12);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _ViewModifier_Content<EmbedInScrollViewIfNeededModifier> and conformance _ViewModifier_Content<A>, &demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, MEMORY[0x24BDEFB78]);
    _ConditionalContent<>.init(storage:)();
    return outlined destroy of ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>((uint64_t)v18);
  }
  else
  {
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v24(v9, a2, v6);
    v24(v12, (uint64_t)v9, v6);
    swift_storeEnumTagMultiPayload();
    lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _ViewModifier_Content<EmbedInScrollViewIfNeededModifier> and conformance _ViewModifier_Content<A>, &demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, MEMORY[0x24BDEFB78]);
    _ConditionalContent<>.init(storage:)();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

LocalAuthenticationCoreUI::EmbedInScrollViewIfNeededModifier __swiftcall EmbedInScrollViewIfNeededModifier.init(fillAvailableSpace:)(Swift::Bool fillAvailableSpace)
{
  return (LocalAuthenticationCoreUI::EmbedInScrollViewIfNeededModifier)fillAvailableSpace;
}

uint64_t protocol witness for static ViewModifier._viewListCount(inputs:body:) in conformance EmbedInScrollViewIfNeededModifier()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t protocol witness for ViewModifier.body(content:) in conformance EmbedInScrollViewIfNeededModifier@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = *v2;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  v9 = (*(unsigned __int8 *)(v6 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v10 = swift_allocObject();
  *(_BYTE *)(v10 + 16) = v8;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  *a2 = partial apply for closure #1 in EmbedInScrollViewIfNeededModifier.body(content:);
  a2[1] = v10;
  return result;
}

uint64_t associated type witness table accessor for ViewModifier.Body : View in EmbedInScrollViewIfNeededModifier()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for EmbedInScrollViewIfNeededModifier(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for EmbedInScrollViewIfNeededModifier(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_240ADEB7C + 4 * byte_240AE2FC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_240ADEBB0 + 4 * byte_240AE2FC0[v4]))();
}

uint64_t sub_240ADEBB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240ADEBB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240ADEBC0);
  return result;
}

uint64_t sub_240ADEBCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240ADEBD4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_240ADEBD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240ADEBE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EmbedInScrollViewIfNeededModifier()
{
  return &type metadata for EmbedInScrollViewIfNeededModifier;
}

uint64_t sub_240ADEBFC()
{
  return lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type GeometryReader<<<opaque return type of View.scrollBounceBehavior(_:axes:)>>.0> and conformance GeometryReader<A>, &demangling cache variable for type metadata for GeometryReader<<<opaque return type of View.scrollBounceBehavior(_:axes:)>>.0>, MEMORY[0x24BDEC6F8]);
}

uint64_t sub_240ADEC28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = type metadata accessor for ModifiedContent();
  v4[0] = v1;
  v4[1] = lazy protocol witness table accessor for type EmbedInScrollViewIfNeededModifier and conformance EmbedInScrollViewIfNeededModifier();
  return MEMORY[0x242688798](MEMORY[0x24BDED308], v2, v4);
}

uint64_t objectdestroyTm_3()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in EmbedInScrollViewIfNeededModifier.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>)
                                      - 8)
                          + 80);
  return closure #1 in EmbedInScrollViewIfNeededModifier.body(content:)(a1, *(_BYTE *)(v2 + 16), v2 + ((v5 + 17) & ~v5), a2);
}

uint64_t partial apply for closure #1 in closure #1 in EmbedInScrollViewIfNeededModifier.body(content:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return closure #1 in closure #1 in EmbedInScrollViewIfNeededModifier.body(content:)(*(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), a1);
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>> and conformance <> _ConditionalContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>>);
    v2[0] = lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>();
    v2[1] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _ViewModifier_Content<EmbedInScrollViewIfNeededModifier> and conformance _ViewModifier_Content<A>, &demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, MEMORY[0x24BDEFB78]);
    result = MEMORY[0x242688798](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>, _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>> and conformance <> _ConditionalContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>);
    v2[0] = lazy protocol witness table accessor for type VStack<TupleView<(<<opaque return type of View.accessibilityElement(children:)>>.0, ModifiedContent<ModifiedContent<HStack<TupleView<(Text, Spacer)>>, _PaddingLayout>, _PaddingLayout>?)>> and conformance VStack<A>(&lazy protocol witness table cache variable for type _ViewModifier_Content<EmbedInScrollViewIfNeededModifier> and conformance _ViewModifier_Content<A>, &demangling cache variable for type metadata for _ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, MEMORY[0x24BDEFB78]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x242688798](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t outlined init with take of ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ViewModifier_Content<EmbedInScrollViewIfNeededModifier>, _FlexFrameLayout>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

objc_class *one-time initialization function for resourceBundle()
{
  uint64_t ObjCClassFromMetadata;
  objc_class *result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = (objc_class *)objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  resourceBundle.super.isa = result;
  return result;
}

uint64_t one-time initialization function for lockAndRing(uint64_t a1)
{
  return one-time initialization function for lockAndRing(a1, static ImageResource.lockAndRing, 0x646E612E6B636F6CLL, 0xED0000676E69722ELL);
}

uint64_t ImageResource.lockAndRing.unsafeMutableAddressor()
{
  return ImageResource.lockAndRing.unsafeMutableAddressor(&one-time initialization token for lockAndRing, (uint64_t)static ImageResource.lockAndRing);
}

uint64_t static ImageResource.lockAndRing.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.lockAndRing.getter(&one-time initialization token for lockAndRing, (uint64_t)static ImageResource.lockAndRing, a1);
}

uint64_t one-time initialization function for lockBadgeClockFill(uint64_t a1)
{
  return one-time initialization function for lockAndRing(a1, static ImageResource.lockBadgeClockFill, 0xD000000000000015, 0x8000000240AE4440);
}

uint64_t one-time initialization function for lockAndRing(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for ImageResource();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (one-time initialization token for resourceBundle != -1)
    swift_once();
  return MEMORY[0x242687934](a3, a4, resourceBundle.super.isa);
}

uint64_t ImageResource.lockBadgeClockFill.unsafeMutableAddressor()
{
  return ImageResource.lockAndRing.unsafeMutableAddressor(&one-time initialization token for lockBadgeClockFill, (uint64_t)static ImageResource.lockBadgeClockFill);
}

uint64_t ImageResource.lockAndRing.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = type metadata accessor for ImageResource();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static ImageResource.lockBadgeClockFill.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.lockAndRing.getter(&one-time initialization token for lockBadgeClockFill, (uint64_t)static ImageResource.lockBadgeClockFill, a1);
}

uint64_t static ImageResource.lockAndRing.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for ImageResource();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t static FormatStyle<>.components(style:fields:)()
{
  return MEMORY[0x24BDCB118]();
}

uint64_t static FormatStyle<>.time(pattern:)()
{
  return MEMORY[0x24BDCB180]();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5;
  void *v6;
  Swift::String result;

  v5 = MEMORY[0x24BDCC6D8](_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x24BDCD7B8]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t static Date.> infix(_:_:)()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t static Date.ComponentsFormatStyle.Style.wide.getter()
{
  return MEMORY[0x24BDCE640]();
}

uint64_t type metadata accessor for Date.ComponentsFormatStyle.Style()
{
  return MEMORY[0x24BDCE658]();
}

uint64_t type metadata accessor for Date.ComponentsFormatStyle()
{
  return MEMORY[0x24BDCE760]();
}

uint64_t static Date.== infix(_:_:)()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return MEMORY[0x24BDC6D30]();
}

uint64_t type metadata accessor for ImageResource()
{
  return MEMORY[0x24BDC6D48]();
}

uint64_t UTType.identifier.getter()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t type metadata accessor for UTType()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t UTType.init(_:)()
{
  return MEMORY[0x24BEE6410]();
}

uint64_t static LACLogger.ui.getter()
{
  return MEMORY[0x24BE60508]();
}

Swift::Void __swiftcall LACLogger.log(_:)(Swift::String a1)
{
  MEMORY[0x24BE60518](a1._countAndFlagsBits, a1._object);
}

uint64_t static LACLogger.dtoUI.getter()
{
  return MEMORY[0x24BE60530]();
}

Swift::Void __swiftcall LACLogger.error(_:)(Swift::String a1)
{
  MEMORY[0x24BE60538](a1._countAndFlagsBits, a1._object);
}

uint64_t type metadata accessor for LACLogger()
{
  return MEMORY[0x24BE60548]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t PassthroughSubject.init()()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t CurrentValueSubject.value.setter()
{
  return MEMORY[0x24BDB9CD8]();
}

uint64_t CurrentValueSubject.init(_:)()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t Subject<>.send()()
{
  return MEMORY[0x24BDB9E70]();
}

uint64_t Published.init(initialValue:)()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t Published.projectedValue.getter()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t Published.projectedValue.setter()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t static Published.subscript.modify()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t static Published.subscript.getter()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t static Published.subscript.setter()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t type metadata accessor for Published()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t EdgeInsets.init(_all:)()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t type metadata accessor for ColorScheme()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t type metadata accessor for Environment.Content()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t StateObject.wrappedValue.getter()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t TimelineView<>.init(_:content:)()
{
  return MEMORY[0x24BDEBD28]();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t GeometryProxy.size.getter()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t ObservedObject.projectedValue.getter()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return MEMORY[0x24BDED998]();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t EnvironmentValues.dynamicTypeSize.setter()
{
  return MEMORY[0x24BDEE028]();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t EnvironmentValues.symbolRenderingMode.getter()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t EnvironmentValues.symbolRenderingMode.setter()
{
  return MEMORY[0x24BDEE1F8]();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t EnvironmentValues.font.getter()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t EnvironmentValues.font.setter()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t EnvironmentValues.init()()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t static VerticalAlignment.center.getter()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t static AccessibilityTraits.updatesFrequently.getter()
{
  return MEMORY[0x24BDEED20]();
}

uint64_t static AccessibilityTraits.isHeader.getter()
{
  return MEMORY[0x24BDEED70]();
}

uint64_t type metadata accessor for AccessibilityTraits()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t static SymbolRenderingMode.monochrome.getter()
{
  return MEMORY[0x24BDEF0B0]();
}

uint64_t static SymbolRenderingMode.hierarchical.getter()
{
  return MEMORY[0x24BDEF0D0]();
}

uint64_t type metadata accessor for SymbolRenderingMode()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t UIHostingController.init(rootView:)()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t dispatch thunk of UIHostingController.rootView.modify()
{
  return MEMORY[0x24BDEF1D8]();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t static UIViewRepresentable._makeViewList(view:inputs:)()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t UIViewRepresentable.body.getter()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t static UIViewRepresentable._makeView(view:inputs:)()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t type metadata accessor for _ConditionalContent.Storage()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t type metadata accessor for _ConditionalContent()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t static ScrollBounceBehavior.basedOnSize.getter()
{
  return MEMORY[0x24BDEF5C8]();
}

uint64_t type metadata accessor for ScrollBounceBehavior()
{
  return MEMORY[0x24BDEF5D8]();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t PeriodicTimelineSchedule.init(from:by:)()
{
  return MEMORY[0x24BDF0560]();
}

uint64_t type metadata accessor for PeriodicTimelineSchedule()
{
  return MEMORY[0x24BDF0570]();
}

uint64_t static AccessibilityChildBehavior.combine.getter()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t BorderedProminentButtonStyle.init()()
{
  return MEMORY[0x24BDF0D98]();
}

uint64_t type metadata accessor for BorderedProminentButtonStyle()
{
  return MEMORY[0x24BDF0DA8]();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t Axis.Set.init(rawValue:)()
{
  return MEMORY[0x24BDF1458]();
}

uint64_t static Axis.Set.vertical.getter()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t static Edge.Set.all.getter()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t static Edge.Set.vertical.getter()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t static Font.largeTitle.getter()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t static Font.title.getter()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t static Font.Weight.bold.getter()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t static Font.footnote.getter()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t static Font.headline.getter()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t Text.fontWeight(_:)()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t Text.monospacedDigit()()
{
  return MEMORY[0x24BDF1D20]();
}

uint64_t Text.accessibilityLabel<A>(_:)()
{
  return MEMORY[0x24BDF1D58]();
}

uint64_t Text.font(_:)()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t Text.init<A>(_:)()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t static View._makeView(view:inputs:)()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t View.fontWeight(_:)()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t View.accessibilityHidden(_:)()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t View.accessibilityElement(children:)()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t View.scrollBounceBehavior(_:axes:)()
{
  return MEMORY[0x24BDF2FD8]();
}

uint64_t View.accessibilityAddTraits(_:)()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t View.modifier<A>(_:)()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t Color.init(uiColor:)()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t static Color.blue.getter()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t Group<A>.init(content:)()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t type metadata accessor for Group()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t Image.init(systemName:)()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t Image.init(_:bundle:)()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t Button.init(action:label:)()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t Button<>.init<A>(_:action:)()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t HStack.init(alignment:spacing:content:)()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t type metadata accessor for HStack()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t VStack.init(alignment:spacing:content:)()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t type metadata accessor for VStack()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t ForEach<>.init(_:content:)()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t static Alignment.center.getter()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t CancellationError.init()()
{
  return MEMORY[0x24BEE67F8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x24BEE07F0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t type metadata accessor for CancellationError()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
}

Swift::Void __swiftcall Task.cancel()()
{
  MEMORY[0x24BEE6AD0]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDCFD28]();
}

uint64_t static Int._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFD30]();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t static Int._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFD40]();
}

uint64_t Int.hashValue.getter()
{
  return MEMORY[0x24BEE1758]();
}

uint64_t Range<>.formatted<A>(_:)()
{
  return MEMORY[0x24BDCFD68]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x24BEE7920]();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)MEMORY[0x24BDD01F8](integerLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t Optional.debugDescription.getter()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE23A0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x24BEE23E8]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x24BEE31D0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t withCheckedThrowingContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t static Duration.TimeFormatStyle.Pattern.minuteSecond.getter()
{
  return MEMORY[0x24BDD0890]();
}

uint64_t type metadata accessor for Duration.TimeFormatStyle.Pattern()
{
  return MEMORY[0x24BDD08A8]();
}

uint64_t type metadata accessor for Duration.TimeFormatStyle()
{
  return MEMORY[0x24BDD08D0]();
}

uint64_t Duration.formatted<A>(_:)()
{
  return MEMORY[0x24BDD0B20]();
}

uint64_t Duration.init(secondsComponent:attosecondsComponent:)()
{
  return MEMORY[0x24BEE4848]();
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x24BDE55A8](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55F8](retstr, t, sx, sy, sz);
}

uint64_t CA_CGPointApplyTransform()
{
  return MEMORY[0x24BDE5610]();
}

uint64_t CA_CGRectApplyTransform()
{
  return MEMORY[0x24BDE5618]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BEBDE48]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

