uint64_t onEventStreamsUpdated_bounce(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "onEventStreamsUpdated");
}

void sub_2422B363C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;
  id *v26;
  uint64_t v27;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v27 - 112));
  _Unwind_Resume(a1);
}

void sub_2422B46E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x430], 8);
  _Block_object_dispose(&STACK[0x450], 8);
  _Block_object_dispose(&STACK[0x480], 8);
  _Block_object_dispose(&STACK[0x4B0], 8);
  _Block_object_dispose(&STACK[0x4D0], 8);
  _Block_object_dispose(&STACK[0x4F0], 8);
  _Block_object_dispose(&STACK[0x510], 8);
  _Block_object_dispose(&STACK[0x530], 8);
  _Block_object_dispose(&STACK[0x550], 8);
  _Block_object_dispose(&STACK[0x570], 8);
  _Block_object_dispose(&STACK[0x590], 8);
  _Block_object_dispose(&STACK[0x5B0], 8);
  _Block_object_dispose(&STACK[0x5D0], 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_2422B500C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422B59E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2422B6220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void _MODiagnosticReporter_NotificationHandler(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;

  _mo_log_facility_get_os_log(MOLogFacilityDiagnosticReporter);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    _MODiagnosticReporter_NotificationHandler_cold_1(a2, v4);

  +[MODiagnosticReporter defaultReporter](MODiagnosticReporter, "defaultReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_notificationHandlerWithNotificationRef:andOptionFlags:", a1, a2);

}

void sub_2422B9C1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_2422BA36C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2422BA500(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2422BA5A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2422BA92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "UTF8String");
}

id _mo_log_facility_get_os_log(dispatch_once_t *predicate)
{
  if (*predicate != -1)
    dispatch_once_f(predicate, predicate, (dispatch_function_t)_mo_log_facility_prepare);
  return (id)predicate[2];
}

os_log_t _mo_log_facility_prepare(uint64_t a1)
{
  os_log_t result;

  result = os_log_create("com.apple.MomentsOnboardingAndSettings", *(const char **)(a1 + 8));
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_2422BB9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL isValidString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByTrimmingCharactersInSet:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_2422BD76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422BDD44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422BE24C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

id variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.onboardingManager()
{
  return objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
}

id MOSuggestionSheetOnboardingSettingsViewController.onboardingManager.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_onboardingManager));
}

uint64_t variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.delegate()
{
  return 0;
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.delegate.getter()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.delegate.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1
                + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_delegate);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*MOSuggestionSheetOnboardingSettingsViewController.delegate.modify())()
{
  swift_beginAccess();
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

uint64_t variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion()
{
  return 0;
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_hasTappedOnboardingCompletion);
  swift_beginAccess();
  return *v1;
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1
               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_hasTappedOnboardingCompletion);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.modify())()
{
  swift_beginAccess();
  return MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.modify;
}

uint64_t variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton()
{
  return 0;
}

void *MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0
               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_turnOnSuggestionsButton);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton.setter(void *a1)
{
  MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton.setter(a1, &OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_turnOnSuggestionsButton);
}

uint64_t (*MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton.modify())()
{
  swift_beginAccess();
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

uint64_t variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.backButton()
{
  return 0;
}

void *MOSuggestionSheetOnboardingSettingsViewController.backButton.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0
               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_backButton);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void MOSuggestionSheetOnboardingSettingsViewController.backButton.setter(void *a1)
{
  MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton.setter(a1, &OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_backButton);
}

void MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton.setter(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

uint64_t (*MOSuggestionSheetOnboardingSettingsViewController.backButton.modify())()
{
  swift_beginAccess();
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

uint64_t variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.wasSwitchDisabled()
{
  return 0;
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.wasSwitchDisabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_wasSwitchDisabled);
  swift_beginAccess();
  return *v1;
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.wasSwitchDisabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1
               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_wasSwitchDisabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*MOSuggestionSheetOnboardingSettingsViewController.wasSwitchDisabled.modify())()
{
  swift_beginAccess();
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

double variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.tableViewHeight()
{
  return 0.0;
}

uint64_t variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.tableViewHeightConstraint()
{
  return 0;
}

_QWORD *closure #1 in variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.journalingSuggestionsSettings()
{
  void *v0;
  uint64_t v1;
  char *v2;
  void *v3;
  id v4;
  uint64_t ObjCClassFromMetadata;
  void *v6;
  id v7;
  Swift::String v8;
  unint64_t v9;
  Swift::String v10;
  Swift::String v11;
  _QWORD *result;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  Swift::String v38;
  Swift::String v39;
  Swift::String v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  Swift::String v55;
  Swift::String v56;
  Swift::String v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  Swift::String v63;
  Swift::String v64;
  Swift::String v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  id v70;
  Swift::String v71;
  Swift::String v72;
  Swift::String v73;
  id v74;
  Swift::String v75;
  Swift::String v76;
  Swift::String v77;
  id v78;
  id v79;
  Swift::String v80;
  Swift::String v81;
  Swift::String v82;
  id v83;
  Swift::String v84;
  Swift::String v85;
  Swift::String v86;
  id v87;
  id v88;
  uint64_t v89;
  id v90;
  Swift::String v91;
  Swift::String v92;
  Swift::String v93;
  id v94;
  Swift::String v95;
  Swift::String v96;
  Swift::String v97;
  id v98;
  uint64_t v99;
  id v100;
  Swift::String v101;
  Swift::String v102;
  Swift::String v103;
  id v104;
  Swift::String v105;
  Swift::String v106;
  Swift::String v107;
  id v108;
  id v109;
  Swift::String v110;
  Swift::String v111;
  Swift::String v112;
  void *v113;
  void *v114;
  uint64_t v115;
  id v116;
  Swift::String v117;
  Swift::String v118;
  Swift::String v119;
  id v120;
  id v121;
  id v122;
  Swift::String v123;
  Swift::String v124;
  Swift::String v125;
  id v126;
  Swift::String v127;
  Swift::String v128;
  Swift::String v129;
  id v130;
  void *v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  Swift::String v141;
  Swift::String v142;
  Swift::String v143;
  id v144;
  void *v145;
  uint64_t v146;
  id v147;
  id v148;
  id v149;
  _QWORD *v150;
  _QWORD *v151;
  uint64_t v152;
  id v153;
  Swift::String v154;
  Swift::String v155;
  Swift::String v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  id v167[2];
  __int128 v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  uint64_t v174;
  id v175;
  id v176;
  id v177;
  uint64_t v178;
  Swift::String v179;
  Swift::String v180;
  Swift::String v181;
  Swift::String v182;
  Swift::String v183;
  Swift::String v184;
  Swift::String v185;
  Swift::String v186;
  Swift::String v187;
  Swift::String v188;
  Swift::String v189;
  Swift::String v190;
  Swift::String v191;
  Swift::String v192;
  Swift::String v193;
  Swift::String v194;
  Swift::String v195;
  Swift::String v196;
  Swift::String v197;

  v0 = (void *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)v167 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = (void *)MEMORY[0x2426A69DC](0xD00000000000001CLL, 0x80000002422CEFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v3);

  type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  v179._countAndFlagsBits = 0xD00000000000002CLL;
  v8._countAndFlagsBits = 0xD0000000000000A0;
  v179._object = (void *)0x80000002422CF660;
  v8._object = (void *)0x80000002422CF5B0;
  v9 = 0xE000000000000000;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  v11 = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v10, v179);

  v173 = v4;
  v176 = v6;
  v177 = v0;
  v178 = ObjCClassFromMetadata;
  if (!v4)
  {
    v15 = 0;
LABEL_7:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_2422CD150;
    v18 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v17 + 56) = MEMORY[0x24BEE0D00];
    v19 = lazy protocol witness table accessor for type String and conformance String();
    *(Swift::String *)(v17 + 32) = v11;
    *(_QWORD *)(v17 + 96) = v18;
    *(_QWORD *)(v17 + 104) = v19;
    *(_QWORD *)(v17 + 64) = v19;
    *(_QWORD *)(v17 + 72) = v15;
    *(_QWORD *)(v17 + 80) = v9;
    swift_bridgeObjectRetain();
    v20 = String.init(format:_:)();
    v22 = v21;
    v23 = objc_allocWithZone(MEMORY[0x24BDD1688]);
    v24 = (void *)MEMORY[0x2426A69DC](v20, v22);
    v25 = objc_msgSend(v23, sel_initWithString_, v24);

    v26 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
    v27 = (void *)MEMORY[0x2426A69DC](v20, v22);
    swift_bridgeObjectRelease();
    v28 = objc_msgSend(v26, sel_initWithString_, v27);

    v29 = (void *)MEMORY[0x2426A69DC](v15, v9);
    swift_bridgeObjectRelease();
    v30 = objc_msgSend(v28, sel_rangeOfString_, v29);
    v32 = v31;

    v33 = *MEMORY[0x24BEBB388];
    URL.init(string:)();
    v34 = Optional._bridgeToObjectiveC()();
    outlined destroy of URL?((uint64_t)v2);
    v172 = v25;
    objc_msgSend(v25, sel_addAttribute_value_range_, v33, v34, v30, v32);
    swift_unknownObjectRelease();
    v175 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA88]), sel_init);
    objc_msgSend(v175, sel_setAttributedText_, v25);
    v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA88]), (SEL)0x251344DC8);
    *(_QWORD *)&v168 = v35;
    v36 = v176;
    v37 = objc_msgSend(v176, sel_bundleForClass_, v178);
    v38._countAndFlagsBits = 0xD000000000000018;
    v180._countAndFlagsBits = 0xD000000000000033;
    v180._object = (void *)0x80000002422CF6B0;
    v38._object = (void *)0x80000002422CF690;
    v39._countAndFlagsBits = 0;
    v39._object = (void *)0xE000000000000000;
    v40 = NSLocalizedString(_:tableName:bundle:value:comment:)(v38, (Swift::String_optional)0, (NSBundle)v37, v39, v180);

    v41 = objc_allocWithZone(MEMORY[0x24BDD1688]);
    v42 = (void *)MEMORY[0x2426A69DC](v40._countAndFlagsBits, v40._object);
    swift_bridgeObjectRelease();
    v43 = objc_msgSend(v41, sel_initWithString_, v42);

    objc_msgSend(v35, sel_setAttributedText_, v43);
    v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA88]), (SEL)0x251344DC8);
    v170 = v44;
    v45 = v178;
    v46 = objc_msgSend(v36, (SEL)&MOSettingsOptions.base_prots + 1, v178);
    v181._countAndFlagsBits = 0xD000000000000029;
    v47._countAndFlagsBits = 0xD000000000000044;
    v181._object = (void *)0x80000002422CF740;
    v47._object = (void *)0x80000002422CF6F0;
    v48._countAndFlagsBits = 0;
    v48._object = (void *)0xE000000000000000;
    v49 = NSLocalizedString(_:tableName:bundle:value:comment:)(v47, (Swift::String_optional)0, (NSBundle)v46, v48, v181);

    v50 = objc_allocWithZone(MEMORY[0x24BDD1688]);
    v51 = (void *)MEMORY[0x2426A69DC](v49._countAndFlagsBits, v49._object);
    swift_bridgeObjectRelease();
    v52 = objc_msgSend(v50, sel_initWithString_, v51);

    objc_msgSend(v44, sel_setAttributedText_, v52);
    v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA88]), sel_init);
    v171 = v53;
    v54 = objc_msgSend(v36, (SEL)&MOSettingsOptions.base_prots + 1, v45);
    v182._countAndFlagsBits = 0xD00000000000002ALL;
    v182._object = (void *)0x80000002422CF770;
    v55._countAndFlagsBits = 0x502059425241454ELL;
    v55._object = (void *)0xED0000454C504F45;
    v56._countAndFlagsBits = 0;
    v56._object = (void *)0xE000000000000000;
    v57 = NSLocalizedString(_:tableName:bundle:value:comment:)(v55, (Swift::String_optional)0, (NSBundle)v54, v56, v182);

    v58 = objc_allocWithZone(MEMORY[0x24BDD1688]);
    v59 = (void *)MEMORY[0x2426A69DC](v57._countAndFlagsBits, v57._object);
    swift_bridgeObjectRelease();
    v60 = objc_msgSend(v58, sel_initWithString_, v59);

    objc_msgSend(v53, sel_setAttributedText_, v60);
    v61 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA88]), sel_init);
    v169 = v61;
    v62 = objc_msgSend(v36, (SEL)&MOSettingsOptions.base_prots + 1, v45);
    v183._countAndFlagsBits = 0xD000000000000037;
    v183._object = (void *)0x80000002422CF880;
    v63._object = (void *)0x80000002422CF7A0;
    v63._countAndFlagsBits = 0x10000000000000DELL;
    v64._countAndFlagsBits = 0;
    v64._object = (void *)0xE000000000000000;
    v65 = NSLocalizedString(_:tableName:bundle:value:comment:)(v63, (Swift::String_optional)0, (NSBundle)v62, v64, v183);

    v66 = objc_allocWithZone(MEMORY[0x24BDD1688]);
    v67 = (void *)MEMORY[0x2426A69DC](v65._countAndFlagsBits, v65._object);
    swift_bridgeObjectRelease();
    v68 = objc_msgSend(v66, byte_2513445C8, v67);

    objc_msgSend(v61, sel_setAttributedText_, v68);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AppSettingsOptionGroup>);
    v174 = swift_allocObject();
    *(_OWORD *)(v174 + 16) = xmmword_2422CD160;
    v167[1] = (id)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AppSetting>);
    v69 = swift_allocObject();
    *(_OWORD *)(v69 + 16) = xmmword_2422CD170;
    v70 = objc_msgSend(v36, (SEL)&MOSettingsOptions.base_prots + 1, v45);
    v184._countAndFlagsBits = 0xD000000000000043;
    v184._object = (void *)0x80000002422CF230;
    v71._countAndFlagsBits = 0x7974697669746341;
    v71._object = (void *)0xE800000000000000;
    v72._countAndFlagsBits = 0;
    v72._object = (void *)0xE000000000000000;
    v73 = NSLocalizedString(_:tableName:bundle:value:comment:)(v71, (Swift::String_optional)0, (NSBundle)v70, v72, v184);

    v74 = objc_msgSend(v36, (SEL)&MOSettingsOptions.base_prots + 1, v45);
    v185._countAndFlagsBits = 0xD00000000000004CLL;
    v185._object = (void *)0x80000002422CF8E0;
    v75._object = (void *)0x80000002422CF8C0;
    v75._countAndFlagsBits = 0xD00000000000001ALL;
    v76._countAndFlagsBits = 0;
    v76._object = (void *)0xE000000000000000;
    v77 = NSLocalizedString(_:tableName:bundle:value:comment:)(v75, (Swift::String_optional)0, (NSBundle)v74, v76, v185);

    v177 = (id)objc_opt_self();
    v78 = objc_msgSend(v177, sel_sharedInstance);
    LOBYTE(v74) = objc_msgSend(v78, sel_getStateForSetting_, 1);

    *(Swift::String *)(v69 + 32) = v73;
    *(Swift::String *)(v69 + 48) = v77;
    *(_BYTE *)(v69 + 64) = (_BYTE)v74;
    *(_OWORD *)(v69 + 72) = xmmword_2422CD180;
    v79 = objc_msgSend(v36, sel_bundleForClass_, v45);
    v186._countAndFlagsBits = 0xD000000000000046;
    v186._object = (void *)0x80000002422CF280;
    v80._countAndFlagsBits = 0x616964654DLL;
    v80._object = (void *)0xE500000000000000;
    v81._countAndFlagsBits = 0;
    v81._object = (void *)0xE000000000000000;
    v82 = NSLocalizedString(_:tableName:bundle:value:comment:)(v80, (Swift::String_optional)0, (NSBundle)v79, v81, v186);

    v83 = objc_msgSend(v36, sel_bundleForClass_, v45);
    v84._countAndFlagsBits = 0xD000000000000021;
    v187._countAndFlagsBits = 0xD000000000000028;
    v187._object = (void *)0x80000002422CF960;
    v84._object = (void *)0x80000002422CF930;
    v85._countAndFlagsBits = 0;
    v85._object = (void *)0xE000000000000000;
    v86 = NSLocalizedString(_:tableName:bundle:value:comment:)(v84, (Swift::String_optional)0, (NSBundle)v83, v85, v187);

    v87 = v177;
    v88 = objc_msgSend(v177, sel_sharedInstance);
    LOBYTE(v53) = objc_msgSend(v88, sel_getStateForSetting_, 2);

    *(Swift::String *)(v69 + 88) = v82;
    *(Swift::String *)(v69 + 104) = v86;
    *(_BYTE *)(v69 + 120) = (_BYTE)v53;
    *(_OWORD *)(v69 + 128) = xmmword_2422CD190;
    v89 = v178;
    v90 = objc_msgSend(v36, sel_bundleForClass_, v178);
    v188._countAndFlagsBits = 0xD000000000000065;
    v188._object = (void *)0x80000002422CF2D0;
    v91._countAndFlagsBits = 0x73746361746E6F43;
    v91._object = (void *)0xE800000000000000;
    v92._countAndFlagsBits = 0;
    v92._object = (void *)0xE000000000000000;
    v93 = NSLocalizedString(_:tableName:bundle:value:comment:)(v91, (Swift::String_optional)0, (NSBundle)v90, v92, v188);

    v94 = objc_msgSend(v36, (SEL)&MOSettingsOptions.base_prots + 1, v89);
    v95._countAndFlagsBits = 0xD00000000000001BLL;
    v167[0] = (id)0xD00000000000001BLL;
    v189._countAndFlagsBits = 0xD000000000000034;
    v189._object = (void *)0x80000002422CF9B0;
    v95._object = (void *)0x80000002422CF990;
    v96._countAndFlagsBits = 0;
    v96._object = (void *)0xE000000000000000;
    v97 = NSLocalizedString(_:tableName:bundle:value:comment:)(v95, (Swift::String_optional)0, (NSBundle)v94, v96, v189);

    v98 = objc_msgSend(v87, sel_sharedInstance);
    LOBYTE(v45) = objc_msgSend(v98, sel_getStateForSetting_, 3);

    *(Swift::String *)(v69 + 144) = v93;
    *(Swift::String *)(v69 + 160) = v97;
    *(_BYTE *)(v69 + 176) = v45;
    *(_OWORD *)(v69 + 184) = xmmword_2422CD1A0;
    v99 = v178;
    v100 = objc_msgSend(v36, (SEL)&MOSettingsOptions.base_prots + 1, v178);
    v190._countAndFlagsBits = 0xD000000000000039;
    v190._object = (void *)0x80000002422CF340;
    v101._countAndFlagsBits = 0x736F746F6850;
    v101._object = (void *)0xE600000000000000;
    v102._countAndFlagsBits = 0;
    v102._object = (void *)0xE000000000000000;
    v103 = NSLocalizedString(_:tableName:bundle:value:comment:)(v101, (Swift::String_optional)0, (NSBundle)v100, v102, v190);

    v104 = objc_msgSend(v36, (SEL)&MOSettingsOptions.base_prots + 1, v99);
    v105._countAndFlagsBits = 0xD000000000000024;
    v191._countAndFlagsBits = 0xD000000000000047;
    v191._object = (void *)0x80000002422CFA20;
    v105._object = (void *)0x80000002422CF9F0;
    v106._countAndFlagsBits = 0;
    v106._object = (void *)0xE000000000000000;
    v107 = NSLocalizedString(_:tableName:bundle:value:comment:)(v105, (Swift::String_optional)0, (NSBundle)v104, v106, v191);

    v108 = objc_msgSend(v87, sel_sharedInstance);
    LOBYTE(v45) = objc_msgSend(v108, sel_getStateForSetting_, 4);

    *(Swift::String *)(v69 + 200) = v103;
    *(Swift::String *)(v69 + 216) = v107;
    *(_BYTE *)(v69 + 232) = v45;
    *(_OWORD *)(v69 + 240) = xmmword_2422CD1B0;
    v109 = objc_msgSend(v36, sel_bundleForClass_, v99);
    v110._countAndFlagsBits = 0xD000000000000015;
    v192._countAndFlagsBits = 0xD00000000000004FLL;
    v192._object = (void *)0x80000002422CF3A0;
    v110._object = (void *)0x80000002422CF380;
    v111._countAndFlagsBits = 0;
    v111._object = (void *)0xE000000000000000;
    v112 = NSLocalizedString(_:tableName:bundle:value:comment:)(v110, (Swift::String_optional)0, (NSBundle)v109, v111, v192);

    v113 = v36;
    v114 = v36;
    v115 = v99;
    v116 = objc_msgSend(v113, sel_bundleForClass_, v99);
    v193._countAndFlagsBits = 0xD000000000000041;
    v193._object = (void *)0x80000002422CFA90;
    v117._object = (void *)0x80000002422CFA70;
    v117._countAndFlagsBits = (uint64_t)v167[0];
    v118._countAndFlagsBits = 0;
    v118._object = (void *)0xE000000000000000;
    v119 = NSLocalizedString(_:tableName:bundle:value:comment:)(v117, (Swift::String_optional)0, (NSBundle)v116, v118, v193);

    v120 = v177;
    v121 = objc_msgSend(v177, sel_sharedInstance);
    LOBYTE(v53) = objc_msgSend(v121, sel_getStateForSetting_, 5);

    *(Swift::String *)(v69 + 256) = v112;
    *(Swift::String *)(v69 + 272) = v119;
    *(_BYTE *)(v69 + 288) = (_BYTE)v53;
    *(_QWORD *)(v69 + 296) = 0x6E6F697461636F6CLL;
    *(_QWORD *)(v69 + 304) = 0xE900000000000073;
    v122 = objc_msgSend(v114, sel_bundleForClass_, v99);
    v194._countAndFlagsBits = 0xD000000000000048;
    v194._object = (void *)0x80000002422CF3F0;
    v123._countAndFlagsBits = 0x666F206574617453;
    v123._object = (void *)0xED0000646E694D20;
    v124._countAndFlagsBits = 0;
    v124._object = (void *)0xE000000000000000;
    v125 = NSLocalizedString(_:tableName:bundle:value:comment:)(v123, (Swift::String_optional)0, (NSBundle)v122, v124, v194);

    v126 = objc_msgSend(v114, sel_bundleForClass_, v99);
    v195._countAndFlagsBits = 0xD00000000000003FLL;
    v195._object = (void *)0x80000002422CFB00;
    v127._object = (void *)0x80000002422CFAE0;
    v127._countAndFlagsBits = 0xD00000000000001ALL;
    v128._countAndFlagsBits = 0;
    v128._object = (void *)0xE000000000000000;
    v129 = NSLocalizedString(_:tableName:bundle:value:comment:)(v127, (Swift::String_optional)0, (NSBundle)v126, v128, v195);

    v130 = objc_msgSend(v120, sel_sharedInstance);
    LOBYTE(v53) = objc_msgSend(v130, sel_getStateForSetting_, 9);

    *(Swift::String *)(v69 + 312) = v125;
    *(Swift::String *)(v69 + 328) = v129;
    *(_BYTE *)(v69 + 344) = (_BYTE)v53;
    *(_OWORD *)(v69 + 352) = xmmword_2422CD1C0;
    v131 = (void *)v168;
    v132 = (id)v168;
    v167[0] = v132;
    v133 = specialized AppSettingsOptionGroup.init(appSettings:header:footer:)(v69, v131, v175);
    v135 = v134;
    v137 = v136;

    v138 = v174;
    *(_QWORD *)(v174 + 32) = v133;
    *(_QWORD *)(v138 + 40) = v135;
    *(_QWORD *)(v138 + 48) = v137;
    v139 = swift_allocObject();
    v168 = xmmword_2422CD1D0;
    *(_OWORD *)(v139 + 16) = xmmword_2422CD1D0;
    v140 = objc_msgSend(v114, sel_bundleForClass_, v115);
    v141._countAndFlagsBits = 0xD000000000000012;
    v196._countAndFlagsBits = 0xD000000000000045;
    v196._object = (void *)0x80000002422CFB40;
    v141._object = (void *)0x80000002422CF440;
    v142._countAndFlagsBits = 0;
    v142._object = (void *)0xE000000000000000;
    v143 = NSLocalizedString(_:tableName:bundle:value:comment:)(v141, (Swift::String_optional)0, (NSBundle)v140, v142, v196);

    v144 = objc_msgSend(v120, sel_sharedInstance);
    LOBYTE(v61) = objc_msgSend(v144, sel_getStateForSetting_, 10);

    *(Swift::String *)(v139 + 32) = v143;
    *(_QWORD *)(v139 + 48) = 0;
    *(_QWORD *)(v139 + 56) = 0;
    *(_BYTE *)(v139 + 64) = (_BYTE)v61;
    *(_OWORD *)(v139 + 72) = xmmword_2422CD1E0;
    v145 = (void *)objc_opt_self();
    v146 = *MEMORY[0x24BEBE1F0];
    v147 = v170;
    v148 = v170;
    v149 = objc_msgSend(v145, sel_preferredFontForTextStyle_, v146);
    objc_msgSend(v148, sel_setFont_, v149);

    objc_msgSend(v148, sel_setEditable_, 0);
    objc_msgSend(v148, sel_setSelectable_, 1);
    objc_msgSend(v148, sel_setScrollEnabled_, 0);
    objc_msgSend(v148, sel_setDataDetectorTypes_, -1);

    v150 = (_QWORD *)v174;
    *(_QWORD *)(v174 + 56) = v139;
    v150[8] = 0;
    v150[9] = v147;
    v151 = v150;
    v152 = swift_allocObject();
    *(_OWORD *)(v152 + 16) = v168;
    v153 = objc_msgSend(v176, sel_bundleForClass_, v115);
    v154._countAndFlagsBits = 0xD000000000000020;
    v197._countAndFlagsBits = 0xD00000000000004ELL;
    v197._object = (void *)0x80000002422CFB90;
    v154._object = (void *)0x80000002422CF460;
    v155._countAndFlagsBits = 0;
    v155._object = (void *)0xE000000000000000;
    v156 = NSLocalizedString(_:tableName:bundle:value:comment:)(v154, (Swift::String_optional)0, (NSBundle)v153, v155, v197);

    v157 = objc_msgSend(v177, sel_sharedInstance);
    LOBYTE(v147) = objc_msgSend(v157, sel_getStateForSetting_, 6);

    *(Swift::String *)(v152 + 32) = v156;
    *(_QWORD *)(v152 + 48) = 0;
    *(_QWORD *)(v152 + 56) = 0;
    *(_BYTE *)(v152 + 64) = (_BYTE)v147;
    *(_QWORD *)(v152 + 72) = 0xD000000000000013;
    *(_QWORD *)(v152 + 80) = 0x80000002422CFBE0;
    v158 = v171;
    v159 = v171;
    v160 = v169;
    v161 = v169;
    v162 = specialized AppSettingsOptionGroup.init(appSettings:header:footer:)(v152, v158, v160);
    v164 = v163;
    v166 = v165;

    v151[10] = v162;
    v151[11] = v164;
    v151[12] = v166;

    return v151;
  }
  result = objc_msgSend(v4, sel_privacyFlow);
  if (result)
  {
    v13 = result;
    v14 = objc_msgSend(result, sel_localizedButtonTitle);

    if (v14)
    {
      v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v9 = v16;

    }
    else
    {
      v15 = 0;
      v9 = 0xE000000000000000;
    }
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

void MOSuggestionSheetOnboardingSettingsViewController.__allocating_init(coder:)()
{
  objc_class *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = objc_allocWithZone(v0);
  v2 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_onboardingManager;
  *(_QWORD *)&v1[v2] = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  *(_QWORD *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_delegate] = 0;
  v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_hasTappedOnboardingCompletion] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_turnOnSuggestionsButton] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_backButton] = 0;
  v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_wasSwitchDisabled] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeight] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeightConstraint] = 0;
  v3 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings;
  *(_QWORD *)&v1[v3] = closure #1 in variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.journalingSuggestionsSettings();

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void MOSuggestionSheetOnboardingSettingsViewController.init(coder:)()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_onboardingManager;
  *(_QWORD *)&v0[v1] = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  *(_QWORD *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_delegate] = 0;
  v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_hasTappedOnboardingCompletion] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_turnOnSuggestionsButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_backButton] = 0;
  v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_wasSwitchDisabled] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeight] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeightConstraint] = 0;
  v2 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings;
  *(_QWORD *)&v0[v2] = closure #1 in variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.journalingSuggestionsSettings();

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id MOSuggestionSheetOnboardingSettingsViewController.__allocating_init()()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return MOSuggestionSheetOnboardingSettingsViewController.init()();
}

id MOSuggestionSheetOnboardingSettingsViewController.init()()
{
  char *v0;
  uint64_t v1;
  void *v2;
  char *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t ObjCClassFromMetadata;
  void *v7;
  id v8;
  Swift::String v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  id v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  void *v17;
  id v18;
  id v19;
  id result;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;
  Swift::String v27;
  Swift::String v28;

  v1 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_onboardingManager;
  v2 = (void *)objc_opt_self();
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_sharedInstance);
  *(_QWORD *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_delegate] = 0;
  v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_hasTappedOnboardingCompletion] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_turnOnSuggestionsButton] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_backButton] = 0;
  v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_wasSwitchDisabled] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeight] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeightConstraint] = 0;
  v4 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings;
  *(_QWORD *)&v3[v4] = closure #1 in variable initialization expression of MOSuggestionSheetOnboardingSettingsViewController.journalingSuggestionsSettings();

  v5 = (objc_class *)type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v27._countAndFlagsBits = 0xD00000000000004ALL;
  v27._object = (void *)0x80000002422CED60;
  v9._object = (void *)0x80000002422CED40;
  v9._countAndFlagsBits = 0xD000000000000015;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  v11 = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, (Swift::String_optional)0, (NSBundle)v8, v10, v27);

  v12 = (void *)MEMORY[0x2426A69DC](v11._countAndFlagsBits, v11._object);
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v28._countAndFlagsBits = 0xD00000000000003FLL;
  v14._countAndFlagsBits = 0xD000000000000041;
  v28._object = (void *)0x80000002422CEE00;
  v14._object = (void *)0x80000002422CEDB0;
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  v16 = NSLocalizedString(_:tableName:bundle:value:comment:)(v14, (Swift::String_optional)0, (NSBundle)v13, v15, v28);

  v17 = (void *)MEMORY[0x2426A69DC](v16._countAndFlagsBits, v16._object);
  swift_bridgeObjectRelease();
  v26.receiver = v3;
  v26.super_class = v5;
  v18 = objc_msgSendSuper2(&v26, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v12, v17, 0, 0);

  v19 = v18;
  result = objc_msgSend(v19, sel_view);
  if (result)
  {
    v21 = result;
    v22 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    objc_msgSend(v21, sel_setBackgroundColor_, v22);

    v23 = objc_allocWithZone(MEMORY[0x24BEBD9F0]);
    v24 = v19;
    v25 = objc_msgSend(v23, sel_initWithFrame_style_, 2, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v24, sel_setTableView_, v25);

    MOSuggestionSheetOnboardingSettingsViewController.loadSettingsController()();
    return v24;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController()
{
  return objc_opt_self();
}

Swift::Void __swiftcall MOSuggestionSheetOnboardingSettingsViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  _QWORD *v1;
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  void *v8;
  uint64_t ObjCClassFromMetadata;
  id v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  objc_super v27;
  Swift::String v28;

  v27.receiver = v1;
  v27.super_class = (Class)type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  objc_msgSendSuper2(&v27, sel_viewDidAppear_, a1);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD410]), sel_init);
  v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v5 = (*(uint64_t (**)(id))((*MEMORY[0x24BEE4EA0] & *v1) + 0xE8))(v3);
  v6 = *(uint64_t (**)(void))((*v4 & *v1) + 0xE0);
  v7 = ((uint64_t (*)(uint64_t))v6)(v5);
  if (v7)
  {
    v8 = (void *)v7;
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v28._object = (void *)0x80000002422CEE40;
    v11._countAndFlagsBits = 1801675074;
    v11._object = (void *)0xE400000000000000;
    v12._countAndFlagsBits = 0;
    v12._object = (void *)0xE000000000000000;
    v28._countAndFlagsBits = 0xD000000000000038;
    v13 = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, (Swift::String_optional)0, (NSBundle)v10, v12, v28);

    v14 = (void *)MEMORY[0x2426A69DC](v13._countAndFlagsBits, v13._object);
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setTitle_, v14);

  }
  v15 = objc_msgSend(v1, sel_contentView);
  v16 = (void *)objc_opt_self();
  v17 = objc_msgSend(v16, sel_systemBlueColor);
  objc_msgSend(v15, sel_setTintColor_, v17);

  v18 = objc_msgSend(v1, sel_navigationController);
  if (v18)
  {
    v19 = v18;
    v20 = objc_msgSend(v18, sel_navigationBar);

    v21 = objc_msgSend(v20, sel_backItem);
    if (v21)
    {
      v22 = (void *)v6();
      objc_msgSend(v21, sel_setBackBarButtonItem_, v22);

    }
  }
  v23 = objc_msgSend(v1, sel_navigationController);
  if (v23)
  {
    v24 = v23;
    v25 = objc_msgSend(v23, sel_navigationBar);

    v26 = objc_msgSend(v16, sel_systemBlueColor);
    objc_msgSend(v25, sel_setTintColor_, v26);

  }
}

Swift::Void __swiftcall MOSuggestionSheetOnboardingSettingsViewController.viewDidLoad()()
{
  MOSuggestionSheetOnboardingSettingsViewController.viewDidLoad()((SEL *)&selRef_viewDidLoad);
}

Swift::Void __swiftcall MOSuggestionSheetOnboardingSettingsViewController.viewDidLayoutSubviews()()
{
  char *v0;
  uint64_t v1;
  double v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  objc_super v32;

  v1 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeight;
  v2 = *(double *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeight];
  v3 = objc_msgSend(v0, sel_tableView);
  if (!v3)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v4 = v3;
  objc_msgSend(v3, sel_contentSize);
  v6 = v5;

  if (v2 == v6)
  {
LABEL_9:
    v32.receiver = v0;
    v32.super_class = (Class)type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
    objc_msgSendSuper2(&v32, sel_viewDidLayoutSubviews);
    return;
  }
  v7 = objc_msgSend(v0, sel_tableView);
  if (!v7)
    goto LABEL_16;
  v8 = v7;
  objc_msgSend(v7, sel_contentSize);
  v10 = v9;

  *(_QWORD *)&v0[v1] = v10;
  v11 = objc_msgSend(v0, sel_tableView);
  if (!v11)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v12 = v11;
  objc_msgSend(v11, sel_reloadData);

  v13 = objc_msgSend(v0, sel_view);
  if (!v13)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v14 = v13;
  objc_msgSend(v13, sel_layoutIfNeeded);

  v15 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeightConstraint;
  v16 = *(void **)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeightConstraint];
  if (v16)
    goto LABEL_7;
  v22 = objc_msgSend(v0, sel_tableView);
  if (!v22)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v23 = v22;
  v24 = objc_msgSend(v22, sel_heightAnchor);

  v25 = objc_msgSend(v0, sel_tableView);
  if (v25)
  {
    v26 = v25;
    objc_msgSend(v25, sel_contentSize);
    v28 = v27;

    v29 = objc_msgSend(v24, sel_constraintEqualToConstant_, v28);
    v30 = *(void **)&v0[v15];
    *(_QWORD *)&v0[v15] = v29;

    v31 = *(void **)&v0[v15];
    if (!v31)
      goto LABEL_9;
    objc_msgSend(v31, sel_setActive_, 1);
    v16 = *(void **)&v0[v15];
    if (!v16)
      goto LABEL_9;
LABEL_7:
    v17 = v16;
    v18 = objc_msgSend(v0, sel_tableView);
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v18, sel_contentSize);
      v21 = v20;

      objc_msgSend(v17, sel_setConstant_, v21);
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_21:
  __break(1u);
}

void MOSuggestionSheetOnboardingSettingsViewController.switchChanged(_:section:)(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  Class isa;
  id v13;
  _QWORD *v14;
  void (*v15)(id);
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(v3, sel_tableView);
  if (v10)
  {
    v11 = v10;
    MEMORY[0x2426A6910](objc_msgSend(a1, sel_tag), a2);
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v13 = objc_msgSend(v11, sel_cellForRowAtIndexPath_, isa);

    if (v13)
    {
      type metadata accessor for SwitchCell();
      v14 = (_QWORD *)swift_dynamicCastClass();
      if (v14)
      {
        v15 = (void (*)(id))(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v14) + 0x58))();
        if (v15)
        {
          v16 = (uint64_t)v15;
          v15(objc_msgSend(a1, sel_isOn));
          outlined consume of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(v16);
        }
      }

    }
  }
  else
  {
    __break(1u);
  }
}

void MOSuggestionSheetOnboardingSettingsViewController.setSelectionValue(settingsType:isSwitchOn:)(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  uint64_t ObjCClassFromMetadata;
  void *v8;
  id v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  char v14;
  id v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  void *v19;
  id v20;
  unsigned int v21;
  char v22;
  void *v23;
  id v24;
  unsigned int v25;
  id v26;
  Swift::String v27;
  Swift::String v28;
  Swift::String v29;
  char v30;
  void *v31;
  id v32;
  unsigned int v33;
  id v34;
  Swift::String v35;
  Swift::String v36;
  Swift::String v37;
  char v38;
  void *v39;
  id v40;
  unsigned int v41;
  id v42;
  Swift::String v43;
  Swift::String v44;
  Swift::String v45;
  char v46;
  void *v47;
  id v48;
  unsigned int v49;
  id v50;
  Swift::String v51;
  Swift::String v52;
  Swift::String v53;
  char v54;
  void *v55;
  id v56;
  unsigned int v57;
  id v58;
  Swift::String v59;
  Swift::String v60;
  Swift::String v61;
  char v62;
  void *v63;
  id v64;
  unsigned int v65;
  id v66;
  Swift::String v67;
  Swift::String v68;
  Swift::String v69;
  char v70;
  void *v71;
  id v72;
  unsigned int v73;
  id v74;
  Swift::String v75;
  Swift::String v76;
  Swift::String v77;
  Swift::String v78;
  Swift::String v79;
  Swift::String v80;
  Swift::String v81;
  Swift::String v82;

  if (!a2)
    return;
  type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v8 = (void *)objc_opt_self();
  v9 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v75._countAndFlagsBits = 0xD000000000000043;
  v75._object = (void *)0x80000002422CF230;
  v10._countAndFlagsBits = 0x7974697669746341;
  v10._object = (void *)0xE800000000000000;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, (Swift::String_optional)0, (NSBundle)v9, v11, v75);

  if (v12._countAndFlagsBits == a1 && v12._object == a2)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    v19 = (void *)objc_opt_self();
    v20 = objc_msgSend(v19, sel_sharedInstance);
    v21 = objc_msgSend(v20, sel_getStateForSetting_, 1);

    if (v21 && (a3 & 1) == 0)
      (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x100))(1);
    v74 = objc_msgSend(v19, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 1);
    goto LABEL_15;
  }
  v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0)
    goto LABEL_11;
  v15 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v76._countAndFlagsBits = 0xD000000000000046;
  v76._object = (void *)0x80000002422CF280;
  v16._countAndFlagsBits = 0x616964654DLL;
  v16._object = (void *)0xE500000000000000;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  v18 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v76);

  if (v18._countAndFlagsBits == a1 && v18._object == a2)
  {
    swift_bridgeObjectRelease();
LABEL_17:
    v23 = (void *)objc_opt_self();
    v24 = objc_msgSend(v23, sel_sharedInstance);
    v25 = objc_msgSend(v24, sel_getStateForSetting_, 2);

    if (v25)
    {
      if ((a3 & 1) == 0)
        (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x100))(1);
    }
    v74 = objc_msgSend(v23, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 2);
LABEL_15:

    return;
  }
  v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v22 & 1) != 0)
    goto LABEL_17;
  v26 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v77._countAndFlagsBits = 0xD000000000000065;
  v77._object = (void *)0x80000002422CF2D0;
  v27._countAndFlagsBits = 0x73746361746E6F43;
  v27._object = (void *)0xE800000000000000;
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  v29 = NSLocalizedString(_:tableName:bundle:value:comment:)(v27, (Swift::String_optional)0, (NSBundle)v26, v28, v77);

  if (v29._countAndFlagsBits == a1 && v29._object == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v30 & 1) != 0)
  {
LABEL_25:
    v31 = (void *)objc_opt_self();
    v32 = objc_msgSend(v31, sel_sharedInstance);
    v33 = objc_msgSend(v32, sel_getStateForSetting_, 3);

    if (v33 && (a3 & 1) == 0)
      (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x100))(1);
    v74 = objc_msgSend(v31, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 3);
    goto LABEL_15;
  }
  v34 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v78._countAndFlagsBits = 0xD000000000000039;
  v78._object = (void *)0x80000002422CF340;
  v35._countAndFlagsBits = 0x736F746F6850;
  v35._object = (void *)0xE600000000000000;
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  v37 = NSLocalizedString(_:tableName:bundle:value:comment:)(v35, (Swift::String_optional)0, (NSBundle)v34, v36, v78);

  if (v37._countAndFlagsBits == a1 && v37._object == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  v38 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v38 & 1) != 0)
  {
LABEL_33:
    v39 = (void *)objc_opt_self();
    v40 = objc_msgSend(v39, sel_sharedInstance);
    v41 = objc_msgSend(v40, sel_getStateForSetting_, 4);

    if (v41 && (a3 & 1) == 0)
      (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x100))(1);
    v74 = objc_msgSend(v39, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 4);
    goto LABEL_15;
  }
  v42 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v43._countAndFlagsBits = 0xD000000000000015;
  v79._countAndFlagsBits = 0xD00000000000004FLL;
  v79._object = (void *)0x80000002422CF3A0;
  v43._object = (void *)0x80000002422CF380;
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  v45 = NSLocalizedString(_:tableName:bundle:value:comment:)(v43, (Swift::String_optional)0, (NSBundle)v42, v44, v79);

  if (v45._countAndFlagsBits == a1 && v45._object == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v46 & 1) != 0)
  {
LABEL_41:
    v47 = (void *)objc_opt_self();
    v48 = objc_msgSend(v47, sel_sharedInstance);
    v49 = objc_msgSend(v48, sel_getStateForSetting_, 5);

    if (v49 && (a3 & 1) == 0)
      (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x100))(1);
    v74 = objc_msgSend(v47, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 5);
    goto LABEL_15;
  }
  v50 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v80._object = (void *)0x80000002422CF3F0;
  v51._countAndFlagsBits = 0x666F206574617453;
  v51._object = (void *)0xED0000646E694D20;
  v52._countAndFlagsBits = 0;
  v52._object = (void *)0xE000000000000000;
  v80._countAndFlagsBits = 0xD000000000000048;
  v53 = NSLocalizedString(_:tableName:bundle:value:comment:)(v51, (Swift::String_optional)0, (NSBundle)v50, v52, v80);

  if (v53._countAndFlagsBits == a1 && v53._object == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_49;
  }
  v54 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v54 & 1) != 0)
  {
LABEL_49:
    v55 = (void *)objc_opt_self();
    v56 = objc_msgSend(v55, sel_sharedInstance);
    v57 = objc_msgSend(v56, sel_getStateForSetting_, 9);

    if (v57 && (a3 & 1) == 0)
      (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x100))(1);
    v74 = objc_msgSend(v55, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 9);
    goto LABEL_15;
  }
  v58 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v59._countAndFlagsBits = 0xD000000000000012;
  v81._object = (void *)0x80000002422CF3F0;
  v59._object = (void *)0x80000002422CF440;
  v60._countAndFlagsBits = 0;
  v60._object = (void *)0xE000000000000000;
  v81._countAndFlagsBits = 0xD000000000000048;
  v61 = NSLocalizedString(_:tableName:bundle:value:comment:)(v59, (Swift::String_optional)0, (NSBundle)v58, v60, v81);

  if (v61._countAndFlagsBits == a1 && v61._object == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_57;
  }
  v62 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v62 & 1) != 0)
  {
LABEL_57:
    v63 = (void *)objc_opt_self();
    v64 = objc_msgSend(v63, sel_sharedInstance);
    v65 = objc_msgSend(v64, sel_getStateForSetting_, 10);

    if (v65 && (a3 & 1) == 0)
      (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x100))(1);
    v74 = objc_msgSend(v63, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 10);
    goto LABEL_15;
  }
  v66 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  v67._countAndFlagsBits = 0xD000000000000020;
  v82._countAndFlagsBits = 0xD000000000000042;
  v82._object = (void *)0x80000002422CF490;
  v67._object = (void *)0x80000002422CF460;
  v68._countAndFlagsBits = 0;
  v68._object = (void *)0xE000000000000000;
  v69 = NSLocalizedString(_:tableName:bundle:value:comment:)(v67, (Swift::String_optional)0, (NSBundle)v66, v68, v82);

  if (v69._countAndFlagsBits == a1 && v69._object == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_65;
  }
  v70 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v70 & 1) != 0)
  {
LABEL_65:
    v71 = (void *)objc_opt_self();
    v72 = objc_msgSend(v71, sel_sharedInstance);
    v73 = objc_msgSend(v72, sel_getStateForSetting_, 6);

    if (v73 && (a3 & 1) == 0)
      (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x100))(1);
    v74 = objc_msgSend(v71, sel_sharedInstance);
    objc_msgSend(v74, sel_setState_forSetting_, a3 & 1, 6);
    goto LABEL_15;
  }
}

void MOSuggestionSheetOnboardingSettingsViewController.requestNotificationPermissions(completion:)(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v4 = objc_allocWithZone(MEMORY[0x24BDF88B8]);
  v5 = (void *)MEMORY[0x2426A69DC](0xD000000000000026, 0x80000002422CEE80);
  v6 = objc_msgSend(v4, sel_initWithBundleIdentifier_, v5);

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  v9[4] = partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.requestNotificationPermissions(completion:);
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ();
  v9[3] = &block_descriptor;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_requestAuthorizationWithOptions_completionHandler_, 6, v8);

  _Block_release(v8);
}

void thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void MOSuggestionSheetOnboardingSettingsViewController.loadSettingsController()()
{
  _QWORD *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat Width;
  id v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  CGFloat Height;
  id v47;
  void *v48;
  id v49;
  void *v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  uint64_t ObjCClassFromMetadata;
  id v56;
  Swift::String v57;
  Swift::String v58;
  Swift::String v59;
  id v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t (*v63)(void);
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  Swift::String v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v1 = objc_msgSend(v0, sel_contentView);
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_systemBackgroundColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v3);

  v4 = objc_msgSend(v0, sel_tableView);
  if (!v4)
  {
    __break(1u);
    goto LABEL_23;
  }
  v5 = v4;
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v5, sel_setTableHeaderView_, v6);

  v7 = objc_msgSend(v0, sel_tableView);
  if (!v7)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = v7;
  objc_msgSend(v7, sel_setDelegate_, v0);

  v9 = objc_msgSend(v0, sel_tableView);
  if (!v9)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v10 = v9;
  objc_msgSend(v9, sel_setDataSource_, v0);

  v11 = objc_msgSend(v0, sel_tableView);
  if (!v11)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v12 = v11;
  v13 = objc_msgSend(v2, sel_clearColor);
  objc_msgSend(v12, sel_setBackgroundColor_, v13);

  v14 = objc_msgSend(v0, sel_tableView);
  if (!v14)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v15 = v14;
  objc_msgSend(v14, sel_setShowsVerticalScrollIndicator_, 0);

  v16 = objc_msgSend(v0, sel_tableView);
  if (!v16)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v17 = v16;
  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v18 = objc_msgSend(v0, sel_tableView);
  if (!v18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v19 = v18;
  v20 = objc_msgSend(v18, sel_layer);

  objc_msgSend(v20, sel_setCornerRadius_, 10.0);
  v21 = objc_msgSend(v0, sel_tableView);
  if (!v21)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v22 = v21;
  objc_msgSend(v21, sel_setAutomaticallyAdjustsScrollIndicatorInsets_, 0);

  v23 = objc_msgSend(v0, sel_tableView);
  if (!v23)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v24 = v23;
  objc_msgSend(v23, sel_setContentInsetAdjustmentBehavior_, 2);

  v25 = objc_msgSend(v0, sel_view);
  if (!v25)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v26 = v25;
  objc_msgSend(v25, sel_bounds);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v78.origin.x = v28;
  v78.origin.y = v30;
  v78.size.width = v32;
  v78.size.height = v34;
  Width = CGRectGetWidth(v78);
  v36 = objc_msgSend(v0, sel_view);
  if (!v36)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v37 = v36;
  objc_msgSend(v36, sel_bounds);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;

  v79.origin.x = v39;
  v79.origin.y = v41;
  v79.size.width = v43;
  v79.size.height = v45;
  Height = CGRectGetHeight(v79);
  v47 = objc_msgSend(v0, sel_tableView);
  if (!v47)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v48 = v47;
  v49 = objc_msgSend(v0, sel_view);
  if (!v49)
  {
LABEL_34:
    __break(1u);
    return;
  }
  v50 = v49;
  objc_msgSend(v49, sel_bounds);
  v52 = v51;
  v54 = v53;

  v80.origin.x = v52;
  v80.origin.y = v54;
  v80.size.width = Width;
  v80.size.height = Height;
  v81 = CGRectOffset(v80, 0.0, 16.0);
  objc_msgSend(v48, sel_setFrame_, v81.origin.x, v81.origin.y, v81.size.width, v81.size.height);

  type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v56 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v77._countAndFlagsBits = 0xD00000000000002DLL;
  v77._object = (void *)0x80000002422CF580;
  v57._object = (void *)0x80000002422CF560;
  v57._countAndFlagsBits = 0xD00000000000001ELL;
  v58._countAndFlagsBits = 0;
  v58._object = (void *)0xE000000000000000;
  v59 = NSLocalizedString(_:tableName:bundle:value:comment:)(v57, (Swift::String_optional)0, (NSBundle)v56, v58, v77);

  v60 = objc_msgSend((id)objc_opt_self(), sel_boldButton);
  v61 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v62 = (*(uint64_t (**)(id))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))(v60);
  v63 = *(uint64_t (**)(void))((*v61 & *v0) + 0xC8);
  v64 = ((uint64_t (*)(uint64_t))v63)(v62);
  if (!v64)
  {
    v75 = swift_bridgeObjectRelease();
    v67 = (void *)((uint64_t (*)(uint64_t))v63)(v75);
    if (!v67)
      goto LABEL_17;
    goto LABEL_16;
  }
  v65 = (void *)v64;
  v66 = (void *)MEMORY[0x2426A69DC](v59._countAndFlagsBits, v59._object);
  swift_bridgeObjectRelease();
  objc_msgSend(v65, sel_setTitle_forState_, v66, 0);

  v67 = (void *)v63();
  if (v67)
  {
LABEL_16:
    v68 = v67;
    objc_msgSend(v67, sel_addTarget_action_forControlEvents_, v0, sel_completeOnboardingTapped, 64);

  }
LABEL_17:
  v69 = objc_msgSend(v0, sel_buttonTray);
  v70 = objc_msgSend(v2, sel_systemBlueColor);
  objc_msgSend(v69, sel_setTintColor_, v70);

  v71 = v63();
  if (v71)
  {
    v72 = (void *)v71;
    v73 = objc_msgSend(v0, sel_buttonTray);
    objc_msgSend(v73, sel_addButton_, v72);

  }
  v74 = objc_msgSend(v0, sel_buttonTray);
  v76 = objc_msgSend(v2, sel_systemBackgroundColor);
  objc_msgSend(v74, sel_setBackgroundColor_, v76);

}

Swift::Void __swiftcall MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void (*v17)(uint64_t (*)(), uint64_t);
  _QWORD *v18;

  v1 = v0;
  if (one-time initialization token for shared != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static MOOnboardingSettingsLogger.shared);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2422B0000, v3, v4, "[MOSuggestionSheetOnboardingSettingsViewController] Turn on Journaling Suggestions tapped", v5, 2u);
    MEMORY[0x2426A712C](v5, -1, -1);
  }

  v6 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0xB0))() & 1) == 0)
  {
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2422B0000, v7, v8, "[MOSuggestionSheetOnboardingSettingsViewController] Haven't tapped Turn on Journaling Suggestions before; procee"
        "d with sheet dismissal",
        v9,
        2u);
      MEMORY[0x2426A712C](v9, -1, -1);
    }

    v10 = (*(uint64_t (**)(uint64_t))((*v6 & *v1) + 0xB8))(1);
    v11 = (void *)(*(uint64_t (**)(uint64_t))((*v6 & *v1) + 0xC8))(v10);
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, sel_setEnabled_, 0);

    }
    v13 = objc_msgSend(v1, sel_navigationController);
    if (v13)
    {
      v14 = v13;
      v15 = objc_msgSend(v13, sel_navigationBar);

      objc_msgSend(v15, sel_setUserInteractionEnabled_, 0);
    }
    objc_msgSend(*(id *)((char *)v1+ OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_onboardingManager), sel_setOnboardingFlowCompletionStatus_, 2);
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v1;
    v17 = *(void (**)(uint64_t (*)(), uint64_t))((*v6 & *v1) + 0x178);
    v18 = v1;
    v17(partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped(), v16);
    swift_release();
  }
}

uint64_t closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[6];

  v0 = type metadata accessor for DispatchWorkItemFlags();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v2 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UIFont(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  v9 = (void *)static OS_dispatch_queue.main.getter();
  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = partial apply for closure #1 in closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped();
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_13;
  v11 = _Block_copy(aBlock);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, v1, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x2426A6A78](0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void closure #1 in closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = (_QWORD *)MEMORY[0x2426A7174](v1);
  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (v2)
  {
    v4 = v2;
    v5 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v2) + 0x98))();

    if (v5)
    {
      objc_msgSend(v5, sel_shouldDismissOnboarding);
      swift_unknownObjectRelease();
    }
  }
  swift_beginAccess();
  v6 = (_QWORD *)MEMORY[0x2426A7174](v1);
  if (v6)
  {
    v7 = v6;
    v8 = (*(uint64_t (**)(void))((*v3 & *v6) + 0xF8))();

    if ((v8 & 1) != 0)
    {
      v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE68E80]), sel_init);
      v10 = (void *)MEMORY[0x2426A69DC](0xD00000000000002ALL, 0x80000002422CF510);
      v12[4] = closure #1 in closure #1 in closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped();
      v12[5] = 0;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 1107296256;
      v12[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
      v12[3] = &block_descriptor_16;
      v11 = _Block_copy(v12);
      objc_msgSend(v9, sel_triggerFeedbackAssistantFlow_handler_, v10, v11);
      _Block_release(v11);

    }
  }
}

id MOSuggestionSheetOnboardingSettingsViewController.__allocating_init(title:detailText:symbolName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v11 = (void *)MEMORY[0x2426A69DC]();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    v12 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = (void *)MEMORY[0x2426A69DC](a3, a4);
  swift_bridgeObjectRelease();
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v13 = (void *)MEMORY[0x2426A69DC](a5, a6);
  swift_bridgeObjectRelease();
LABEL_6:
  v14 = objc_msgSend(objc_allocWithZone(v6), sel_initWithTitle_detailText_symbolName_, v11, v12, v13);

  return v14;
}

void MOSuggestionSheetOnboardingSettingsViewController.init(title:detailText:symbolName:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MOSuggestionSheetOnboardingSettingsViewController.__allocating_init(title:detailText:icon:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  objc_class *v5;
  objc_class *v6;
  void *v10;
  void *v11;
  id v12;

  v6 = v5;
  v10 = (void *)MEMORY[0x2426A69DC]();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v11 = (void *)MEMORY[0x2426A69DC](a3, a4);
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend(objc_allocWithZone(v6), sel_initWithTitle_detailText_icon_, v10, v11, a5);

  return v12;
}

void MOSuggestionSheetOnboardingSettingsViewController.init(title:detailText:icon:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MOSuggestionSheetOnboardingSettingsViewController.__allocating_init(title:detailText:symbolName:adoptTableViewScrollView:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  objc_class *v7;
  objc_class *v8;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = v7;
  v14 = (void *)MEMORY[0x2426A69DC]();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    v15 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v15 = (void *)MEMORY[0x2426A69DC](a3, a4);
  swift_bridgeObjectRelease();
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v16 = (void *)MEMORY[0x2426A69DC](a5, a6);
  swift_bridgeObjectRelease();
LABEL_6:
  v17 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v14, v15, v16, a7 & 1);

  return v17;
}

void MOSuggestionSheetOnboardingSettingsViewController.init(title:detailText:symbolName:adoptTableViewScrollView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MOSuggestionSheetOnboardingSettingsViewController.__allocating_init(title:detailText:icon:adoptTableViewScrollView:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, char a6)
{
  objc_class *v6;
  objc_class *v7;
  void *v12;
  void *v13;
  id v14;

  v7 = v6;
  v12 = (void *)MEMORY[0x2426A69DC]();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v13 = (void *)MEMORY[0x2426A69DC](a3, a4);
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v12, v13, a5, a6 & 1);

  return v14;
}

void MOSuggestionSheetOnboardingSettingsViewController.init(title:detailText:icon:adoptTableViewScrollView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MOSuggestionSheetOnboardingSettingsViewController.__deallocating_deinit()
{
  return MOSuggestionSheetOnboardingSettingsViewController.viewDidLoad()((SEL *)&selRef_dealloc);
}

id MOSuggestionSheetOnboardingSettingsViewController.viewDidLoad()(SEL *a1)
{
  void *v1;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  return objc_msgSendSuper2(&v4, *a1);
}

void one-time initialization function for margin()
{
  margin = 0x4020000000000000;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<NSAttributedStringKey, UIFont>);
  v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
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

uint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  Swift::Int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  _OWORD v31[4];
  _OWORD v32[2];
  _OWORD v33[3];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<NSAttributedStringKey, Any>);
    v2 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v29 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v30 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v30 << 6);
      goto LABEL_28;
    }
    v11 = v30 + 1;
    if (__OFADD__(v30, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v28)
      goto LABEL_37;
    v12 = *(_QWORD *)(v29 + 8 * v11);
    v13 = v30 + 1;
    if (!v12)
    {
      v13 = v30 + 2;
      if (v30 + 2 >= v28)
        goto LABEL_37;
      v12 = *(_QWORD *)(v29 + 8 * v13);
      if (!v12)
      {
        v13 = v30 + 3;
        if (v30 + 3 >= v28)
          goto LABEL_37;
        v12 = *(_QWORD *)(v29 + 8 * v13);
        if (!v12)
        {
          v13 = v30 + 4;
          if (v30 + 4 >= v28)
            goto LABEL_37;
          v12 = *(_QWORD *)(v29 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v30 = v13;
LABEL_28:
    v16 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v10);
    *(_QWORD *)&v33[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10);
    v15 = *(void **)&v33[0];
    *(_QWORD *)&v32[0] = v16;
    type metadata accessor for UIFont(0, &lazy cache variable for type metadata for UIFont);
    v17 = v15;
    v18 = v16;
    swift_dynamicCast();
    v19 = *(_QWORD *)&v33[0];
    outlined init with take of Any((_OWORD *)((char *)v33 + 8), v31);
    outlined init with take of Any(v31, v33);
    outlined init with take of Any(v33, v32);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    String.hash(into:)();
    v20 = Hasher._finalize()();
    result = swift_bridgeObjectRelease();
    v21 = -1 << *(_BYTE *)(v2 + 32);
    v22 = v20 & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v6 + 8 * (v22 >> 6))) != 0)
    {
      v8 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v6 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v6 + 8 * v23);
      }
      while (v27 == -1);
      v8 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v19;
    result = (uint64_t)outlined init with take of Any(v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v8));
    ++*(_QWORD *)(v2 + 16);
  }
  v14 = v30 + 5;
  if (v30 + 5 >= v28)
  {
LABEL_37:
    swift_release();
    outlined consume of [NSAttributedStringKey : UIFont].Iterator._Variant();
    return v2;
  }
  v12 = *(_QWORD *)(v29 + 8 * v14);
  if (v12)
  {
    v13 = v30 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v28)
      goto LABEL_37;
    v12 = *(_QWORD *)(v29 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

Swift::Int __swiftcall MOSuggestionSheetOnboardingSettingsViewController.numberOfSections(in:)(UITableView *in)
{
  uint64_t v1;

  return *(_QWORD *)(*(_QWORD *)(v1
                               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings)
                   + 16);
}

void MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForHeaderInSection:)(uint64_t a1, unint64_t a2)
{
  specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForHeaderInSection:)(a2);
}

void __swiftcall MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForHeaderInSection:)(UIView_optional *__return_ptr retstr, UITableView *_, Swift::Int viewForHeaderInSection)
{
  specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForHeaderInSection:)(viewForHeaderInSection);
}

id MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForRowAt:)(void *a1)
{
  return objc_msgSend(a1, sel_estimatedRowHeight);
}

void MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForFooterInSection:)(uint64_t a1, unint64_t a2)
{
  specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForFooterInSection:)(a2);
}

void __swiftcall MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForFooterInSection:)(UIView_optional *__return_ptr retstr, UITableView *_, Swift::Int viewForFooterInSection)
{
  specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForFooterInSection:)(viewForFooterInSection);
}

Swift::Int __swiftcall MOSuggestionSheetOnboardingSettingsViewController.tableView(_:numberOfRowsInSection:)(Swift::Int _, Swift::Int numberOfRowsInSection)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (numberOfRowsInSection < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  v3 = *(_QWORD *)(v2
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings);
  if (*(_QWORD *)(v3 + 16) <= (unint64_t)numberOfRowsInSection)
  {
LABEL_7:
    __break(1u);
    return _;
  }
  v4 = *(_QWORD *)(v3 + 24 * numberOfRowsInSection + 32);
  if (v4)
    return *(_QWORD *)(v4 + 16);
  else
    return 0;
}

_QWORD *MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)()
{
  return specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)();
}

void closure #1 in MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a2 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x2426A7174](v5);
  if (v6)
  {
    v7 = (void *)v6;
    outlined init with take of AppSetting?(a3, (uint64_t)&v9);
    if (v10)
      v8 = v9;
    else
      v8 = 0;
    MOSuggestionSheetOnboardingSettingsViewController.setSelectionValue(settingsType:isSwitchOn:)(v8, v10, a1 & 1);

  }
}

uint64_t MOSuggestionSheetOnboardingSettingsViewController.textView(_:shouldInteractWith:in:interaction:)()
{
  return specialized MOSuggestionSheetOnboardingSettingsViewController.textView(_:shouldInteractWith:in:interaction:)();
}

uint64_t variable initialization expression of MOOnboardingNavigationController.onboardingDelegate()
{
  return 0;
}

uint64_t variable initialization expression of MOOnboardingViewController.delegate()
{
  return 0;
}

unint64_t variable initialization expression of MOOnboardingViewController.journalBundleAboutIdentifier()
{
  return 0xD00000000000001CLL;
}

uint64_t variable initialization expression of MOOnboardingViewController.hasTappedOnboardingCompletion()
{
  return 0;
}

uint64_t variable initialization expression of MOOnboardingViewController.turnOnSuggestionsButton()
{
  return 0;
}

uint64_t variable initialization expression of MOOnboardingViewController.notNowButton()
{
  return 0;
}

uint64_t variable initialization expression of SwitchCell.onSwitchChange()
{
  return 0;
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance NSAttributedStringKey(uint64_t a1, id *a2)
{
  uint64_t result;

  result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance NSAttributedStringKey(uint64_t a1, id *a2)
{
  char v3;

  v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance NSAttributedStringKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = MEMORY[0x2426A69DC](v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance NSAttributedStringKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSAttributedStringKey(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NSAttributedStringKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NSAttributedStringKey()
{
  Swift::Int v0;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2422C4740()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.requestNotificationPermissions(completion:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD))(v2 + 16))((a2 == 0) & a1);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2422C47C0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()()
{
  return closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSAttributedStringKey()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3)
    v5 = 1;
  else
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance NSAttributedStringKey@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = MEMORY[0x2426A69DC](*a1, a1[1]);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSAttributedStringKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NSAttributedStringKey()
{
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  Swift::Int v2;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16)
            break;
          v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

double specialized static MOSuggestionSheetOnboardingSettingsViewController.calculateLabelHeight(width:font:text:)(void *a1, uint64_t a2, unint64_t a3, double a4)
{
  uint64_t v4;
  double v5;
  uint64_t inited;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  Class isa;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGRect v26;

  v4 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v4 = a2 & 0xFFFFFFFFFFFFLL;
  v5 = 0.0;
  if (v4 && (a2 || a3 != 0xE000000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, UIFont)>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2422CD1D0;
    v11 = (void *)*MEMORY[0x24BEBB360];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
    *(_QWORD *)(inited + 40) = a1;
    v12 = v11;
    v13 = a1;
    v14 = specialized Dictionary.init(dictionaryLiteral:)(inited);
    objc_msgSend(v13, sel_pointSize);
    v15 = (void *)MEMORY[0x2426A69DC](a2, a3);
    specialized _dictionaryUpCast<A, B, C, D>(_:)(v14);
    swift_bridgeObjectRelease();
    type metadata accessor for NSAttributedStringKey();
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_boundingRectWithSize_options_attributes_context_, 3, isa, 0, a4, 1.79769313e308);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v26.origin.x = v18;
    v26.origin.y = v20;
    v26.size.width = v22;
    v26.size.height = v24;
    return ceil(CGRectGetHeight(v26));
  }
  return v5;
}

void specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForHeaderInSection:)(unint64_t a1)
{
  id v1;
  char *v2;
  void *v3;
  double Width;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  CGRect v23;

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  v5 = *(_QWORD *)&v2[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings];
  if (*(_QWORD *)(v5 + 16) <= a1)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    swift_once();
LABEL_5:
    v16 = *(double *)&margin;
    v17 = objc_msgSend(v1, sel_font);
    if (v17)
    {
      if (!v3)
        goto LABEL_11;
    }
    else
    {
      v17 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE1F0]);
      if (!v3)
        goto LABEL_11;
    }
    v18 = objc_msgSend(v1, sel_text);
    if (v18)
    {
      v19 = v18;
      v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v22 = v21;

LABEL_12:
      specialized static MOSuggestionSheetOnboardingSettingsViewController.calculateLabelHeight(width:font:text:)(v17, v20, v22, Width - (v16 + v16));
      swift_bridgeObjectRelease();

      return;
    }
LABEL_11:
    v20 = 0;
    v22 = 0xE000000000000000;
    goto LABEL_12;
  }
  v3 = *(void **)(v5 + 24 * a1 + 40);
  v1 = v3;
  v6 = objc_msgSend(v2, sel_view);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_frame);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v23.origin.x = v9;
    v23.origin.y = v11;
    v23.size.width = v13;
    v23.size.height = v15;
    Width = CGRectGetWidth(v23);
    if (one-time initialization token for margin == -1)
      goto LABEL_5;
    goto LABEL_15;
  }
  __break(1u);
}

id specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForHeaderInSection:)(unint64_t a1)
{
  void *v1;
  char *v2;
  id v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  id result;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  CGRect v18;
  CGRect v19;

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v8 = *(_QWORD *)&v2[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings];
  if (*(_QWORD *)(v8 + 16) <= a1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v1 = *(void **)(v8 + 24 * a1 + 40);
  if (!v1)
    return v1;
  v3 = v1;
  result = objc_msgSend(v2, sel_view);
  if (result)
  {
    v10 = result;
    objc_msgSend(result, sel_bounds);
    v4 = v11;
    v5 = v12;
    v6 = v13;
    v7 = v14;

    if (one-time initialization token for margin == -1)
    {
LABEL_6:
      v18.origin.x = v4;
      v18.origin.y = v5;
      v18.size.width = v6;
      v18.size.height = v7;
      v19 = CGRectInset(v18, *(CGFloat *)&margin, *(CGFloat *)&margin);
      objc_msgSend(v3, sel_setFrame_, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);

      objc_msgSend(v3, sel_setDelegate_, v2);
      v15 = (void *)objc_opt_self();
      v16 = v3;
      v17 = objc_msgSend(v15, sel_secondaryLabelColor);
      objc_msgSend(v16, sel_setTextColor_, v17);

      return v1;
    }
LABEL_10:
    swift_once();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

void specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForFooterInSection:)(unint64_t a1)
{
  id v1;
  char *v2;
  void *v3;
  double Width;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  Swift::String v23;
  CGRect v24;

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  v5 = *(_QWORD *)&v2[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings];
  if (*(_QWORD *)(v5 + 16) <= a1)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    swift_once();
LABEL_5:
    v16 = *(double *)&margin;
    v17 = objc_msgSend(v1, sel_font);
    if (v17)
    {
      if (!v3)
        goto LABEL_11;
    }
    else
    {
      v17 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE1F0]);
      if (!v3)
        goto LABEL_11;
    }
    v18 = objc_msgSend(v1, sel_text);
    if (v18)
    {
      v19 = v18;
      v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v22 = v21;

LABEL_12:
      swift_bridgeObjectRetain();
      v23._countAndFlagsBits = 2573;
      v23._object = (void *)0xE200000000000000;
      String.append(_:)(v23);
      swift_bridgeObjectRelease();
      specialized static MOSuggestionSheetOnboardingSettingsViewController.calculateLabelHeight(width:font:text:)(v17, v20, v22, Width - (v16 + v16));

      swift_bridgeObjectRelease();
      return;
    }
LABEL_11:
    v20 = 0;
    v22 = 0xE000000000000000;
    goto LABEL_12;
  }
  v3 = *(void **)(v5 + 24 * a1 + 48);
  v1 = v3;
  v6 = objc_msgSend(v2, sel_view);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_frame);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v24.origin.x = v9;
    v24.origin.y = v11;
    v24.size.width = v13;
    v24.size.height = v15;
    Width = CGRectGetWidth(v24);
    if (one-time initialization token for margin == -1)
      goto LABEL_5;
    goto LABEL_15;
  }
  __break(1u);
}

id specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForFooterInSection:)(unint64_t a1)
{
  void *v1;
  char *v2;
  id v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  id result;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  CGRect v18;
  CGRect v19;

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v8 = *(_QWORD *)&v2[OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings];
  if (*(_QWORD *)(v8 + 16) <= a1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v1 = *(void **)(v8 + 24 * a1 + 48);
  if (!v1)
    return v1;
  v3 = v1;
  result = objc_msgSend(v2, sel_view);
  if (result)
  {
    v10 = result;
    objc_msgSend(result, sel_bounds);
    v4 = v11;
    v5 = v12;
    v6 = v13;
    v7 = v14;

    if (one-time initialization token for margin == -1)
    {
LABEL_6:
      v18.origin.x = v4;
      v18.origin.y = v5;
      v18.size.width = v6;
      v18.size.height = v7;
      v19 = CGRectInset(v18, *(CGFloat *)&margin, *(CGFloat *)&margin);
      objc_msgSend(v3, sel_setFrame_, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);

      objc_msgSend(v3, sel_setDelegate_, v2);
      v15 = (void *)objc_opt_self();
      v16 = v3;
      v17 = objc_msgSend(v15, sel_secondaryLabelColor);
      objc_msgSend(v16, sel_setTextColor_, v17);

      return v1;
    }
LABEL_10:
    swift_once();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

_QWORD *specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void (*v22)(uint64_t *, _QWORD);
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v24;
  id v25;
  id v26;
  _QWORD *v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(void (*)(char), uint64_t);
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47[5];
  _QWORD v48[7];

  v3 = type metadata accessor for UIListContentConfiguration();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SwitchCell();
  v7 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v7, sel_setSelectionStyle_, 0);
  v44 = v0;
  v8 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings);
  v9 = IndexPath.section.getter();
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v9 >= *(_QWORD *)(v8 + 16))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v46 = v4;
  v43 = v3;
  v1 = *(_QWORD *)(v8 + 24 * v9 + 32);
  if (v1)
  {
    swift_bridgeObjectRetain();
    v10 = IndexPath.row.getter();
    if ((v10 & 0x8000000000000000) == 0)
    {
      if (v10 < *(_QWORD *)(v1 + 16))
      {
        v11 = v1 + 56 * v10;
        v12 = *(_QWORD *)(v11 + 40);
        v45 = *(_QWORD *)(v11 + 32);
        v14 = *(_QWORD *)(v11 + 48);
        v13 = *(_QWORD *)(v11 + 56);
        v15 = *(unsigned __int8 *)(v11 + 64);
        v16 = *(_QWORD *)(v11 + 72);
        v17 = *(_QWORD *)(v11 + 80);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v1 = v45;
        v9 = swift_bridgeObjectRelease();
        v18 = v16;
        goto LABEL_8;
      }
LABEL_33:
      __break(1u);
LABEL_34:
      swift_once();
      goto LABEL_27;
    }
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v12 = 0;
  v14 = 0;
  v13 = 0;
  v15 = 0;
  v18 = 0;
  v17 = 0;
LABEL_8:
  v48[0] = v1;
  v48[1] = v12;
  v48[2] = v14;
  v48[3] = v13;
  v42 = v15;
  v48[4] = v15;
  v48[5] = v18;
  v19 = v18;
  v48[6] = v17;
  MEMORY[0x2426A6A60](v9);
  v45 = v1;
  if (v12)
  {
    swift_bridgeObjectRetain();
    UIListContentConfiguration.text.setter();
    swift_bridgeObjectRetain();
  }
  else
  {
    UIListContentConfiguration.text.setter();
  }
  UIListContentConfiguration.secondaryText.setter();
  v20 = (void *)objc_opt_self();
  v21 = objc_msgSend(v20, sel_secondaryLabelColor);
  v22 = (void (*)(uint64_t *, _QWORD))UIListContentConfiguration.secondaryTextProperties.modify();
  UIListContentConfiguration.TextProperties.color.setter();
  v22(v47, 0);
  v1 = v43;
  v47[3] = v43;
  v47[4] = MEMORY[0x24BEBC5F0];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v47);
  (*(void (**)(uint64_t *, char *, uint64_t))(v46 + 16))(boxed_opaque_existential_1, v6, v1);
  v24 = v7;
  MEMORY[0x2426A6A54](v47);

  v7 = v24;
  v25 = objc_msgSend(v20, sel_secondarySystemBackgroundColor);
  objc_msgSend(v7, sel_setBackgroundColor_, v25);

  objc_msgSend(v7, sel_setClipsToBounds_, 1);
  v26 = objc_msgSend(v7, sel_layer);
  objc_msgSend(v26, sel_setMasksToBounds_, 1);

  if (v12 && v17)
  {
    v27 = v7;
    swift_bridgeObjectRetain();
    v28 = (void *)MEMORY[0x2426A69DC](v19, v17);
    swift_bridgeObjectRelease();
  }
  else
  {
    v29 = v7;
    v28 = 0;
  }
  objc_msgSend(v7, sel_setAccessibilityIdentifier_, v28);

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD9B8]), sel_init);
  objc_msgSend(v2, sel_setTag_, IndexPath.row.getter());
  if (v12)
  {
    swift_bridgeObjectRetain();
    v30 = (void *)MEMORY[0x2426A69DC](v45, v12);
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setTitle_, v30);

    v31 = v42 & 1;
  }
  else
  {
    objc_msgSend(v2, sel_setTitle_, 0);
    v31 = 0;
  }
  objc_msgSend(v2, sel_setOn_, v31);
  if (!IndexPath.section.getter())
  {
    v32 = sel_switchChanged_top_;
    goto LABEL_24;
  }
  if (IndexPath.section.getter() == 1)
  {
    v32 = sel_switchChanged_middle_;
LABEL_24:
    objc_msgSend(v2, sel_addTarget_action_forControlEvents_, v44, v32, 4096);
    goto LABEL_25;
  }
  if (IndexPath.section.getter() == 2)
  {
    v32 = sel_switchChanged_bottom_;
    goto LABEL_24;
  }
  if (one-time initialization token for shared != -1)
    goto LABEL_34;
LABEL_27:
  v37 = type metadata accessor for Logger();
  __swift_project_value_buffer(v37, (uint64_t)static MOOnboardingSettingsLogger.shared);
  v38 = Logger.logObject.getter();
  v39 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    _os_log_impl(&dword_2422B0000, v38, v39, "Invalid section", v40, 2u);
    MEMORY[0x2426A712C](v40, -1, -1);
  }

LABEL_25:
  objc_msgSend(v7, sel_setAccessoryView_, v2);
  v33 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = v33;
  outlined init with take of AppSetting?((uint64_t)v48, v34 + 24);
  v35 = *(void (**)(void (*)(char), uint64_t))((*MEMORY[0x24BEE4EA0] & *v7) + 0x60);
  swift_retain();
  v35(partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:), v34);

  (*(void (**)(char *, uint64_t))(v46 + 8))(v6, v1);
  swift_release();
  return v7;
}

uint64_t specialized MOSuggestionSheetOnboardingSettingsViewController.textView(_:shouldInteractWith:in:interaction:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  char v7;
  uint64_t result;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  id v13;

  v1 = v0;
  if (one-time initialization token for shared != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static MOOnboardingSettingsLogger.shared);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2422B0000, v3, v4, "Privacy About link tapped", v5, 2u);
    MEMORY[0x2426A712C](v5, -1, -1);
  }

  if (URL.absoluteString.getter() == 0xD000000000000022 && v6 == 0x80000002422CF4E0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v7 & 1) == 0)
      return result;
  }
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2422B0000, v9, v10, "URL tapped matches journal privacy string", v11, 2u);
    MEMORY[0x2426A712C](v11, -1, -1);
  }

  v12 = (void *)MEMORY[0x2426A69DC](0xD00000000000001CLL, 0x80000002422CEFF0);
  v13 = objc_msgSend((id)objc_opt_self(), sel_presenterForPrivacySplashWithIdentifier_, v12);

  if (!v13)
    return 0;
  objc_msgSend(v13, sel_setPresentingViewController_, v1);
  objc_msgSend(v13, sel_present);

  return 1;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_2422C5C40()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2422C5C64()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 32))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_deallocObject();
}

uint64_t outlined init with take of AppSetting?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AppSetting?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426A70CC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)(char a1)
{
  uint64_t v1;

  closure #1 in MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)(a1, *(_QWORD *)(v1 + 16), v1 + 24);
}

void type metadata accessor for NSAttributedStringKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for NSAttributedStringKey)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSAttributedStringKey);
  }
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t type metadata accessor for UIFont(uint64_t a1, unint64_t *a2)
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

void partial apply for closure #1 in closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()()
{
  uint64_t v0;

  closure #1 in closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()(v0);
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    result = MEMORY[0x2426A70E4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426A70D8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x2426A70E4](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t base witness table accessor for RawRepresentable in NSAttributedStringKey()
{
  return lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NSAttributedStringKey()
{
  return lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
}

uint64_t base witness table accessor for Equatable in NSAttributedStringKey()
{
  return lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
}

uint64_t lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2426A70E4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void MOSuggestionSheetOnboardingSettingsViewController.switchChanged_middle(_:)()
{
  swift_deletedMethodError();
  __break(1u);
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

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

uint64_t MOOnboardingNavigationController.onboardingDelegate.getter()
{
  return MOOnboardingNavigationController.onboardingDelegate.getter();
}

{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t MOOnboardingNavigationController.onboardingDelegate.setter(uint64_t a1)
{
  return MOOnboardingNavigationController.onboardingDelegate.setter(a1, &OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate);
}

uint64_t (*MOOnboardingNavigationController.onboardingDelegate.modify())()
{
  swift_beginAccess();
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

id MOOnboardingNavigationController.__allocating_init(onboardingDelegate:)(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  char *v4;
  char *v5;
  id v6;
  _QWORD *v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  id v10;
  objc_super v12;

  v2 = v1;
  v4 = (char *)objc_allocWithZone(v1);
  v5 = &v4[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate];
  *(_QWORD *)&v4[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate] = 0;
  swift_beginAccess();
  *(_QWORD *)v5 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v6 = objc_allocWithZone((Class)type metadata accessor for MOOnboardingViewController());
  v7 = MOOnboardingViewController.init()();
  v8 = *(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v7) + 0x88);
  v9 = swift_unknownObjectRetain();
  v8(v9);
  v12.receiver = v4;
  v12.super_class = v2;
  v10 = objc_msgSendSuper2(&v12, sel_initWithRootViewController_, v7);

  swift_unknownObjectRelease();
  return v10;
}

id MOOnboardingNavigationController.init(onboardingDelegate:)(uint64_t a1)
{
  char *v1;
  void *v2;
  char *v4;
  id v5;
  _QWORD *v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  id v9;
  objc_super v11;

  v2 = v1;
  v4 = &v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate];
  *(_QWORD *)v4 = 0;
  swift_beginAccess();
  *(_QWORD *)v4 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v5 = objc_allocWithZone((Class)type metadata accessor for MOOnboardingViewController());
  v6 = MOOnboardingViewController.init()();
  v7 = *(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v6) + 0x88);
  v8 = swift_unknownObjectRetain();
  v7(v8);
  v11.receiver = v2;
  v11.super_class = (Class)type metadata accessor for MOOnboardingNavigationController();
  v9 = objc_msgSendSuper2(&v11, sel_initWithRootViewController_, v6);

  swift_unknownObjectRelease();
  return v9;
}

id MOOnboardingViewController.__allocating_init()()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return MOOnboardingViewController.init()();
}

uint64_t type metadata accessor for MOOnboardingViewController()
{
  return objc_opt_self();
}

id MOOnboardingNavigationController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void MOOnboardingNavigationController.init(coder:)()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id MOOnboardingNavigationController.__allocating_init(navigationBarClass:toolbarClass:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;

  v3 = a2;
  if (!a1)
  {
    ObjCClassFromMetadata = 0;
    if (!a2)
      return objc_msgSend(objc_allocWithZone(v2), sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
    goto LABEL_3;
  }
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  if (v3)
LABEL_3:
    v3 = swift_getObjCClassFromMetadata();
  return objc_msgSend(objc_allocWithZone(v2), sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
}

void MOOnboardingNavigationController.init(navigationBarClass:toolbarClass:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MOOnboardingNavigationController.__allocating_init(rootViewController:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithRootViewController_, a1);

  return v3;
}

void MOOnboardingNavigationController.init(rootViewController:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MOOnboardingNavigationController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)MEMORY[0x2426A69DC]();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void MOOnboardingNavigationController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MOOnboardingNavigationController.__deallocating_deinit()
{
  return MOOnboardingNavigationController.__deallocating_deinit(type metadata accessor for MOOnboardingNavigationController, (SEL *)&selRef_dealloc);
}

id MOOnboardingViewController.onboardingManager.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager));
}

uint64_t MOOnboardingViewController.delegate.getter()
{
  return MOOnboardingNavigationController.onboardingDelegate.getter();
}

uint64_t MOOnboardingViewController.delegate.setter(uint64_t a1)
{
  return MOOnboardingNavigationController.onboardingDelegate.setter(a1, &OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_delegate);
}

uint64_t MOOnboardingNavigationController.onboardingDelegate.setter(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*MOOnboardingViewController.delegate.modify())()
{
  swift_beginAccess();
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

uint64_t MOOnboardingViewController.journalBundleAboutIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MOOnboardingViewController.hasTappedOnboardingCompletion.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_hasTappedOnboardingCompletion);
  swift_beginAccess();
  return *v1;
}

uint64_t MOOnboardingViewController.hasTappedOnboardingCompletion.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1
               + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_hasTappedOnboardingCompletion);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*MOOnboardingViewController.hasTappedOnboardingCompletion.modify())()
{
  swift_beginAccess();
  return MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.modify;
}

void *MOOnboardingViewController.turnOnSuggestionsButton.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_turnOnSuggestionsButton);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void MOOnboardingViewController.turnOnSuggestionsButton.setter(void *a1)
{
  MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton.setter(a1, &OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_turnOnSuggestionsButton);
}

uint64_t (*MOOnboardingViewController.turnOnSuggestionsButton.modify())()
{
  swift_beginAccess();
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

void *MOOnboardingViewController.notNowButton.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_notNowButton);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void MOOnboardingViewController.notNowButton.setter(void *a1)
{
  MOSuggestionSheetOnboardingSettingsViewController.turnOnSuggestionsButton.setter(a1, &OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_notNowButton);
}

uint64_t (*MOOnboardingViewController.notNowButton.modify())()
{
  swift_beginAccess();
  return MOSuggestionSheetOnboardingSettingsViewController.delegate.modify;
}

void MOOnboardingViewController.__allocating_init(coder:)()
{
  objc_class *v0;
  _BYTE *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = objc_allocWithZone(v0);
  v2 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager;
  *(_QWORD *)&v1[v2] = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  *(_QWORD *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_delegate] = 0;
  v3 = &v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier];
  *v3 = 0xD00000000000001CLL;
  v3[1] = 0x80000002422CEFF0;
  v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_hasTappedOnboardingCompletion] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_turnOnSuggestionsButton] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_notNowButton] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void MOOnboardingViewController.init(coder:)()
{
  _BYTE *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager;
  *(_QWORD *)&v0[v1] = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  *(_QWORD *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_delegate] = 0;
  v2 = &v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier];
  *v2 = 0xD00000000000001CLL;
  v2[1] = 0x80000002422CEFF0;
  v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_hasTappedOnboardingCompletion] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_turnOnSuggestionsButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_notNowButton] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id MOOnboardingViewController.init()()
{
  char *v0;
  uint64_t v1;
  void *v2;
  char *v3;
  char *v4;
  objc_class *v5;
  uint64_t ObjCClassFromMetadata;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  void *v15;
  id v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  void *v20;
  id v21;
  id v22;
  objc_super v24;
  Swift::String v25;
  Swift::String v26;

  v1 = OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager;
  v2 = (void *)objc_opt_self();
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_sharedInstance);
  *(_QWORD *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_delegate] = 0;
  v4 = &v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier];
  *(_QWORD *)v4 = 0xD00000000000001CLL;
  *((_QWORD *)v4 + 1) = 0x80000002422CEFF0;
  v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_hasTappedOnboardingCompletion] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_turnOnSuggestionsButton] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_notNowButton] = 0;

  v5 = (objc_class *)type metadata accessor for MOOnboardingViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v9 = (void *)MEMORY[0x2426A69DC](0xD000000000000023, 0x80000002422CFD50);
  v10 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_withConfiguration_, v9, v8, 0);

  v11 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v25._countAndFlagsBits = 0xD000000000000027;
  v25._object = (void *)0x80000002422CFDA0;
  v12._object = (void *)0x80000002422CFD80;
  v12._countAndFlagsBits = 0xD000000000000016;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v14 = NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v25);

  v15 = (void *)MEMORY[0x2426A69DC](v14._countAndFlagsBits, v14._object);
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v17._countAndFlagsBits = 0xD000000000000063;
  v26._object = (void *)0x80000002422CFE40;
  v17._object = (void *)0x80000002422CFDD0;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  v26._countAndFlagsBits = 0xD000000000000016;
  v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v17, (Swift::String_optional)0, (NSBundle)v16, v18, v26);

  v20 = (void *)MEMORY[0x2426A69DC](v19._countAndFlagsBits, v19._object);
  swift_bridgeObjectRelease();
  v24.receiver = v3;
  v24.super_class = v5;
  v21 = objc_msgSendSuper2(&v24, sel_initWithTitle_detailText_icon_contentLayout_, v15, v20, v10, 2);

  v22 = v21;
  MOOnboardingViewController.loadInitialController()();

  return v22;
}

uint64_t type metadata accessor for MOOnboardingNavigationController()
{
  return objc_opt_self();
}

Swift::Void __swiftcall MOOnboardingViewController.viewDidLoad()()
{
  MOOnboardingNavigationController.__deallocating_deinit(type metadata accessor for MOOnboardingViewController, (SEL *)&selRef_viewDidLoad);
}

Swift::Void __swiftcall MOOnboardingViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for MOOnboardingViewController();
  objc_msgSendSuper2(&v10, sel_viewDidAppear_, a1);
  v3 = objc_msgSend(v1, sel_contentView);
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_systemBlueColor);
  objc_msgSend(v3, sel_setTintColor_, v5);

  v6 = objc_msgSend(v1, sel_navigationController);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, sel_navigationBar);

    v9 = objc_msgSend(v4, sel_systemBlueColor);
    objc_msgSend(v8, sel_setTintColor_, v9);

  }
}

void MOOnboardingViewController.initNavbar()()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v1 = objc_msgSend(v0, sel_navigationController);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_navigationBar);

    v4 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    objc_msgSend(v3, sel_setBackgroundColor_, v4);

  }
  v5 = objc_msgSend(v0, sel_navigationController);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_navigationBar);

    objc_msgSend(v7, sel_setTranslucent_, 0);
  }
  v8 = objc_msgSend(v0, sel_navigationController);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, sel_navigationBar);

    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
    objc_msgSend(v10, sel_setShadowImage_, v11);

  }
}

id MOOnboardingViewController.loadInitialController()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id result;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t ObjCClassFromMetadata;
  id v21;
  Swift::String v22;
  Swift::String v23;
  char *v24;
  void (*v25)(_QWORD);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  Swift::String v39;
  Swift::String v40;
  Swift::String v41;
  void *v42;
  id v43;
  Swift::String v44;
  Swift::String v45;
  Swift::String v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  char *v56;
  uint64_t v57;
  char *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  Swift::String v68;
  Swift::String v69;
  Swift::String v70;
  void *v71;
  id v72;
  Swift::String v73;
  Swift::String v74;
  Swift::String v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t (*v82)(void);
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  id v87;
  Swift::String v88;
  Swift::String v89;
  Swift::String v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t (*v98)(void);
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  id v103;
  Swift::String v104;
  Swift::String v105;
  Swift::String v106;
  void *v107;
  uint64_t v108;
  char *v109;
  void *v110;
  id v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  void (*v115)(char *, uint64_t);
  _QWORD v116[3];
  char *v117;
  void (*v118)(char *, char *, uint64_t);
  unsigned int v119;
  void (*v120)(uint64_t, _QWORD, uint64_t);
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  char *v126;
  char *v127;
  id v128;
  id v129;
  uint64_t v130;
  Swift::String v131;
  Swift::String v132;
  Swift::String v133;
  Swift::String v134;
  Swift::String v135;
  Swift::String v136;
  Swift::String v137;

  v1 = v0;
  v123 = type metadata accessor for UIButton.Configuration.Size();
  v2 = *(_QWORD *)(v123 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)v116 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for UIButton.Configuration();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v127 = (char *)v116 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v116 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v116 - v12;
  MOOnboardingViewController.initNavbar()();
  result = objc_msgSend(v0, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_29;
  }
  v15 = result;
  v16 = (void *)objc_opt_self();
  v17 = objc_msgSend(v16, sel_systemBackgroundColor);
  objc_msgSend(v15, sel_setBackgroundColor_, v17);

  v18 = objc_msgSend(v1, sel_buttonTray);
  v19 = objc_msgSend(v16, sel_systemBlueColor);
  objc_msgSend(v18, sel_setTintColor_, v19);

  static UIButton.Configuration.plain()();
  UIButton.Configuration.contentInsets.setter();
  type metadata accessor for MOOnboardingViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v129 = (id)objc_opt_self();
  v130 = ObjCClassFromMetadata;
  v21 = objc_msgSend(v129, sel_bundleForClass_, ObjCClassFromMetadata);
  v22._countAndFlagsBits = 0xD000000000000018;
  v131._countAndFlagsBits = 0xD00000000000002DLL;
  v131._object = (void *)0x80000002422D00B0;
  v22._object = (void *)0x80000002422D0090;
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v22, (Swift::String_optional)0, (NSBundle)v21, v23, v131);
  v126 = v13;

  v24 = v126;
  UIButton.Configuration.title.setter();
  v25 = *(void (**)(_QWORD))(v2 + 104);
  v119 = *MEMORY[0x24BEBD188];
  v26 = v123;
  v120 = (void (*)(uint64_t, _QWORD, uint64_t))v25;
  v25(v4);
  UIButton.Configuration.buttonSize.setter();
  v27 = type metadata accessor for UIFont(0, &lazy cache variable for type metadata for OBBulletedListItemLinkButton);
  v122 = v6;
  v118 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v118(v11, v24, v5);
  v28 = type metadata accessor for UIFont(0, &lazy cache variable for type metadata for UIAction);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  v117 = v11;
  v29 = (id)UIButton.init(configuration:primaryAction:)();
  v128 = v16;
  v30 = objc_msgSend(v16, sel_systemBlueColor);
  objc_msgSend(v29, sel_setTintColor_, v30);

  v31 = objc_msgSend(v29, sel_titleLabel);
  if (v31)
  {
    v32 = v31;
    objc_msgSend(v31, sel_setNumberOfLines_, 0);

  }
  v33 = v26;
  v124 = v5;
  v125 = v29;
  v34 = objc_msgSend(v29, sel_titleLabel, v28, v27, v4);
  if (v34)
  {
    v35 = v34;
    objc_msgSend(v34, sel_setLineBreakMode_, 0);

  }
  v37 = v129;
  v36 = v130;
  v38 = objc_msgSend(v129, sel_bundleForClass_, v130);
  v132._countAndFlagsBits = 0xD000000000000027;
  v132._object = (void *)0x80000002422D00E0;
  v39._countAndFlagsBits = 0x2064657461727543;
  v39._object = (void *)0xEF756F5920726F66;
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  v41 = NSLocalizedString(_:tableName:bundle:value:comment:)(v39, (Swift::String_optional)0, (NSBundle)v38, v40, v132);

  v42 = (void *)MEMORY[0x2426A69DC](v41._countAndFlagsBits, v41._object);
  swift_bridgeObjectRelease();
  v43 = objc_msgSend(v37, sel_bundleForClass_, v36);
  v133._countAndFlagsBits = 0xD000000000000026;
  v44._countAndFlagsBits = 0xD000000000000074;
  v133._object = (void *)0x80000002422D0190;
  v44._object = (void *)0x80000002422D0110;
  v45._countAndFlagsBits = 0;
  v45._object = (void *)0xE000000000000000;
  v46 = NSLocalizedString(_:tableName:bundle:value:comment:)(v44, (Swift::String_optional)0, (NSBundle)v43, v45, v133);

  v47 = (void *)MEMORY[0x2426A69DC](v46._countAndFlagsBits, v46._object);
  swift_bridgeObjectRelease();
  v48 = (void *)MEMORY[0x2426A69DC](0x6C7562746867696CLL, 0xED000078616D2E62);
  v49 = objc_msgSend(v128, sel_systemBlueColor);
  objc_msgSend(v1, sel_addBulletedListItemWithTitle_description_symbolName_tintColor_linkButton_, v42, v47, v48, v49, v125);

  v50 = *(_QWORD *)((char *)v1
                  + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier);
  v51 = *(_QWORD *)((char *)v1
                  + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier
                  + 8);
  swift_bridgeObjectRetain();
  v52 = (void *)MEMORY[0x2426A69DC](v50, v51);
  swift_bridgeObjectRelease();
  v53 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v52);

  v121 = v53;
  if (!v53)
    goto LABEL_10;
  result = objc_msgSend(v53, sel_privacyFlow);
  if (!result)
  {
LABEL_29:
    __break(1u);
    return result;
  }
  v54 = result;
  v55 = objc_msgSend(result, sel_localizedButtonTitle);

  if (v55)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

  }
LABEL_10:
  v57 = v116[2];
  v56 = v117;
  v58 = v127;
  static UIButton.Configuration.plain()();
  UIButton.Configuration.contentInsets.setter();
  UIButton.Configuration.title.setter();
  v120(v57, v119, v33);
  UIButton.Configuration.buttonSize.setter();
  v118(v56, v58, v124);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  v59 = (id)UIButton.init(configuration:primaryAction:)();
  v60 = objc_msgSend(v128, sel_systemBlueColor);
  objc_msgSend(v59, sel_setTintColor_, v60);

  v61 = objc_msgSend(v59, sel_titleLabel);
  if (v61)
  {
    v62 = v61;
    objc_msgSend(v61, sel_setNumberOfLines_, 0);

  }
  v63 = objc_msgSend(v59, sel_titleLabel);
  if (v63)
  {
    v64 = v63;
    objc_msgSend(v63, sel_setLineBreakMode_, 0);

  }
  v66 = v129;
  v65 = v130;
  v67 = objc_msgSend(v129, sel_bundleForClass_, v130);
  v68._countAndFlagsBits = 0xD000000000000017;
  v134._countAndFlagsBits = 0xD000000000000028;
  v134._object = (void *)0x80000002422D01E0;
  v68._object = (void *)0x80000002422D01C0;
  v69._countAndFlagsBits = 0;
  v69._object = (void *)0xE000000000000000;
  v70 = NSLocalizedString(_:tableName:bundle:value:comment:)(v68, (Swift::String_optional)0, (NSBundle)v67, v69, v134);

  v71 = (void *)MEMORY[0x2426A69DC](v70._countAndFlagsBits, v70._object);
  swift_bridgeObjectRelease();
  v72 = objc_msgSend(v66, sel_bundleForClass_, v65);
  v135._countAndFlagsBits = 0xD000000000000027;
  v73._countAndFlagsBits = 0xD000000000000069;
  v135._object = (void *)0x80000002422D0280;
  v73._object = (void *)0x80000002422D0210;
  v74._countAndFlagsBits = 0;
  v74._object = (void *)0xE000000000000000;
  v75 = NSLocalizedString(_:tableName:bundle:value:comment:)(v73, (Swift::String_optional)0, (NSBundle)v72, v74, v135);

  v76 = (void *)MEMORY[0x2426A69DC](v75._countAndFlagsBits, v75._object);
  swift_bridgeObjectRelease();
  v77 = (void *)MEMORY[0x2426A69DC](0x6961722E646E6168, 0xEB00000000646573);
  v78 = objc_msgSend(v128, sel_systemBlueColor);
  objc_msgSend(v1, sel_addBulletedListItemWithTitle_description_symbolName_tintColor_linkButton_, v71, v76, v77, v78, v59);

  v79 = objc_msgSend((id)objc_opt_self(), sel_boldButton);
  v80 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v81 = (*(uint64_t (**)(id))((*MEMORY[0x24BEE4EA0] & *v1) + 0xB8))(v79);
  v82 = *(uint64_t (**)(void))((*v80 & *v1) + 0xB0);
  v83 = (void *)((uint64_t (*)(uint64_t))v82)(v81);
  if (v83)
  {
    v84 = v83;
    objc_msgSend(v83, sel_addTarget_action_forControlEvents_, v1, sel_turnOnSuggestionsButtonTapped, 64);

  }
  v85 = v82();
  if (v85)
  {
    v86 = (void *)v85;
    v87 = objc_msgSend(v129, sel_bundleForClass_, v130);
    v136._countAndFlagsBits = 0xD000000000000031;
    v136._object = (void *)0x80000002422D02B0;
    v88._object = (void *)0x80000002422CF560;
    v88._countAndFlagsBits = 0xD00000000000001ELL;
    v89._countAndFlagsBits = 0;
    v89._object = (void *)0xE000000000000000;
    v90 = NSLocalizedString(_:tableName:bundle:value:comment:)(v88, (Swift::String_optional)0, (NSBundle)v87, v89, v136);

    v91 = (void *)MEMORY[0x2426A69DC](v90._countAndFlagsBits, v90._object);
    swift_bridgeObjectRelease();
    objc_msgSend(v86, (SEL)0x1F29471C8, v91, 0);

  }
  v92 = v82();
  v93 = v125;
  if (v92)
  {
    v94 = (void *)v92;
    v95 = objc_msgSend(v1, sel_buttonTray);
    objc_msgSend(v95, sel_addButton_, v94);

  }
  v96 = objc_msgSend((id)objc_opt_self(), sel_linkButton);
  v97 = (*(uint64_t (**)(id))((*v80 & *v1) + 0xD0))(v96);
  v98 = *(uint64_t (**)(void))((*v80 & *v1) + 0xC8);
  v99 = (void *)((uint64_t (*)(uint64_t))v98)(v97);
  if (v99)
  {
    v100 = v99;
    objc_msgSend(v99, sel_addTarget_action_forControlEvents_, v1, sel_notNowCloseSheet, 64);

  }
  v101 = v98();
  if (v101)
  {
    v102 = (void *)v101;
    v103 = objc_msgSend(v129, sel_bundleForClass_, v130);
    v137._object = (void *)0x80000002422D02F0;
    v104._countAndFlagsBits = 0x776F4E20746F4ELL;
    v104._object = (void *)0xE700000000000000;
    v105._countAndFlagsBits = 0;
    v105._object = (void *)0xE000000000000000;
    v137._countAndFlagsBits = 0xD00000000000001ELL;
    v106 = NSLocalizedString(_:tableName:bundle:value:comment:)(v104, (Swift::String_optional)0, (NSBundle)v103, v105, v137);

    v107 = (void *)MEMORY[0x2426A69DC](v106._countAndFlagsBits, v106._object);
    swift_bridgeObjectRelease();
    objc_msgSend(v102, (SEL)0x1F29471C8, v107, 0);

  }
  v108 = v98();
  v109 = v126;
  if (v108)
  {
    v110 = (void *)v108;
    v111 = objc_msgSend(v1, sel_buttonTray);
    objc_msgSend(v111, sel_addButton_, v110);

    v112 = v110;
    v59 = v111;
    v113 = v124;
  }
  else
  {
    v113 = v124;
    v112 = v121;
  }
  v114 = v122;

  v115 = *(void (**)(char *, uint64_t))(v114 + 8);
  v115(v127, v113);
  return (id)((uint64_t (*)(char *, uint64_t))v115)(v109, v113);
}

void closure #1 in MOOnboardingViewController.loadInitialController()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = (_QWORD *)MEMORY[0x2426A7174](v2);
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v3) + 0x120))();

  }
}

void closure #2 in MOOnboardingViewController.loadInitialController()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = (_QWORD *)MEMORY[0x2426A7174](v2);
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v3) + 0x108))();

  }
}

void MOOnboardingViewController.requestNotificationPermissions(completion:)(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v4 = objc_allocWithZone(MEMORY[0x24BDF88B8]);
  v5 = (void *)MEMORY[0x2426A69DC](0xD000000000000026, 0x80000002422CEE80);
  v6 = objc_msgSend(v4, sel_initWithBundleIdentifier_, v5);

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  v9[4] = partial apply for closure #1 in MOSuggestionSheetOnboardingSettingsViewController.requestNotificationPermissions(completion:);
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed Error?) -> ();
  v9[3] = &block_descriptor_0;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_requestAuthorizationWithOptions_completionHandler_, 6, v8);

  _Block_release(v8);
}

Swift::Void __swiftcall MOOnboardingViewController.privacyAboutTapped()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier);
  v2 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier
                 + 8);
  swift_bridgeObjectRetain();
  v3 = (void *)MEMORY[0x2426A69DC](v1, v2);
  swift_bridgeObjectRelease();
  v4 = objc_msgSend((id)objc_opt_self(), sel_presenterForPrivacySplashWithIdentifier_, v3);

  if (v4)
  {
    objc_msgSend(v4, sel_setPresentingViewController_, v0);
    objc_msgSend(v4, sel_present);

  }
}

void MOOnboardingViewController.notNowCloseSheet()()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[6];

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))() & 1) == 0)
  {
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE68E80]), sel_init);
    v3 = (void *)MEMORY[0x2426A69DC](0xD00000000000002BLL, 0x80000002422D0050);
    v6[4] = closure #1 in closure #1 in closure #1 in MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped();
    v6[5] = 0;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 1107296256;
    v6[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
    v6[3] = &block_descriptor_6;
    v4 = _Block_copy(v6);
    objc_msgSend(v2, sel_triggerFeedbackAssistantFlow_handler_, v3, v4);
    _Block_release(v4);

    v5 = (void *)(*(uint64_t (**)(id))((*v1 & *v0) + 0x80))(objc_msgSend(*(id *)((char *)v0+ OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager), sel_setOnboardingFlowCompletionStatus_, 1));
    if (v5)
    {
      objc_msgSend(v5, sel_shouldDismissOnboarding);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

Swift::Void __swiftcall MOOnboardingViewController.turnOnSuggestionsButtonTapped()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void (*v16)(uint64_t (*)(), uint64_t);
  _QWORD *v17;

  v1 = v0;
  if (one-time initialization token for shared != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static MOOnboardingSettingsLogger.shared);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2422B0000, v3, v4, "[MOSuggestionSheetOnboardingViewController] Turn on Journaling Suggestions tapped", v5, 2u);
    MEMORY[0x2426A712C](v5, -1, -1);
  }

  v6 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x98))() & 1) == 0)
  {
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2422B0000, v7, v8, "[MOSuggestionSheetOnboardingViewController] Haven't tapped Turn on Journaling Suggestions before; proceed with sheet dismissal",
        v9,
        2u);
      MEMORY[0x2426A712C](v9, -1, -1);
    }

    v10 = (*(uint64_t (**)(uint64_t))((*v6 & *v1) + 0xA0))(1);
    v11 = (void *)(*(uint64_t (**)(uint64_t))((*v6 & *v1) + 0xB0))(v10);
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, sel_setEnabled_, 0);

    }
    v13 = (void *)(*(uint64_t (**)(void))((*v6 & *v1) + 0xC8))();
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v13, sel_setEnabled_, 0);

    }
    specialized static MOSettingsOptions.setDefaultSettings()();
    objc_msgSend(*(id *)((char *)v1 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager), sel_setOnboardingFlowCompletionStatus_, 2);
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v1;
    v16 = *(void (**)(uint64_t (*)(), uint64_t))((*v6 & *v1) + 0x100);
    v17 = v1;
    v16(partial apply for closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped(), v15);
    swift_release();
  }
}

uint64_t closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];

  v0 = type metadata accessor for DispatchWorkItemFlags();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UIFont(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  v8 = (void *)static OS_dispatch_queue.main.getter();
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = partial apply for closure #1 in closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped();
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_12;
  v10 = _Block_copy(aBlock);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x2426A6A78](0, v7, v3, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void closure #1 in closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  void *v4;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = (_QWORD *)MEMORY[0x2426A7174](v1);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v2) + 0x80))();

    if (v4)
    {
      objc_msgSend(v4, sel_shouldDismissOnboarding);
      swift_unknownObjectRelease();
    }
  }
}

Swift::Void __swiftcall MOOnboardingViewController.customizeButtonTapped()()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD *v6;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))() & 1) == 0)
  {
    specialized static MOSettingsOptions.setDefaultSettings()();
    v2 = objc_allocWithZone((Class)type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController());
    v6 = MOSuggestionSheetOnboardingSettingsViewController.init()();
    v3 = (*(uint64_t (**)(void))((*v1 & *v0) + 0x80))();
    (*(void (**)(uint64_t))((*v1 & *v6) + 0xA0))(v3);
    v4 = objc_msgSend(v0, sel_navigationController);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, sel_pushViewController_animated_, v6, 1);

    }
  }
}

id MOOnboardingViewController.__allocating_init(title:detailText:symbolName:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  objc_class *v8;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = v7;
  v14 = (void *)MEMORY[0x2426A69DC]();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    v15 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v15 = (void *)MEMORY[0x2426A69DC](a3, a4);
  swift_bridgeObjectRelease();
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v16 = (void *)MEMORY[0x2426A69DC](a5, a6);
  swift_bridgeObjectRelease();
LABEL_6:
  v17 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v14, v15, v16, a7);

  return v17;
}

void MOOnboardingViewController.init(title:detailText:symbolName:contentLayout:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MOOnboardingViewController.__allocating_init(title:detailText:icon:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  objc_class *v6;
  objc_class *v7;
  void *v12;
  void *v13;
  id v14;

  v7 = v6;
  v12 = (void *)MEMORY[0x2426A69DC]();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v13 = (void *)MEMORY[0x2426A69DC](a3, a4);
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentLayout_, v12, v13, a5, a6);

  return v14;
}

void MOOnboardingViewController.init(title:detailText:icon:contentLayout:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MOOnboardingViewController.__deallocating_deinit()
{
  return MOOnboardingNavigationController.__deallocating_deinit(type metadata accessor for MOOnboardingViewController, (SEL *)&selRef_dealloc);
}

id MOOnboardingNavigationController.__deallocating_deinit(uint64_t (*a1)(void), SEL *a2)
{
  void *v2;
  objc_super v5;

  v5.receiver = v2;
  v5.super_class = (Class)a1();
  return objc_msgSendSuper2(&v5, *a2);
}

UIFont __swiftcall UIFont.withTraits(traits:)(UIFontDescriptorSymbolicTraits traits)
{
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  UIFont result;
  id v6;

  v2 = *(_QWORD *)&traits;
  v3 = objc_msgSend(v1, sel_fontDescriptor);
  v4 = objc_msgSend(v3, sel_fontDescriptorWithSymbolicTraits_, v2);

  if (v4)
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v4, 0.0);

    return (UIFont)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

UIFont __swiftcall UIFont.bold()()
{
  void *v0;
  id v1;
  id v2;
  UIFont result;
  id v4;

  v1 = objc_msgSend(v0, sel_fontDescriptor);
  v2 = objc_msgSend(v1, sel_fontDescriptorWithSymbolicTraits_, 2);

  if (v2)
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v2, 0.0);

    return (UIFont)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2422C8D7C()
{
  swift_release();
  return swift_deallocObject();
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

uint64_t sub_2422C8DB8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped()()
{
  return closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped()();
}

uint64_t sub_2422C8DE4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped()()
{
  uint64_t v0;

  closure #1 in closure #1 in MOOnboardingViewController.turnOnSuggestionsButtonTapped()(v0);
}

unint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags();
    result = MEMORY[0x2426A70E4](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

void partial apply for closure #1 in MOOnboardingViewController.loadInitialController()(uint64_t a1)
{
  uint64_t v1;

  closure #1 in MOOnboardingViewController.loadInitialController()(a1, v1);
}

void partial apply for closure #2 in MOOnboardingViewController.loadInitialController()(uint64_t a1)
{
  uint64_t v1;

  closure #2 in MOOnboardingViewController.loadInitialController()(a1, v1);
}

id static MOSettingsOptions.healthAndActivitySuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(1);
}

id static MOSettingsOptions.mediaSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(2);
}

id static MOSettingsOptions.contactsSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(3);
}

id static MOSettingsOptions.photosSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(4);
}

id static MOSettingsOptions.locationsSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(5);
}

id static MOSettingsOptions.stateOfMindSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(9);
}

id static MOSettingsOptions.reflectionSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(10);
}

id static MOSettingsOptions.nearbyPeopleSuggestions.getter()
{
  return static MOSettingsOptions.healthAndActivitySuggestions.getter(6);
}

id static MOSettingsOptions.healthAndActivitySuggestions.getter(uint64_t a1)
{
  id v2;
  id v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = objc_msgSend(v2, sel_getStateForSetting_, a1);

  return v3;
}

void static MOSettingsOptions.healthAndActivitySuggestions.setter(char a1)
{
  static MOSettingsOptions.healthAndActivitySuggestions.setter(a1, 1);
}

void static MOSettingsOptions.mediaSuggestions.setter(char a1)
{
  static MOSettingsOptions.healthAndActivitySuggestions.setter(a1, 2);
}

void static MOSettingsOptions.contactsSuggestions.setter(char a1)
{
  static MOSettingsOptions.healthAndActivitySuggestions.setter(a1, 3);
}

void static MOSettingsOptions.photosSuggestions.setter(char a1)
{
  static MOSettingsOptions.healthAndActivitySuggestions.setter(a1, 4);
}

void static MOSettingsOptions.locationsSuggestions.setter(char a1)
{
  static MOSettingsOptions.healthAndActivitySuggestions.setter(a1, 5);
}

void static MOSettingsOptions.stateOfMindSuggestions.setter(char a1)
{
  static MOSettingsOptions.healthAndActivitySuggestions.setter(a1, 9);
}

void static MOSettingsOptions.reflectionSuggestions.setter(char a1)
{
  static MOSettingsOptions.healthAndActivitySuggestions.setter(a1, 10);
}

void static MOSettingsOptions.nearbyPeopleSuggestions.setter(char a1)
{
  static MOSettingsOptions.healthAndActivitySuggestions.setter(a1, 6);
}

void static MOSettingsOptions.healthAndActivitySuggestions.setter(char a1, uint64_t a2)
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v4, sel_setState_forSetting_, a1 & 1, a2);

}

void (*static MOSettingsOptions.healthAndActivitySuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  unsigned __int8 v4;

  v2 = (void *)objc_opt_self();
  *(_QWORD *)a1 = v2;
  v3 = objc_msgSend(v2, sel_sharedInstance);
  v4 = objc_msgSend(v3, sel_getStateForSetting_, 1);

  *(_BYTE *)(a1 + 8) = v4;
  return static MOSettingsOptions.healthAndActivitySuggestions.modify;
}

void static MOSettingsOptions.healthAndActivitySuggestions.modify(uint64_t a1, uint64_t a2)
{
  static MOSettingsOptions.healthAndActivitySuggestions.modify(a1, a2, 1);
}

void (*static MOSettingsOptions.mediaSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  unsigned __int8 v4;

  v2 = (void *)objc_opt_self();
  *(_QWORD *)a1 = v2;
  v3 = objc_msgSend(v2, sel_sharedInstance);
  v4 = objc_msgSend(v3, sel_getStateForSetting_, 2);

  *(_BYTE *)(a1 + 8) = v4;
  return static MOSettingsOptions.mediaSuggestions.modify;
}

void static MOSettingsOptions.mediaSuggestions.modify(uint64_t a1, uint64_t a2)
{
  static MOSettingsOptions.healthAndActivitySuggestions.modify(a1, a2, 2);
}

void (*static MOSettingsOptions.contactsSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  unsigned __int8 v4;

  v2 = (void *)objc_opt_self();
  *(_QWORD *)a1 = v2;
  v3 = objc_msgSend(v2, sel_sharedInstance);
  v4 = objc_msgSend(v3, sel_getStateForSetting_, 3);

  *(_BYTE *)(a1 + 8) = v4;
  return static MOSettingsOptions.contactsSuggestions.modify;
}

void static MOSettingsOptions.contactsSuggestions.modify(uint64_t a1, uint64_t a2)
{
  static MOSettingsOptions.healthAndActivitySuggestions.modify(a1, a2, 3);
}

void (*static MOSettingsOptions.photosSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  unsigned __int8 v4;

  v2 = (void *)objc_opt_self();
  *(_QWORD *)a1 = v2;
  v3 = objc_msgSend(v2, sel_sharedInstance);
  v4 = objc_msgSend(v3, sel_getStateForSetting_, 4);

  *(_BYTE *)(a1 + 8) = v4;
  return static MOSettingsOptions.photosSuggestions.modify;
}

void static MOSettingsOptions.photosSuggestions.modify(uint64_t a1, uint64_t a2)
{
  static MOSettingsOptions.healthAndActivitySuggestions.modify(a1, a2, 4);
}

void (*static MOSettingsOptions.locationsSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  unsigned __int8 v4;

  v2 = (void *)objc_opt_self();
  *(_QWORD *)a1 = v2;
  v3 = objc_msgSend(v2, sel_sharedInstance);
  v4 = objc_msgSend(v3, sel_getStateForSetting_, 5);

  *(_BYTE *)(a1 + 8) = v4;
  return static MOSettingsOptions.locationsSuggestions.modify;
}

void static MOSettingsOptions.locationsSuggestions.modify(uint64_t a1, uint64_t a2)
{
  static MOSettingsOptions.healthAndActivitySuggestions.modify(a1, a2, 5);
}

void (*static MOSettingsOptions.stateOfMindSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  unsigned __int8 v4;

  v2 = (void *)objc_opt_self();
  *(_QWORD *)a1 = v2;
  v3 = objc_msgSend(v2, sel_sharedInstance);
  v4 = objc_msgSend(v3, sel_getStateForSetting_, 9);

  *(_BYTE *)(a1 + 8) = v4;
  return static MOSettingsOptions.stateOfMindSuggestions.modify;
}

void static MOSettingsOptions.stateOfMindSuggestions.modify(uint64_t a1, uint64_t a2)
{
  static MOSettingsOptions.healthAndActivitySuggestions.modify(a1, a2, 9);
}

void (*static MOSettingsOptions.reflectionSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  unsigned __int8 v4;

  v2 = (void *)objc_opt_self();
  *(_QWORD *)a1 = v2;
  v3 = objc_msgSend(v2, sel_sharedInstance);
  v4 = objc_msgSend(v3, sel_getStateForSetting_, 10);

  *(_BYTE *)(a1 + 8) = v4;
  return static MOSettingsOptions.reflectionSuggestions.modify;
}

void static MOSettingsOptions.reflectionSuggestions.modify(uint64_t a1, uint64_t a2)
{
  static MOSettingsOptions.healthAndActivitySuggestions.modify(a1, a2, 10);
}

void (*static MOSettingsOptions.nearbyPeopleSuggestions.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  unsigned __int8 v4;

  v2 = (void *)objc_opt_self();
  *(_QWORD *)a1 = v2;
  v3 = objc_msgSend(v2, sel_sharedInstance);
  v4 = objc_msgSend(v3, sel_getStateForSetting_, 6);

  *(_BYTE *)(a1 + 8) = v4;
  return static MOSettingsOptions.nearbyPeopleSuggestions.modify;
}

void static MOSettingsOptions.nearbyPeopleSuggestions.modify(uint64_t a1, uint64_t a2)
{
  static MOSettingsOptions.healthAndActivitySuggestions.modify(a1, a2, 6);
}

void static MOSettingsOptions.healthAndActivitySuggestions.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(unsigned __int8 *)(a1 + 8);
  v5 = objc_msgSend(*(id *)a1, sel_sharedInstance);
  objc_msgSend(v5, sel_setState_forSetting_, v4, a3);

}

uint64_t MOSettingsOptions.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t MOSettingsOptions.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t MOSettingsOptions.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t MOSettingsOptions.init()()
{
  uint64_t v0;

  return v0;
}

void specialized static MOSettingsOptions.setDefaultSettings()()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v1, sel_setState_forSetting_, 1, 1);

  v2 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v2, sel_setState_forSetting_, 1, 2);

  v3 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v3, sel_setState_forSetting_, 1, 3);

  v4 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v4, sel_setState_forSetting_, 1, 4);

  v5 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v5, sel_setState_forSetting_, 1, 5);

  v6 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v6, sel_setState_forSetting_, 1, 6);

  v7 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v7, sel_setState_forSetting_, 1, 10);

  v8 = objc_msgSend(v0, sel_sharedInstance);
  objc_msgSend(v8, sel_setState_forSetting_, 0, 9);

}

uint64_t type metadata accessor for MOSettingsOptions()
{
  return objc_opt_self();
}

void __swiftcall MOOnboardingManagerUI.createSheetOnboardingViewController()(OBNavigationController *__return_ptr retstr)
{
  objc_class *v1;
  char *v2;
  char *v3;
  id v4;
  _QWORD *v5;
  objc_super v6;

  v1 = (objc_class *)type metadata accessor for MOOnboardingNavigationController();
  v2 = (char *)objc_allocWithZone(v1);
  v3 = &v2[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate];
  *(_QWORD *)&v2[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate] = 0;
  swift_beginAccess();
  *(_QWORD *)v3 = 0;
  swift_unknownObjectRelease();
  v4 = objc_allocWithZone((Class)type metadata accessor for MOOnboardingViewController());
  v5 = MOOnboardingViewController.init()();
  (*(void (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & *v5) + 0x88))(0);
  v6.receiver = v2;
  v6.super_class = v1;
  -[OBNavigationController initWithRootViewController:](&v6, sel_initWithRootViewController_, v5);

}

id MOOnboardingManagerUI.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MOOnboardingManagerUI.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MOOnboardingManagerUI();
  return objc_msgSendSuper2(&v2, sel_init);
}

id MOOnboardingManagerUI.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MOOnboardingManagerUI();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id specialized MOOnboardingManagerUI.createSheetOnboardingViewController(with:)(uint64_t a1)
{
  objc_class *v2;
  char *v3;
  char *v4;
  id v5;
  _QWORD *v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  id v9;
  objc_super v11;

  v2 = (objc_class *)type metadata accessor for MOOnboardingNavigationController();
  v3 = (char *)objc_allocWithZone(v2);
  v4 = &v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate];
  *(_QWORD *)&v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate] = 0;
  swift_beginAccess();
  *(_QWORD *)v4 = a1;
  swift_unknownObjectRetain_n();
  swift_unknownObjectRelease();
  v5 = objc_allocWithZone((Class)type metadata accessor for MOOnboardingViewController());
  v6 = MOOnboardingViewController.init()();
  v7 = *(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v6) + 0x88);
  v8 = swift_unknownObjectRetain();
  v7(v8);
  v11.receiver = v3;
  v11.super_class = v2;
  v9 = objc_msgSendSuper2(&v11, sel_initWithRootViewController_, v6);

  swift_unknownObjectRelease();
  return v9;
}

uint64_t type metadata accessor for MOOnboardingManagerUI()
{
  return objc_opt_self();
}

uint64_t MOOnboardingSettingsLogger.shared.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for shared != -1)
    swift_once();
  v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static MOOnboardingSettingsLogger.shared);
}

uint64_t one-time initialization function for shared()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static MOOnboardingSettingsLogger.shared);
  __swift_project_value_buffer(v0, (uint64_t)static MOOnboardingSettingsLogger.shared);
  return Logger.init(subsystem:category:)();
}

uint64_t static MOOnboardingSettingsLogger.shared.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for shared != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static MOOnboardingSettingsLogger.shared);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t MOOnboardingSettingsLogger.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t MOOnboardingSettingsLogger.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t MOOnboardingSettingsLogger.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t MOOnboardingSettingsLogger.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t type metadata accessor for MOOnboardingSettingsLogger()
{
  return objc_opt_self();
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

void __swiftcall AppSetting.init(title:subtitle:enableSwitch:accessibilityIdentifier:)(MomentsOnboardingAndSettings::AppSetting *__return_ptr retstr, Swift::String title, Swift::String_optional subtitle, Swift::Bool_optional enableSwitch, Swift::String_optional accessibilityIdentifier)
{
  retstr->title = title;
  retstr->subtitle = subtitle;
  retstr->enableSwitch = enableSwitch;
  retstr->accessibilityIdentifier = accessibilityIdentifier;
}

uint64_t AppSettingsOptionGroup.init(appSettings:header:footer:)(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;

  v4 = specialized AppSettingsOptionGroup.init(appSettings:header:footer:)(a1, a2, a3);

  return v4;
}

uint64_t AppSetting.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSetting.subtitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSetting.enableSwitch.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t AppSetting.accessibilityIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

void *AppSettingsOptionGroup.header.getter(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  return a2;
}

void *AppSettingsOptionGroup.footer.getter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  return a3;
}

uint64_t key path getter for SwitchCell.onSwitchChange : SwitchCell@<X0>(_QWORD **a1@<X0>, uint64_t (**a2)(unsigned __int8 *a1)@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(unsigned __int8 *);

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x58))();
  if (result)
  {
    v5 = result;
    v6 = v4;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v5;
    *(_QWORD *)(result + 24) = v6;
    v7 = partial apply for thunk for @escaping @callee_guaranteed (@unowned Bool) -> ();
  }
  else
  {
    v7 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(unsigned __int8 *))result;
  return result;
}

uint64_t key path setter for SwitchCell.onSwitchChange : SwitchCell(uint64_t *a1, _QWORD **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(char);
  uint64_t (*v7)(uint64_t (*)(char), uint64_t);

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Bool) -> (@out ());
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(uint64_t (**)(uint64_t (*)(char), uint64_t))((*MEMORY[0x24BEE4EA0] & **a2) + 0x60);
  outlined copy of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(v3);
  return v7(v6, v5);
}

uint64_t SwitchCell.onSwitchChange.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange);
  swift_beginAccess();
  v2 = *v1;
  outlined copy of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(*v1);
  return v2;
}

uint64_t SwitchCell.onSwitchChange.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return outlined consume of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(v6);
}

uint64_t (*SwitchCell.onSwitchChange.modify())()
{
  swift_beginAccess();
  return MOSuggestionSheetOnboardingSettingsViewController.hasTappedOnboardingCompletion.modify;
}

id SwitchCell.__allocating_init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a3)
  {
    v6 = (void *)MEMORY[0x2426A69DC](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id SwitchCell.init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v5;
  void *v6;
  id v7;
  objc_super v9;

  v5 = &v3[OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  if (a3)
  {
    v6 = (void *)MEMORY[0x2426A69DC](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for SwitchCell();
  v7 = objc_msgSendSuper2(&v9, sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id SwitchCell.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SwitchCell.init(coder:)(void *a1)
{
  char *v1;
  char *v3;
  objc_class *v4;
  id v5;
  objc_super v7;

  v3 = &v1[OBJC_IVAR____TtC28MomentsOnboardingAndSettings10SwitchCell_onSwitchChange];
  v4 = (objc_class *)type metadata accessor for SwitchCell();
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v7.receiver = v1;
  v7.super_class = v4;
  v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, a1);

  return v5;
}

id SwitchCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwitchCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id ContentSizedTableView.contentSize.getter()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_contentSize);
}

id ContentSizedTableView.contentSize.setter(double a1, double a2)
{
  void *v2;
  objc_super v6;

  v6.receiver = v2;
  v6.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v6, sel_setContentSize_, a1, a2);
  return objc_msgSend(v2, sel_invalidateIntrinsicContentSize);
}

void (*ContentSizedTableView.contentSize.modify(objc_super **a1))(double **a1, char a2)
{
  void *v1;
  objc_super *v3;
  uint64_t ObjectType;
  void *v5;
  objc_class *v6;

  v3 = (objc_super *)malloc(0x50uLL);
  *a1 = v3;
  v3[4].receiver = v1;
  ObjectType = swift_getObjectType();
  v3[4].super_class = (Class)ObjectType;
  v3[1].receiver = v1;
  v3[1].super_class = (Class)ObjectType;
  objc_msgSendSuper2(v3 + 1, sel_contentSize);
  v3->receiver = v5;
  v3->super_class = v6;
  return ContentSizedTableView.contentSize.modify;
}

void ContentSizedTableView.contentSize.modify(double **a1, char a2)
{
  double *v2;
  double v3;
  double v4;
  objc_class *v5;
  void *v6;
  objc_super *v7;

  v2 = *a1;
  v3 = **a1;
  v4 = (*a1)[1];
  v6 = (void *)*((_QWORD *)*a1 + 8);
  v5 = (objc_class *)*((_QWORD *)*a1 + 9);
  v7 = (objc_super *)*a1;
  if ((a2 & 1) != 0)
  {
    v7[2].receiver = v6;
    v7[2].super_class = v5;
    objc_msgSendSuper2(v7 + 2, sel_setContentSize_, v3, v4);
  }
  else
  {
    v7[3].receiver = v6;
    v7[3].super_class = v5;
    objc_msgSendSuper2(v7 + 3, sel_setContentSize_, v3, v4);
    objc_msgSend(v6, sel_invalidateIntrinsicContentSize);
  }
  free(v2);
}

double ContentSizedTableView.intrinsicContentSize.getter()
{
  void *v0;
  objc_class *ObjectType;
  double v2;
  objc_super v4;

  ObjectType = (objc_class *)swift_getObjectType();
  objc_msgSend(v0, sel_layoutIfNeeded);
  v2 = *MEMORY[0x24BEBE9C8];
  v4.receiver = v0;
  v4.super_class = ObjectType;
  objc_msgSendSuper2(&v4, sel_contentSize);
  return v2;
}

id ContentSizedTableView.__allocating_init(frame:style:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  objc_class *v5;

  return objc_msgSend(objc_allocWithZone(v5), sel_initWithFrame_style_, a1, a2, a3, a4, a5);
}

id ContentSizedTableView.init(frame:style:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  objc_super v12;

  v12.receiver = v5;
  v12.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v12, sel_initWithFrame_style_, a1, a2, a3, a4, a5);
}

id ContentSizedTableView.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ContentSizedTableView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t specialized AppSettingsOptionGroup.init(appSettings:header:footer:)(uint64_t a1, void *a2, void *a3)
{
  char **v5;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;

  v5 = &off_251343000;
  if (!a2)
  {
    v14 = a3;
    if (!a3)
      return a1;
    goto LABEL_3;
  }
  v7 = (void *)objc_opt_self();
  v8 = *MEMORY[0x24BEBE200];
  v9 = a3;
  v10 = a2;
  v5 = &off_251343000;
  v11 = objc_msgSend(v7, sel_preferredFontForTextStyle_, v8);
  objc_msgSend(v10, sel_setFont_, v11);

  objc_msgSend(v10, (SEL)0x2513448D9, 0);
  objc_msgSend(v10, (SEL)0x251344848, 1);
  objc_msgSend(v10, (SEL)&off_2513444C8, 0);
  objc_msgSend(v10, (SEL)0x251344729, -1);
  if (a3)
  {
LABEL_3:
    v12 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE1F0]);
    objc_msgSend(a3, v5[472], v12);

    objc_msgSend(a3, sel_setEditable_, 0);
    objc_msgSend(a3, sel_setSelectable_, 1);
    objc_msgSend(a3, sel_setScrollEnabled_, 0);
    objc_msgSend(a3, sel_setDataDetectorTypes_, -1);

  }
  return a1;
}

uint64_t outlined copy of (@escaping @callee_guaranteed (@unowned Bool) -> ())?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t type metadata accessor for SwitchCell()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for AppSetting(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AppSetting()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppSetting(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppSetting(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AppSetting(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppSetting(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppSetting(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppSetting()
{
  return &type metadata for AppSetting;
}

void destroy for AppSettingsOptionGroup(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

_QWORD *initializeBufferWithCopyOfBuffer for AppSettingsOptionGroup(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  v5 = v3;
  v6 = v4;
  return a1;
}

_QWORD *assignWithCopy for AppSettingsOptionGroup(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[1];
  v5 = (void *)a2[1];
  a1[1] = v5;
  v6 = v5;

  v7 = (void *)a1[2];
  v8 = (void *)a2[2];
  a1[2] = v8;
  v9 = v8;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppSettingsOptionGroup(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSettingsOptionGroup(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppSettingsOptionGroup(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSettingsOptionGroup()
{
  return &type metadata for AppSettingsOptionGroup;
}

uint64_t type metadata accessor for ContentSizedTableView()
{
  return objc_opt_self();
}

uint64_t sub_2422CAD50()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Bool) -> (@out ())(char a1)
{
  uint64_t v1;
  uint64_t (*v2)(char *);
  char v4;

  v2 = *(uint64_t (**)(char *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@unowned Bool) -> ()(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t ResourceBundleClass.__deallocating_deinit()
{
  return swift_deallocClassInstance();
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

uint64_t one-time initialization function for journalingSuggestionsIcon80Masked(uint64_t a1)
{
  return one-time initialization function for journalingSuggestionsIcon80Masked(a1, static ImageResource.journalingSuggestionsIcon80Masked, 0xD000000000000023, 0x80000002422CFD50);
}

uint64_t ImageResource.journalingSuggestionsIcon80Masked.unsafeMutableAddressor()
{
  return ImageResource.journalingSuggestionsIcon80Masked.unsafeMutableAddressor(&one-time initialization token for journalingSuggestionsIcon80Masked, (uint64_t)static ImageResource.journalingSuggestionsIcon80Masked);
}

uint64_t static ImageResource.journalingSuggestionsIcon80Masked.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.journalingSuggestionsIcon80Masked.getter(&one-time initialization token for journalingSuggestionsIcon80Masked, (uint64_t)static ImageResource.journalingSuggestionsIcon80Masked, a1);
}

uint64_t one-time initialization function for momentsPrivacy80Masked(uint64_t a1)
{
  return one-time initialization function for journalingSuggestionsIcon80Masked(a1, static ImageResource.momentsPrivacy80Masked, 0xD000000000000018, 0x80000002422D0600);
}

uint64_t one-time initialization function for journalingSuggestionsIcon80Masked(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for ImageResource();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (one-time initialization token for resourceBundle != -1)
    swift_once();
  return MEMORY[0x2426A6934](a3, a4, resourceBundle.super.isa);
}

uint64_t ImageResource.momentsPrivacy80Masked.unsafeMutableAddressor()
{
  return ImageResource.journalingSuggestionsIcon80Masked.unsafeMutableAddressor(&one-time initialization token for momentsPrivacy80Masked, (uint64_t)static ImageResource.momentsPrivacy80Masked);
}

uint64_t ImageResource.journalingSuggestionsIcon80Masked.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = type metadata accessor for ImageResource();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static ImageResource.momentsPrivacy80Masked.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.journalingSuggestionsIcon80Masked.getter(&one-time initialization token for momentsPrivacy80Masked, (uint64_t)static ImageResource.momentsPrivacy80Masked, a1);
}

uint64_t static ImageResource.journalingSuggestionsIcon80Masked.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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

void _MODiagnosticReporter_NotificationHandler_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_5_0(&dword_2422B0000, a2, v4, "_MODiagnosticReporter_NotificationHandler with flags %@", (uint8_t *)&v5);

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

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)MEMORY[0x24BDCF638]();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF650]();
}

uint64_t IndexPath.row.getter()
{
  return MEMORY[0x24BEBBE88]();
}

uint64_t IndexPath.init(item:section:)()
{
  return MEMORY[0x24BEBBE90]();
}

uint64_t IndexPath.section.getter()
{
  return MEMORY[0x24BEBBEB8]();
}

uint64_t type metadata accessor for IndexPath()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return MEMORY[0x24BDC6D30]();
}

uint64_t type metadata accessor for ImageResource()
{
  return MEMORY[0x24BDC6D48]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t UIListContentConfiguration.secondaryText.setter()
{
  return MEMORY[0x24BEBC478]();
}

uint64_t UIListContentConfiguration.TextProperties.color.setter()
{
  return MEMORY[0x24BEBC4E0]();
}

uint64_t UIListContentConfiguration.secondaryTextProperties.modify()
{
  return MEMORY[0x24BEBC560]();
}

uint64_t UIListContentConfiguration.text.setter()
{
  return MEMORY[0x24BEBC5C0]();
}

uint64_t type metadata accessor for UIListContentConfiguration()
{
  return MEMORY[0x24BEBC5F8]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t UITableViewCell.contentConfiguration.setter()
{
  return MEMORY[0x24BEBCBF0]();
}

uint64_t UITableViewCell.defaultContentConfiguration()()
{
  return MEMORY[0x24BEBCC08]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return MEMORY[0x24BEBD030]();
}

uint64_t UIButton.Configuration.buttonSize.setter()
{
  return MEMORY[0x24BEBD050]();
}

uint64_t UIButton.Configuration.contentInsets.setter()
{
  return MEMORY[0x24BEBD0B8]();
}

uint64_t type metadata accessor for UIButton.Configuration.Size()
{
  return MEMORY[0x24BEBD190]();
}

uint64_t static UIButton.Configuration.plain()()
{
  return MEMORY[0x24BEBD1B0]();
}

uint64_t UIButton.Configuration.title.setter()
{
  return MEMORY[0x24BEBD1C0]();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return MEMORY[0x24BEBD1F8]();
}

uint64_t UIButton.init(configuration:primaryAction:)()
{
  return MEMORY[0x24BEBD208]();
}

uint64_t Optional._bridgeToObjectiveC()()
{
  return MEMORY[0x24BEE1C60]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x24BDAF600](a1, a2, a3, a4, __argv, __envp);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
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

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x24BDB0478](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

