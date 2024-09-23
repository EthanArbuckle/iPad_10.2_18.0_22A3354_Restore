@implementation EKUIEventInviteesViewController

- (EKUIEventInviteesViewController)initWithEvent:(id)a3 fromDetail:(BOOL)a4 model:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  EKUIEventInviteesViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id buf[2];
  objc_super v29;
  _QWORD v30[2];

  v6 = a4;
  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)EKUIEventInviteesViewController;
  v10 = -[EKUIEventInviteesViewController initWithNibName:bundle:](&v29, sel_initWithNibName_bundle_, 0, 0);
  if (v10)
  {
    EventKitUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Invitees"), &stru_1E601DFA8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIEventInviteesViewController setTitle:](v10, "setTitle:", v12);

    objc_msgSend(v8, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIEventInviteesViewController setSelectedStartDate:](v10, "setSelectedStartDate:", v13);

    objc_msgSend(v8, "endDateUnadjustedForLegacyClients");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIEventInviteesViewController setSelectedEndDate:](v10, "setSelectedEndDate:", v14);

    -[EKUIEventInviteesViewController setEvent:](v10, "setEvent:", v8);
    -[EKUIEventInviteesViewController setResetAttendeesSections:](v10, "setResetAttendeesSections:", 1);
    -[EKUIEventInviteesViewController setResetConflictResolutionSections:](v10, "setResetConflictResolutionSections:", 1);
    -[EKUIEventInviteesViewController setFromDetail:](v10, "setFromDetail:", v6);
    -[EKUIEventInviteesViewController setProhibitCallingSearcherStateChanged:](v10, "setProhibitCallingSearcherStateChanged:", 0);
    objc_storeStrong((id *)&v10->_model, a5);
    -[EKUIEventInviteesViewController event](v10, "event");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isSelfOrganized");

    v17 = MEMORY[0x1E0C809B0];
    if (v16)
    {
      v18 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1AF84D000, v18, OS_LOG_TYPE_DEBUG, "Initializing the availability searcher.", (uint8_t *)buf, 2u);
      }
      objc_initWeak(buf, v10);
      v19 = objc_alloc(MEMORY[0x1E0CAA0A0]);
      v26[0] = v17;
      v26[1] = 3221225472;
      v26[2] = __66__EKUIEventInviteesViewController_initWithEvent_fromDetail_model___block_invoke;
      v26[3] = &unk_1E6018A48;
      objc_copyWeak(&v27, buf);
      v20 = (void *)objc_msgSend(v19, "initWithStateChangedCallback:", v26);
      -[EKUIEventInviteesViewController setAvailabilitySearcher:](v10, "setAvailabilitySearcher:", v20);

      objc_destroyWeak(&v27);
      objc_destroyWeak(buf);
    }
    objc_initWeak(buf, v10);
    v30[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __66__EKUIEventInviteesViewController_initWithEvent_fromDetail_model___block_invoke_3;
    v24[3] = &unk_1E6018610;
    objc_copyWeak(&v25, buf);
    v22 = (id)-[EKUIEventInviteesViewController registerForTraitChanges:withHandler:](v10, "registerForTraitChanges:withHandler:", v21, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(buf);
  }

  return v10;
}

void __66__EKUIEventInviteesViewController_initWithEvent_fromDetail_model___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__EKUIEventInviteesViewController_initWithEvent_fromDetail_model___block_invoke_2;
  v3[3] = &unk_1E6018A20;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __66__EKUIEventInviteesViewController_initWithEvent_fromDetail_model___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_searcherStateChanged:", *(_QWORD *)(a1 + 40));

}

void __66__EKUIEventInviteesViewController_initWithEvent_fromDetail_model___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetBackgroundColor");

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CA9F70];
  -[EKUIEventInviteesViewController event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);
  -[EKUIEventInviteesViewController inviteesView](self, "inviteesView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[EKUIEventInviteesViewController inviteesView](self, "inviteesView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataSource:", 0);

  v8.receiver = self;
  v8.super_class = (Class)EKUIEventInviteesViewController;
  -[EKUIEventInviteesViewController dealloc](&v8, sel_dealloc);
}

- (void)loadView
{
  id v3;
  void *v4;
  EKUIEventInviteesView *v5;
  EKUIEventInviteesView *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v7 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__eventModified_, *MEMORY[0x1E0CA9F70], self->_event);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__fontSizeDefinitionsChanged_, *MEMORY[0x1E0DC48E8], 0);
  v5 = [EKUIEventInviteesView alloc];
  objc_msgSend(v7, "bounds");
  v6 = -[EKUIEventInviteesView initWithFrame:style:](v5, "initWithFrame:style:", 2);
  -[EKUIEventInviteesView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
  -[EKUIEventInviteesView setDelegate:](v6, "setDelegate:", self);
  -[EKUIEventInviteesView setDataSource:](v6, "setDataSource:", self);
  -[EKUIEventInviteesViewController setInviteesView:](self, "setInviteesView:", v6);
  if (EKUICatalyst())
    -[EKUIEventInviteesView setSeparatorStyle:](v6, "setSeparatorStyle:", 1);
  -[EKUIEventInviteesViewController setTableView:](self, "setTableView:", v6);
  -[EKUIEventInviteesViewController resetBackgroundColor](self, "resetBackgroundColor");
  objc_msgSend(v7, "addSubview:", v6);
  -[EKUIEventInviteesViewController setView:](self, "setView:", v7);

}

- (void)resetBackgroundColor
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = -[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover");
  -[EKUIEventInviteesViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (BOOL)hidesBottomBarWhenPushed
{
  return 1;
}

- (void)viewDidLoad
{
  EKUIInviteesViewAddInviteesSection *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  EKUIInviteesViewRespondedInviteesSection *v7;
  EKUIInviteesViewNotRespondedInviteesSection *v8;
  EKUIInviteesViewInvisibleInviteeStatusSection *v9;
  EKUIInviteesViewAvailabilitySection *v10;
  EKUIInviteesViewProposedTimeSection *v11;
  EKUIInviteesViewOriginalConflictSection *v12;
  void *v13;
  void *v14;
  void *v15;
  EKUIInviteesViewAllInviteesCanAttendSection *v16;
  void *v17;
  void *v18;
  void *v19;
  EKUIInviteesViewSomeInviteesCanAttendSection *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t i;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t j;
  id v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[4];
  id v127;
  id v128;
  _QWORD v129[4];
  id v130;
  id v131;
  _QWORD v132[4];
  id v133;
  _QWORD v134[4];
  id v135;
  id v136;
  _QWORD v137[4];
  id v138;
  id v139;
  _QWORD v140[4];
  id v141;
  _QWORD v142[4];
  id v143;
  id v144;
  _QWORD v145[4];
  id v146;
  id v147;
  _QWORD v148[4];
  id v149;
  id v150;
  _QWORD v151[4];
  id v152;
  id v153;
  _QWORD v154[4];
  id v155;
  id v156;
  _QWORD v157[4];
  id v158;
  _QWORD v159[4];
  id v160;
  id v161;
  _QWORD v162[4];
  id v163;
  _QWORD v164[4];
  id v165;
  _QWORD v166[4];
  id v167;
  id v168;
  _QWORD v169[4];
  id v170;
  id v171;
  _QWORD v172[4];
  id v173;
  id v174;
  int v175;
  _QWORD v176[4];
  id v177;
  id v178;
  int v179;
  _QWORD v180[4];
  id v181;
  id v182;
  _QWORD v183[4];
  id v184;
  id v185;
  _QWORD v186[4];
  id v187;
  id v188;
  _QWORD v189[4];
  id v190;
  id v191;
  _QWORD v192[4];
  id v193;
  _QWORD v194[4];
  id v195;
  _QWORD v196[4];
  id v197;
  _QWORD v198[4];
  id v199;
  _QWORD v200[4];
  id v201;
  _QWORD v202[4];
  id v203;
  _QWORD aBlock[4];
  id v205;
  id location;
  objc_super v207;
  uint8_t v208[128];
  uint8_t buf[4];
  void *v210;
  _QWORD v211[13];

  v211[11] = *MEMORY[0x1E0C80C00];
  v207.receiver = self;
  v207.super_class = (Class)EKUIEventInviteesViewController;
  -[EKUIEventInviteesViewController viewDidLoad](&v207, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v3 = objc_alloc_init(EKUIInviteesViewAddInviteesSection);
  -[EKUIEventInviteesViewController setAddInviteesSection:](self, "setAddInviteesSection:", v3);

  v4 = (void *)objc_opt_new();
  -[EKUIEventInviteesViewController setRespondedSection:](self, "setRespondedSection:", v4);

  v5 = 0;
  do
  {
    -[EKUIEventInviteesViewController respondedSection](self, "respondedSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[EKUIInviteesViewRespondedInviteesSection initWithResponseType:]([EKUIInviteesViewRespondedInviteesSection alloc], "initWithResponseType:", v5);
    objc_msgSend(v6, "addObject:", v7);

    v5 = (v5 + 1);
  }
  while ((_DWORD)v5 != 3);
  v8 = objc_alloc_init(EKUIInviteesViewNotRespondedInviteesSection);
  -[EKUIEventInviteesViewController setNotRespondedSection:](self, "setNotRespondedSection:", v8);

  v9 = objc_alloc_init(EKUIInviteesViewInvisibleInviteeStatusSection);
  -[EKUIEventInviteesViewController setInvisibleInviteeStatusSection:](self, "setInvisibleInviteeStatusSection:", v9);

  v10 = objc_alloc_init(EKUIInviteesViewAvailabilitySection);
  -[EKUIEventInviteesViewController setAvailabilitySection:](self, "setAvailabilitySection:", v10);

  v11 = objc_alloc_init(EKUIInviteesViewProposedTimeSection);
  -[EKUIEventInviteesViewController setProposedTimeSection:](self, "setProposedTimeSection:", v11);

  v12 = objc_alloc_init(EKUIInviteesViewOriginalConflictSection);
  -[EKUIEventInviteesViewController setOriginalConflictSection:](self, "setOriginalConflictSection:", v12);

  -[EKUIEventInviteesViewController event](self, "event");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startTimeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController originalConflictSection](self, "originalConflictSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimeZone:", v14);

  v16 = objc_alloc_init(EKUIInviteesViewAllInviteesCanAttendSection);
  -[EKUIEventInviteesViewController setAllInviteesCanAttendSection:](self, "setAllInviteesCanAttendSection:", v16);

  -[EKUIEventInviteesViewController event](self, "event");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startTimeZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTimeZone:", v18);

  v20 = objc_alloc_init(EKUIInviteesViewSomeInviteesCanAttendSection);
  -[EKUIEventInviteesViewController setSomeInviteesCanAttendSection:](self, "setSomeInviteesCanAttendSection:", v20);

  -[EKUIEventInviteesViewController event](self, "event");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startTimeZone");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTimeZone:", v22);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke;
  aBlock[3] = &unk_1E6019108;
  objc_copyWeak(&v205, &location);
  v24 = _Block_copy(aBlock);
  v202[0] = MEMORY[0x1E0C809B0];
  v202[1] = 3221225472;
  v202[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_39;
  v202[3] = &unk_1E6019130;
  objc_copyWeak(&v203, &location);
  v121 = _Block_copy(v202);
  v200[0] = MEMORY[0x1E0C809B0];
  v200[1] = 3221225472;
  v200[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_42;
  v200[3] = &unk_1E6019180;
  objc_copyWeak(&v201, &location);
  v25 = _Block_copy(v200);
  v198[0] = MEMORY[0x1E0C809B0];
  v198[1] = 3221225472;
  v198[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_3;
  v198[3] = &unk_1E6018AC0;
  objc_copyWeak(&v199, &location);
  v117 = _Block_copy(v198);
  v196[0] = MEMORY[0x1E0C809B0];
  v196[1] = 3221225472;
  v196[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_50;
  v196[3] = &unk_1E60191A8;
  objc_copyWeak(&v197, &location);
  v115 = _Block_copy(v196);
  v194[0] = MEMORY[0x1E0C809B0];
  v194[1] = 3221225472;
  v194[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_52;
  v194[3] = &unk_1E60191D0;
  objc_copyWeak(&v195, &location);
  v119 = _Block_copy(v194);
  v192[0] = MEMORY[0x1E0C809B0];
  v192[1] = 3221225472;
  v192[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_54;
  v192[3] = &unk_1E60191F8;
  objc_copyWeak(&v193, &location);
  v120 = _Block_copy(v192);
  -[EKUIEventInviteesViewController addInviteesSection](self, "addInviteesSection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setParticipantTapped:", v121);

  v189[0] = MEMORY[0x1E0C809B0];
  v189[1] = 3221225472;
  v189[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_2_56;
  v189[3] = &unk_1E6019220;
  v27 = v25;
  v190 = v27;
  objc_copyWeak(&v191, &location);
  -[EKUIEventInviteesViewController addInviteesSection](self, "addInviteesSection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setParticipantRemoved:", v189);

  v186[0] = MEMORY[0x1E0C809B0];
  v186[1] = 3221225472;
  v186[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_3_58;
  v186[3] = &unk_1E6018B60;
  v29 = v24;
  v187 = v29;
  objc_copyWeak(&v188, &location);
  -[EKUIEventInviteesViewController addInviteesSection](self, "addInviteesSection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTableViewCellHook:", v186);

  -[EKUIEventInviteesViewController addInviteesSection](self, "addInviteesSection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setParticipantSetRole:", v120);

  -[EKUIEventInviteesViewController invisibleInviteeStatusSection](self, "invisibleInviteeStatusSection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setParticipantTapped:", v121);

  v183[0] = MEMORY[0x1E0C809B0];
  v183[1] = 3221225472;
  v183[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_4;
  v183[3] = &unk_1E6019220;
  v33 = v27;
  v184 = v33;
  objc_copyWeak(&v185, &location);
  -[EKUIEventInviteesViewController invisibleInviteeStatusSection](self, "invisibleInviteeStatusSection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setParticipantRemoved:", v183);

  -[EKUIEventInviteesViewController invisibleInviteeStatusSection](self, "invisibleInviteeStatusSection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setParticipantSetRole:", v120);

  v180[0] = MEMORY[0x1E0C809B0];
  v180[1] = 3221225472;
  v180[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_5;
  v180[3] = &unk_1E6018B60;
  v36 = v29;
  v181 = v36;
  objc_copyWeak(&v182, &location);
  -[EKUIEventInviteesViewController respondedSection](self, "respondedSection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectAtIndexedSubscript:", 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTableViewCellHook:", v180);

  for (i = 0; i != 3; ++i)
  {
    -[EKUIEventInviteesViewController respondedSection](self, "respondedSection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectAtIndexedSubscript:", i);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setParticipantTapped:", v121);

    v176[0] = MEMORY[0x1E0C809B0];
    v176[1] = 3221225472;
    v176[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_6;
    v176[3] = &unk_1E6019248;
    v42 = v33;
    v177 = v42;
    objc_copyWeak(&v178, &location);
    v179 = i;
    -[EKUIEventInviteesViewController respondedSection](self, "respondedSection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndexedSubscript:", i);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setParticipantRemoved:", v176);

    v172[0] = MEMORY[0x1E0C809B0];
    v172[1] = 3221225472;
    v172[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_7;
    v172[3] = &unk_1E6019270;
    v45 = v36;
    v173 = v45;
    objc_copyWeak(&v174, &location);
    v175 = i;
    -[EKUIEventInviteesViewController respondedSection](self, "respondedSection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectAtIndexedSubscript:", i);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setTableViewCellHook:", v172);

    -[EKUIEventInviteesViewController respondedSection](self, "respondedSection");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectAtIndexedSubscript:", i);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setParticipantSetRole:", v120);

    objc_destroyWeak(&v174);
    objc_destroyWeak(&v178);

  }
  -[EKUIEventInviteesViewController notRespondedSection](self, "notRespondedSection");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setParticipantSetRole:", v120);

  -[EKUIEventInviteesViewController notRespondedSection](self, "notRespondedSection");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setParticipantTapped:", v121);

  v169[0] = MEMORY[0x1E0C809B0];
  v169[1] = 3221225472;
  v169[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_8;
  v169[3] = &unk_1E6019220;
  v110 = v42;
  v170 = v110;
  objc_copyWeak(&v171, &location);
  -[EKUIEventInviteesViewController notRespondedSection](self, "notRespondedSection");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setParticipantRemoved:", v169);

  v166[0] = MEMORY[0x1E0C809B0];
  v166[1] = 3221225472;
  v166[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_9;
  v166[3] = &unk_1E6018B60;
  v53 = v45;
  v167 = v53;
  objc_copyWeak(&v168, &location);
  -[EKUIEventInviteesViewController notRespondedSection](self, "notRespondedSection");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setTableViewCellHook:", v166);

  v164[0] = MEMORY[0x1E0C809B0];
  v164[1] = 3221225472;
  v164[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_10;
  v164[3] = &unk_1E6018A70;
  objc_copyWeak(&v165, &location);
  -[EKUIEventInviteesViewController notRespondedSection](self, "notRespondedSection");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setAddInviteesTapped:", v164);
  -[EKUIEventInviteesViewController addInviteesSection](self, "addInviteesSection");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setAddInviteesTapped:", v164);

  v162[0] = MEMORY[0x1E0C809B0];
  v162[1] = 3221225472;
  v162[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_11;
  v162[3] = &unk_1E6018A70;
  objc_copyWeak(&v163, &location);
  -[EKUIEventInviteesViewController availabilitySection](self, "availabilitySection");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setViewAvailabilityTapped:", v162);

  v159[0] = MEMORY[0x1E0C809B0];
  v159[1] = 3221225472;
  v159[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_14;
  v159[3] = &unk_1E6018B60;
  v58 = v53;
  v160 = v58;
  objc_copyWeak(&v161, &location);
  -[EKUIEventInviteesViewController availabilitySection](self, "availabilitySection");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setTableViewCellHook:", v159);

  -[EKUIEventInviteesViewController proposedTimeSection](self, "proposedTimeSection");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController availabilitySearcher](self, "availabilitySearcher");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setAvailabilitySearcher:", v61);

  v157[0] = MEMORY[0x1E0C809B0];
  v157[1] = 3221225472;
  v157[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_15;
  v157[3] = &unk_1E6018BB0;
  v62 = v117;
  v158 = v62;
  -[EKUIEventInviteesViewController proposedTimeSection](self, "proposedTimeSection");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setShowPreviewOfEventAtTime:", v157);

  v154[0] = MEMORY[0x1E0C809B0];
  v154[1] = 3221225472;
  v154[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_16;
  v154[3] = &unk_1E6018B60;
  v64 = v58;
  v155 = v64;
  objc_copyWeak(&v156, &location);
  -[EKUIEventInviteesViewController proposedTimeSection](self, "proposedTimeSection");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setTableViewCellHook:", v154);

  v151[0] = MEMORY[0x1E0C809B0];
  v151[1] = 3221225472;
  v151[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_17;
  v151[3] = &unk_1E6018B88;
  v66 = v115;
  v152 = v66;
  objc_copyWeak(&v153, &location);
  -[EKUIEventInviteesViewController proposedTimeSection](self, "proposedTimeSection");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setNewTimeChosen:", v151);

  -[EKUIEventInviteesViewController originalConflictSection](self, "originalConflictSection");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController availabilitySearcher](self, "availabilitySearcher");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setAvailabilitySearcher:", v69);

  v148[0] = MEMORY[0x1E0C809B0];
  v148[1] = 3221225472;
  v148[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_18;
  v148[3] = &unk_1E6018B38;
  objc_copyWeak(&v150, &location);
  v70 = v62;
  v149 = v70;
  -[EKUIEventInviteesViewController originalConflictSection](self, "originalConflictSection");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setShowPreviewOfEventAtTime:", v148);

  v145[0] = MEMORY[0x1E0C809B0];
  v145[1] = 3221225472;
  v145[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_19;
  v145[3] = &unk_1E6018B60;
  v72 = v64;
  v146 = v72;
  objc_copyWeak(&v147, &location);
  -[EKUIEventInviteesViewController originalConflictSection](self, "originalConflictSection");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setTableViewCellHook:", v145);

  v142[0] = MEMORY[0x1E0C809B0];
  v142[1] = 3221225472;
  v142[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_20;
  v142[3] = &unk_1E6018B88;
  v74 = v66;
  v143 = v74;
  objc_copyWeak(&v144, &location);
  -[EKUIEventInviteesViewController originalConflictSection](self, "originalConflictSection");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setNewTimeChosen:", v142);

  -[EKUIEventInviteesViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController availabilitySearcher](self, "availabilitySearcher");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setAvailabilitySearcher:", v77);

  v140[0] = MEMORY[0x1E0C809B0];
  v140[1] = 3221225472;
  v140[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_21;
  v140[3] = &unk_1E6018BB0;
  v78 = v70;
  v141 = v78;
  -[EKUIEventInviteesViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setShowPreviewOfEventAtTime:", v140);

  v137[0] = MEMORY[0x1E0C809B0];
  v137[1] = 3221225472;
  v137[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_22;
  v137[3] = &unk_1E6018B60;
  v80 = v72;
  v138 = v80;
  objc_copyWeak(&v139, &location);
  -[EKUIEventInviteesViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setTableViewCellHook:", v137);

  v134[0] = MEMORY[0x1E0C809B0];
  v134[1] = 3221225472;
  v134[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_23;
  v134[3] = &unk_1E6018B88;
  v82 = v74;
  v135 = v82;
  objc_copyWeak(&v136, &location);
  -[EKUIEventInviteesViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setNewTimeChosen:", v134);

  -[EKUIEventInviteesViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setShowMoreAlternativeTimesTapped:", v119);

  -[EKUIEventInviteesViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController availabilitySearcher](self, "availabilitySearcher");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setAvailabilitySearcher:", v86);

  v132[0] = MEMORY[0x1E0C809B0];
  v132[1] = 3221225472;
  v132[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_24;
  v132[3] = &unk_1E6018BB0;
  v109 = v78;
  v133 = v109;
  -[EKUIEventInviteesViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setShowPreviewOfEventAtTime:", v132);

  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_25;
  v129[3] = &unk_1E6018B60;
  v107 = v80;
  v130 = v107;
  objc_copyWeak(&v131, &location);
  -[EKUIEventInviteesViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setTableViewCellHook:", v129);

  v126[0] = MEMORY[0x1E0C809B0];
  v126[1] = 3221225472;
  v126[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_26;
  v126[3] = &unk_1E6018B88;
  v108 = v82;
  v127 = v108;
  objc_copyWeak(&v128, &location);
  -[EKUIEventInviteesViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setNewTimeChosen:", v126);

  -[EKUIEventInviteesViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setShowMoreAlternativeTimesTapped:", v119);

  -[EKUIEventInviteesViewController addInviteesSection](self, "addInviteesSection");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v211[0] = v118;
  -[EKUIEventInviteesViewController invisibleInviteeStatusSection](self, "invisibleInviteeStatusSection");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v211[1] = v116;
  -[EKUIEventInviteesViewController respondedSection](self, "respondedSection");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "objectAtIndexedSubscript:", 0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v211[2] = v113;
  -[EKUIEventInviteesViewController respondedSection](self, "respondedSection");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "objectAtIndexedSubscript:", 1);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v211[3] = v111;
  -[EKUIEventInviteesViewController respondedSection](self, "respondedSection");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "objectAtIndexedSubscript:", 2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v211[4] = v92;
  -[EKUIEventInviteesViewController notRespondedSection](self, "notRespondedSection");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v211[5] = v93;
  -[EKUIEventInviteesViewController availabilitySection](self, "availabilitySection");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v211[6] = v94;
  -[EKUIEventInviteesViewController originalConflictSection](self, "originalConflictSection");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v211[7] = v95;
  -[EKUIEventInviteesViewController proposedTimeSection](self, "proposedTimeSection");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v211[8] = v96;
  -[EKUIEventInviteesViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v211[9] = v97;
  -[EKUIEventInviteesViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v211[10] = v98;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v211, 11);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController setSections:](self, "setSections:", v99);

  v100 = (id)kEKUILogInviteesHandle;
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
  {
    -[EKUIEventInviteesViewController sections](self, "sections", v107, v108);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v210 = v101;
    _os_log_impl(&dword_1AF84D000, v100, OS_LOG_TYPE_DEBUG, "Set up sections: [%@].", buf, 0xCu);

  }
  -[EKUIEventInviteesViewController inviteesView](self, "inviteesView");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  -[EKUIEventInviteesViewController sections](self, "sections");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v122, v208, 16);
  if (v104)
  {
    v105 = *(_QWORD *)v123;
    do
    {
      for (j = 0; j != v104; ++j)
      {
        if (*(_QWORD *)v123 != v105)
          objc_enumerationMutation(v103);
        objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * j), "reloadAndRegisterReusableCellsWithTableView:", v102, v107);
      }
      v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v122, v208, 16);
    }
    while (v104);
  }

  -[EKUIEventInviteesViewController _refreshIfNeeded](self, "_refreshIfNeeded");
  objc_destroyWeak(&v128);

  objc_destroyWeak(&v131);
  objc_destroyWeak(&v136);

  objc_destroyWeak(&v139);
  objc_destroyWeak(&v144);

  objc_destroyWeak(&v147);
  objc_destroyWeak(&v150);
  objc_destroyWeak(&v153);

  objc_destroyWeak(&v156);
  objc_destroyWeak(&v161);

  objc_destroyWeak(&v163);
  objc_destroyWeak(&v165);
  objc_destroyWeak(&v168);

  objc_destroyWeak(&v171);
  objc_destroyWeak(&v182);

  objc_destroyWeak(&v185);
  objc_destroyWeak(&v188);

  objc_destroyWeak(&v191);
  objc_destroyWeak(&v193);

  objc_destroyWeak(&v195);
  objc_destroyWeak(&v197);

  objc_destroyWeak(&v199);
  objc_destroyWeak(&v201);

  objc_destroyWeak(&v203);
  objc_destroyWeak(&v205);
  objc_destroyWeak(&location);
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3 < 0)
  {
    v14 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = v14;
      objc_msgSend(v15, "numberWithInteger:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v17;
      _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_ERROR, "Invalid row index given: [%@].  Will not attempt to acquire a cell.", (uint8_t *)&v23, 0xCu);

    }
    goto LABEL_9;
  }
  if (!objc_msgSend(v5, "sectionShouldBeShown"))
  {
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v7);
  v9 = objc_msgSend(WeakRetained, "_indexForSection:", v6);

  if (v9 == -1)
  {
    v18 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)MEMORY[0x1E0CB37E8];
      v20 = v18;
      objc_msgSend(v19, "numberWithInteger:", -1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v21;
      _os_log_impl(&dword_1AF84D000, v20, OS_LOG_TYPE_ERROR, "Invalid section index found: [%@].  Will not attempt to acquire a cell.", (uint8_t *)&v23, 0xCu);

    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained(v7);
  objc_msgSend(v11, "inviteesView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellForRowAtIndexPath:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v13;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  EKIdentityViewController *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEBUG, "Participant tapped: [%@].", (uint8_t *)&v7, 0xCu);
  }
  v5 = -[EKIdentityViewController initWithIdentity:]([EKIdentityViewController alloc], "initWithIdentity:", v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pushViewController:", v5);

}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_42(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v10;
    _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_DEBUG, "Participant removed: [%@].", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "inviteesView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_43;
  v23[3] = &unk_1E6019158;
  objc_copyWeak(&v28, (id *)(a1 + 32));
  v17 = v12;
  v27 = v17;
  v18 = v10;
  v24 = v18;
  v19 = v9;
  v25 = v19;
  v20 = v11;
  v26 = v20;
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_45;
  v21[3] = &unk_1E6018700;
  objc_copyWeak(&v22, (id *)(a1 + 32));
  objc_msgSend(v15, "performBatchUpdates:completion:", v23, v21);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v28);

}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_43(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  int v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "availabilitySection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sectionShouldBeShown");

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "availabilitySection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "_indexForSection:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAttendee:", *(_QWORD *)(a1 + 32));

  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "availabilitySection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "sectionShouldBeShown");

  if (v5 && (v13 & 1) == 0)
  {
    v14 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = v14;
      objc_msgSend(v15, "numberWithInteger:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v17;
      _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_DEBUG, "The show availability section was present and now is not. Deleting this section: %@", buf, 0xCu);

    }
    v18 = objc_loadWeakRetained(v2);
    objc_msgSend(v18, "inviteesView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deleteSections:withRowAnimation:", v20, 5);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "numberOfRows"))
  {
    v21 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v22 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v33 = v22;
      _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_DEBUG, "Deleting row at index path: [%@].", buf, 0xCu);
    }
    v23 = objc_loadWeakRetained(v2);
    objc_msgSend(v23, "inviteesView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "deleteRowsAtIndexPaths:withRowAnimation:", v25, 5);
  }
  else
  {
    v26 = objc_msgSend(*(id *)(a1 + 48), "section");
    v27 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v28 = (void *)MEMORY[0x1E0CB37E8];
      v29 = v27;
      objc_msgSend(v28, "numberWithInteger:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v30;
      _os_log_impl(&dword_1AF84D000, v29, OS_LOG_TYPE_DEBUG, "There are no more attendees left in section [%@].  Deleting this section.", buf, 0xCu);

    }
    v23 = objc_loadWeakRetained(v2);
    objc_msgSend(v23, "inviteesView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "deleteSections:withRowAnimation:", v25, 5);
  }

}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_45(uint64_t a1, int a2)
{
  id *v2;
  id WeakRetained;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  if (a2)
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setProhibitCallingSearcherStateChanged:", 1);

    v4 = dispatch_time(0, 600000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_2;
    block[3] = &unk_1E6018A70;
    objc_copyWeak(&v6, v2);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v6);
  }
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setProhibitCallingSearcherStateChanged:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setResetConflictResolutionSections:", 1);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "_refreshIfNeeded");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "updateCustomNavigationItemButtons");

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "setDeletedParticipants:", 1);

}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *WeakRetained;
  NSObject *v11;
  EKDayPreviewController *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412802;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_DEBUG, "Showing preview of event.  Date to show: [%@].  Overridden start date: [%@]  Overridden start date: [%@]", (uint8_t *)&v14, 0x20u);
    }
    v12 = -[EKDayPreviewController initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:model:]([EKDayPreviewController alloc], "initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:model:", v7, WeakRetained[132], v8, v9, WeakRetained[121]);
    -[EKDayPreviewController setStyle:](v12, "setStyle:", 2);
    objc_msgSend(WeakRetained, "navigationDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pushViewController:animated:", v12, 1);

  }
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_50(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  id WeakRetained;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_DEBUG, "Setting selected date.  Start date:[%@]  End date: [%@].", buf, 0x16u);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15++), "clearCheckmark", (_QWORD)v20);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v16 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v16);
  objc_msgSend(WeakRetained, "setSelectedStartDate:", v7);

  v18 = objc_loadWeakRetained(v16);
  objc_msgSend(v18, "setSelectedEndDate:", v8);

  v19 = objc_loadWeakRetained(v16);
  objc_msgSend(v19, "updateCustomNavigationItemButtons");

}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEBUG, "'Show more alternative times' tapped.", v7, 2u);
  }
  if (objc_msgSend(v3, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "inviteesView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

  }
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_54(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "event", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attendees");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v7, "isEqualToParticipant:", v17))
          objc_msgSend(v17, "setParticipantRole:", a3);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  v18 = objc_loadWeakRetained(v9);
  objc_msgSend(v18, "setResetAttendeesSections:", 1);

  v19 = objc_loadWeakRetained(v9);
  objc_msgSend(v19, "_smoothRefreshIfNeededForSections:", v8);

  v20 = objc_loadWeakRetained(v9);
  objc_msgSend(v20, "updateCustomNavigationItemButtons");

}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_2_56(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  id *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id WeakRetained;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = (id *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "addInviteesSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, id, id))(v6 + 16))(v6, v11, v10, v9, v8);

}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_3_58(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "addInviteesSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  id *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id WeakRetained;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = (id *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "invisibleInviteeStatusSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, id, id))(v6 + 16))(v6, v11, v10, v9, v8);

}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invisibleInviteeStatusSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id WeakRetained;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = (id *)(a1 + 40);
  v9 = a4;
  v10 = a3;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "respondedSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", *(int *)(a1 + 48));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, id, id))(v7 + 16))(v7, v13, v11, v10, v9);

}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "respondedSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", *(int *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  id *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id WeakRetained;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = (id *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "notRespondedSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, id, id))(v6 + 16))(v6, v11, v10, v9, v8);

}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_9(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "notRespondedSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_10(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "addInviteesTapped");

}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_11(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "availabilityTapped");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "EKUI_editor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_12;
  v7[3] = &unk_1E6019298;
  objc_copyWeak(&v9, v1);
  v6 = v5;
  v8 = v6;
  objc_msgSend(v3, "setSaveBlock:", v7);

  objc_destroyWeak(&v9);
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  dispatch_time_t v10;
  _QWORD block[4];
  id v12;

  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "setProhibitCallingSearcherStateChanged:", 1);

  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(v5);
  objc_msgSend(v9, "setSelectedStartDate:", v8);

  objc_msgSend(*(id *)(a1 + 32), "saveEvent:span:error:", v6, a3, 0);
  v10 = dispatch_time(0, 600000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_13;
  block[3] = &unk_1E6018A70;
  objc_copyWeak(&v12, v5);
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v12);
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_13(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setProhibitCallingSearcherStateChanged:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setResetAttendeesSections:", 1);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setResetConflictResolutionSections:", 1);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "_refreshIfNeeded");

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "updateCustomNavigationItemButtons");

}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_14(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "availabilitySection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_16(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "proposedTimeSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "originalConflictSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(v5);
  objc_msgSend(v10, "allInviteesCanAttendSection", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  v12 = objc_loadWeakRetained(v5);
  objc_msgSend(v12, "someInviteesCanAttendSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *))(v4 + 16))(v4, v7, v6, v14);

}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v15 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isStartDateDirty"))
    v9 = v15;
  else
    v9 = 0;
  v10 = v9;

  v11 = objc_loadWeakRetained(v5);
  objc_msgSend(v11, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEndDateDirty"))
    v13 = v6;
  else
    v13 = 0;
  v14 = v13;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_19(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "originalConflictSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "proposedTimeSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(v5);
  objc_msgSend(v10, "allInviteesCanAttendSection", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  v12 = objc_loadWeakRetained(v5);
  objc_msgSend(v12, "someInviteesCanAttendSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *))(v4 + 16))(v4, v7, v6, v14);

}

uint64_t __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_22(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "allInviteesCanAttendSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "originalConflictSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(v5);
  objc_msgSend(v10, "proposedTimeSection", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  v12 = objc_loadWeakRetained(v5);
  objc_msgSend(v12, "someInviteesCanAttendSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *))(v4 + 16))(v4, v7, v6, v14);

}

uint64_t __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_25(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "someInviteesCanAttendSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __46__EKUIEventInviteesViewController_viewDidLoad__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "originalConflictSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(v5);
  objc_msgSend(v10, "allInviteesCanAttendSection", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  v12 = objc_loadWeakRetained(v5);
  objc_msgSend(v12, "proposedTimeSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *))(v4 + 16))(v4, v7, v6, v14);

}

- (void)_sendMessageToParticipants:(id)a3
{
  id v4;
  EKUIEmailCompositionManager *v5;
  EKUIEmailCompositionManager *messageSendingManager;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id location;

  v4 = a3;
  CalAnalyticsSendEvent();
  v5 = -[EKUIEmailCompositionManager initWithEvent:]([EKUIEmailCompositionManager alloc], "initWithEvent:", self->_event);
  messageSendingManager = self->_messageSendingManager;
  self->_messageSendingManager = v5;

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__EKUIEventInviteesViewController__sendMessageToParticipants___block_invoke;
  v10[3] = &unk_1E60192C0;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  -[EKUIEmailCompositionManager setMessageSendingComplete:](self->_messageSendingManager, "setMessageSendingComplete:", v10);
  -[EKUIEmailCompositionManager viewController](self->_messageSendingManager, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalPresentationStyle:", 2);

  +[EKEditItemViewController preferredViewControllerForPresentationsFromViewController:](EKEditItemViewController, "preferredViewControllerForPresentationsFromViewController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEmailCompositionManager viewController](self->_messageSendingManager, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v9, 1, 0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __62__EKUIEventInviteesViewController__sendMessageToParticipants___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[144], "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__EKUIEventInviteesViewController__sendMessageToParticipants___block_invoke_2;
  v5[3] = &unk_1E6018688;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

void __62__EKUIEventInviteesViewController__sendMessageToParticipants___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1152);
  *(_QWORD *)(v1 + 1152) = 0;

}

- (BOOL)useCustomBackButton
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[EKUIEventInviteesViewController fromDetail](self, "fromDetail"))
  {
    -[EKUIEventInviteesViewController event](self, "event");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "allowsAttendeesModifications"))
    {
      -[EKUIEventInviteesViewController event](self, "event");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "hasChanges") & 1) != 0)
      {
        LOBYTE(v5) = 1;
      }
      else
      {
        -[EKUIEventInviteesViewController selectedStartDate](self, "selectedStartDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIEventInviteesViewController event](self, "event");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "startDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v6, "isEqualToDate:", v8) ^ 1;

      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)updateCustomNavigationItemButtons
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (-[EKUIEventInviteesViewController useCustomBackButton](self, "useCustomBackButton"))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_1E601DFA8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__dismiss_);

    -[EKUIEventInviteesViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", v6);

    v8 = (void *)MEMORY[0x1E0C99D20];
    +[EKRemoteUIButtonAction Done](_TtC10EventKitUI22EKRemoteUIButtonAction, "Done");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithObject:", v9);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  if (+[EKUIEmailCompositionManager canShowViewControllerForEvent:withParticipantRecipients:](EKUIEmailCompositionManager, "canShowViewControllerForEvent:withParticipantRecipients:", self->_event, 0))
  {
    v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("envelope"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithImage:style:target:action:", v11, 0, self, sel__sendMessageToParticipants_);

    -[EKUIEventInviteesViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

    v14 = (void *)MEMORY[0x1E0C99D20];
    +[EKRemoteUIButtonAction PresentEmailCompose](_TtC10EventKitUI22EKRemoteUIButtonAction, "PresentEmailCompose");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EKUIEventInviteesViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItem:", 0);
    v16 = 0;
  }

  -[EKUIEventInviteesViewController remoteUIDelegate](self, "remoteUIDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "viewController:didChangeLeftBarButtons:rightBarButtons:", self, v18, v16);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKUIEventInviteesViewController;
  -[EKUIEventInviteesViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[EKUIEventInviteesViewController updateCustomNavigationItemButtons](self, "updateCustomNavigationItemButtons");
  -[EKUIEventInviteesViewController _refreshIfNeeded](self, "_refreshIfNeeded");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[EKUIEventInviteesViewController setViewIsVisible:](self, "setViewIsVisible:", 1);
  v6.receiver = self;
  v6.super_class = (Class)EKUIEventInviteesViewController;
  -[EKUIEventInviteesViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_willEnterForeground, *MEMORY[0x1E0DC4860], 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIEventInviteesViewController;
  -[EKUIEventInviteesViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[EKUIEventInviteesViewController setViewIsVisible:](self, "setViewIsVisible:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  -[EKUIEventInviteesViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v2))
    v3 = 26;
  else
    v3 = 30;

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_sections;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "sectionShouldBeShown", (_QWORD)v14);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v9 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = v9;
    objc_msgSend(v10, "numberWithInteger:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_DEBUG, "Number of sections: [%@]", buf, 0xCu);

  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRows");
  v6 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v7 = v6;
    objc_msgSend(v4, "debugTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2048;
    v13 = v5;
    _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEBUG, "Section [%@] has [%ld] rows.", (uint8_t *)&v10, 0x16u);

  }
  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v7 = v6;
    objc_msgSend(v4, "debugTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEBUG, "Section [%@] has a header title of [%@].", (uint8_t *)&v10, 0x16u);

  }
  return v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "customHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "customFooterView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)showsManagedAttendeesSectionFooter
{
  return -[EKEvent hasHumanInviteesToDisplay](self->_event, "hasHumanInviteesToDisplay");
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (EKUICatalyst())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v10, "backgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setBackgroundColor:", v8);
    }
  }

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForIndexPath:inTableView:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICatalyst())
  {
    objc_msgSend(v6, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

  }
  v11 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_DEBUG, "Cell acquired for index path: [%@].  Cell: [%@]", (uint8_t *)&v13, 0x16u);
  }

  return v9;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v8, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "supportsContextMenuForIndexPath:", v8))
  {
    objc_msgSend(v7, "contextMenuInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contextMenuDataForIndexPath:interaction:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC36B8];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__EKUIEventInviteesViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
    v16[3] = &unk_1E6019308;
    v17 = v11;
    v13 = v11;
    objc_msgSend(v12, "configurationWithIdentifier:previewProvider:actionProvider:", 0, &__block_literal_global_8, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __93__EKUIEventInviteesViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke()
{
  return 0;
}

uint64_t __93__EKUIEventInviteesViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "menu");
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canEditRow:", v5);
  v8 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    CalBooleanAsString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "debugTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_DEBUG, "Can edit row: [%@].  Section: [%@].  Index path: [%@].", (uint8_t *)&v13, 0x20u);

  }
  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commitEditingStyle:forRow:", a4, v7);
  v9 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v10 = v9;
    objc_msgSend(v8, "debugTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_DEBUG, "Committed editing style for row at index path: [%@].  Section: [%@].", (uint8_t *)&v12, 0x16u);

  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "estimatedHeightForRow:", v5);
  v8 = v7;
  v9 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = v9;
    objc_msgSend(v10, "numberWithDouble:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "debugTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_DEBUG, "Estimated row height: [%@].  Section: [%@].  Index path: [%@].", (uint8_t *)&v15, 0x20u);

  }
  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canSelectRow:", v5);
  v8 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    CalBooleanAsString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "debugTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_DEBUG, "Highlighting allowed: [%@].  Section: [%@].  Index path: [%@]", (uint8_t *)&v13, 0x20u);

  }
  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if ((objc_msgSend(v6, "canSelectRow:", v5) & 1) == 0)
  {

    v7 = 0;
  }
  v8 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    objc_msgSend(v6, "debugTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v7;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_DEBUG, "Overridden index path for row selection: [%@].  Section: [%@].  Original index path: [%@]", (uint8_t *)&v12, 0x20u);

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectRow:", v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

  v9 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v10 = v9;
    objc_msgSend(v8, "debugTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_DEBUG, "Selected row at index path: [%@].  Section: [%@]", (uint8_t *)&v12, 0x16u);

  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsForRow:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3D08], "configurationWithActions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[EKUIEventInviteesViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "editingStyleForRow:", v5);
  v8 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = v8;
    objc_msgSend(v9, "numberWithInteger:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "debugTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v11;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_DEBUG, "Editing style [%@] chosen for row at index path: [%@].  Section: [%@]", (uint8_t *)&v14, 0x20u);

  }
  return v7;
}

- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4
{
  uint64_t v4;
  EKUIEventInviteesViewController *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  EKUIEventInviteesViewController *v10;
  EKUIEventInviteesViewController *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  EKUIEventInviteesViewController *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  _BOOL4 v36;
  uint64_t v37;
  const char *v38;
  NSObject *v39;
  os_log_type_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  EKUIEventInviteesViewController *v55;
  EKUIEventInviteesViewController *v56;
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  EKUIEventInviteesViewController *v69;
  __int16 v70;
  EKUIEventInviteesViewController *v71;
  uint64_t v72;

  v4 = *(_QWORD *)&a4;
  v72 = *MEMORY[0x1E0C80C00];
  v6 = (EKUIEventInviteesViewController *)a3;
  if (!(_DWORD)v4)
  {
    v37 = kEKUILogInviteesHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
LABEL_44:
      -[EKUIEventInviteesViewController _dismissPresentedViewControllerAnimated:](self, "_dismissPresentedViewControllerAnimated:", 1, v52);
      goto LABEL_45;
    }
    *(_DWORD *)buf = 138412290;
    v69 = v6;
    v38 = "The user cancelled out from this controller: [%@]";
    v39 = v37;
    v40 = OS_LOG_TYPE_DEBUG;
    goto LABEL_43;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v6;
      if (!-[EKUIEventInviteesViewController fromDetail](self, "fromDetail"))
      {
        -[EKUIEventInviteesViewController selectedStartDate](self, "selectedStartDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIEventInviteesViewController modifiedStartDate](v11, "modifiedStartDate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqualToDate:", v42);

        if ((v43 & 1) == 0)
        {
          -[EKUIEventInviteesViewController modifiedStartDate](v11, "modifiedStartDate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKUIEventInviteesViewController event](self, "event");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setStartDate:", v44);

          -[EKUIEventInviteesViewController modifiedEndDate](v11, "modifiedEndDate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKUIEventInviteesViewController event](self, "event");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setEndDateUnadjustedForLegacyClients:", v46);

          -[EKUIEventInviteesViewController modifiedStartDate](v11, "modifiedStartDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKUIEventInviteesViewController setSelectedStartDate:](self, "setSelectedStartDate:", v48);

          -[EKUIEventInviteesViewController modifiedEndDate](v11, "modifiedEndDate");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKUIEventInviteesViewController setSelectedEndDate:](self, "setSelectedEndDate:", v49);

          -[EKUIEventInviteesViewController setResetAttendeesSections:](self, "setResetAttendeesSections:", 1);
          -[EKUIEventInviteesViewController setResetConflictResolutionSections:](self, "setResetConflictResolutionSections:", 1);
          -[EKUIEventInviteesViewController _refreshIfNeeded](self, "_refreshIfNeeded");
        }
      }
      goto LABEL_40;
    }
    v50 = kEKUILogInviteesHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
      goto LABEL_44;
    *(_DWORD *)buf = 138412290;
    v69 = v6;
    v38 = "Unrecognized controller completed: [%@]";
    v39 = v50;
    v40 = OS_LOG_TYPE_ERROR;
LABEL_43:
    _os_log_impl(&dword_1AF84D000, v39, v40, v38, buf, 0xCu);
    goto LABEL_44;
  }
  v7 = (void *)kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v7;
    objc_msgSend(v8, "numberWithUnsignedInt:", v4);
    v10 = (EKUIEventInviteesViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v69 = v10;
    v70 = 2112;
    v71 = v6;
    _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_DEBUG, "Controller completed with action: [%@].  Controller: [%@]", buf, 0x16u);

  }
  v55 = v6;
  v11 = v6;
  -[EKUIEventInviteesViewController attendees](v11, "attendees");
  v12 = objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController event](self, "event");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attendeesNotIncludingOrganizerOrLocationsOrResources");
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_participantsInArray:thatAreNotInArray:", v14, v12);
  v56 = (EKUIEventInviteesViewController *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v14;
  v54 = (void *)v12;
  objc_msgSend((id)objc_opt_class(), "_participantsInArray:thatAreNotInArray:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[EKUIEventInviteesViewController appendOnly](v11, "appendOnly") & 1) == 0)
  {
    v52 = v15;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v16 = v56;
    v17 = -[EKUIEventInviteesViewController countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v63 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
          v22 = kEKUILogInviteesHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v69 = v16;
            _os_log_impl(&dword_1AF84D000, v22, OS_LOG_TYPE_DEBUG, "Removing attendee: [%@]", buf, 0xCu);
          }
          -[EKUIEventInviteesViewController event](self, "event", v52);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeAttendee:", v21);

        }
        v18 = -[EKUIEventInviteesViewController countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      }
      while (v18);
    }

    v15 = v52;
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v24 = v15;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v59 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        v30 = kEKUILogInviteesHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v56;
          _os_log_impl(&dword_1AF84D000, v30, OS_LOG_TYPE_DEBUG, "Adding attendee: [%@]", buf, 0xCu);
        }
        -[EKUIEventInviteesViewController event](self, "event", v52);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addAttendee:", v29);

        if (-[EKUIEventInviteesViewController appendOnly](v11, "appendOnly"))
          objc_msgSend(v29, "markAsForward");
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v26);
  }

  v6 = v55;
  if (!-[EKUIEventInviteesViewController count](v56, "count") && !objc_msgSend(v24, "count"))
    goto LABEL_33;
  -[EKUIEventInviteesViewController event](self, "event", v52);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "attendeesNotIncludingOrganizerOrLocationsOrResources");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  v35 = kEKUILogInviteesHandle;
  v36 = os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG);
  if (v34)
  {
    if (v36)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v35, OS_LOG_TYPE_DEBUG, "The attendee list was modified.  Marking sections as needing an update.", buf, 2u);
    }
    -[EKUIEventInviteesViewController setResetAttendeesSections:](self, "setResetAttendeesSections:", 1);
    -[EKUIEventInviteesViewController setResetConflictResolutionSections:](self, "setResetConflictResolutionSections:", 1);
    -[EKUIEventInviteesViewController _refreshIfNeeded](self, "_refreshIfNeeded");
LABEL_33:

LABEL_40:
    goto LABEL_44;
  }
  if (v36)
  {
    *(_DWORD *)buf = 138412290;
    v69 = self;
    _os_log_impl(&dword_1AF84D000, v35, OS_LOG_TYPE_DEBUG, "There are no more participants left.  Will request dismissal of [%@]", buf, 0xCu);
  }
  +[EKEditItemViewController preferredViewControllerForPresentationsFromViewController:](EKEditItemViewController, "preferredViewControllerForPresentationsFromViewController:", self);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __80__EKUIEventInviteesViewController_editItemViewController_didCompleteWithAction___block_invoke;
  v57[3] = &unk_1E6018688;
  v57[4] = self;
  objc_msgSend(v51, "dismissViewControllerAnimated:completion:", 1, v57);

LABEL_45:
  -[EKUIEventInviteesViewController updateCustomNavigationItemButtons](self, "updateCustomNavigationItemButtons");

}

uint64_t __80__EKUIEventInviteesViewController_editItemViewController_didCompleteWithAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestDismissal");
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  return 0;
}

- (id)editItemEventToDetach
{
  return 0;
}

- (void)saveAndDismissWithPrompt
{
  -[EKUIEventInviteesViewController _dismiss:](self, "_dismiss:", 0);
}

- (void)_dismiss:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  EKUIEventInviteesViewController *v25;
  id v26;
  id v27;
  _QWORD aBlock[4];
  id v29;

  v4 = a3;
  -[EKUIEventInviteesViewController selectedStartDate](self, "selectedStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController event](self, "event");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToDate:", v7);

  -[EKUIEventInviteesViewController event](self, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "hasChanges");

  if ((v6 & 1) != 0 || !v8)
  {
    if (v8)
      v10 = 0;
    else
      v10 = 4;
    if (-[EKUIEventInviteesViewController deletedParticipants](self, "deletedParticipants"))
      v11 = v10 | 2;
    else
      v11 = v10;
    -[EKUIEventInviteesViewController addInviteesSection](self, "addInviteesSection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pendingParticipants");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (unint64_t)objc_msgSend(v13, "count") > 1;

    v15 = v11 | v14;
    -[UIResponder EKUI_editor](self, "EKUI_editor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__EKUIEventInviteesViewController__dismiss___block_invoke;
    aBlock[3] = &unk_1E60186B0;
    v29 = v16;
    v18 = v16;
    v19 = _Block_copy(aBlock);
    -[EKUIEventInviteesViewController event](self, "event");
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __44__EKUIEventInviteesViewController__dismiss___block_invoke_2;
    v23[3] = &unk_1E6019358;
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = self;
    v26 = v4;
    v27 = v19;
    v20 = v19;
    v21 = v24;
    v22 = +[EKUISendInviteAlertController presentInviteAlertWithOptions:viewController:withCompletionHandler:](EKUISendInviteAlertController, "presentInviteAlertWithOptions:viewController:withCompletionHandler:", v15, self, v23);

  }
  else
  {
    -[EKUIEventInviteesViewController _popViewControllerAnimated:](self, "_popViewControllerAnimated:", 1);
  }

}

uint64_t __44__EKUIEventInviteesViewController__dismiss___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveEvent:span:error:", a2, a3, 0);
}

void __44__EKUIEventInviteesViewController__dismiss___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "rollback");
LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "_popViewControllerAnimated:", 1);
    return;
  }
  if (a2)
    return;
  objc_msgSend(*(id *)(a1 + 40), "selectedStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStartDate:", v3);

  objc_msgSend(*(id *)(a1 + 40), "selectedEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setEndDateUnadjustedForLegacyClients:", v4);

  if (!objc_msgSend(*(id *)(a1 + 32), "isOrWasPartOfRecurringSeries"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_8;
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__EKUIEventInviteesViewController__dismiss___block_invoke_98;
  v12[3] = &unk_1E6019330;
  v7 = *(_QWORD *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v13 = v8;
  v14 = v9;
  v16 = &v17;
  +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:", 0, v5, v7, v6, v12);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v18[5];
  v18[5] = v10;

  _Block_object_dispose(&v17, 8);
}

void __44__EKUIEventInviteesViewController__dismiss___block_invoke_98(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if ((unint64_t)(a2 - 3) >= 3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "_popViewControllerAnimated:", 1);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

- (void)_eventModified:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEBUG, "Received a notification: [%@].", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__EKUIEventInviteesViewController__eventModified___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __50__EKUIEventInviteesViewController__eventModified___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setResetAttendeesSections:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "viewIsVisible");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeeded");
  return result;
}

- (void)_fontSizeDefinitionsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEBUG, "Received a notification: [%@].", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__EKUIEventInviteesViewController__fontSizeDefinitionsChanged___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __63__EKUIEventInviteesViewController__fontSizeDefinitionsChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF84D000, v2, OS_LOG_TYPE_DEBUG, "Reloading reusable cell identifiers.", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "inviteesView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "reloadAndRegisterReusableCellsWithTableView:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "inviteesView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

- (void)addInviteesTapped
{
  EKEventAttendeesEditViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  EKUIManagedNavigationController *v16;
  void *v17;
  void *v18;
  _BOOL4 IsRegular;
  EKEventAttendeesEditViewController *v20;

  v3 = [EKEventAttendeesEditViewController alloc];
  -[EKUIEventInviteesViewController event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController selectedStartDate](self, "selectedStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController selectedEndDate](self, "selectedEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[EKEventAttendeesEditViewController initWithFrame:event:overriddenEventStartDate:overriddenEventEndDate:](v3, "initWithFrame:event:overriddenEventStartDate:overriddenEventEndDate:", v4, v5, v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[EKEditItemViewController setEditDelegate:](v20, "setEditDelegate:", self);
  -[EKEventAttendeesEditViewController setDisableShowingButtons:](v20, "setDisableShowingButtons:", 1);
  -[EKUIEventInviteesViewController event](self, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v7, "isExternallyOrganizedInvitation");

  if ((_DWORD)v4)
  {
    -[EKUIEventInviteesViewController addInviteesSection](self, "addInviteesSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pendingParticipants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventAttendeesEditViewController setAttendees:](v20, "setAttendees:", v9);

    -[EKEventAttendeesEditViewController setAppendOnly:](v20, "setAppendOnly:", 1);
  }
  else
  {
    -[EKUIEventInviteesViewController event](self, "event");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attendeesNotIncludingOrganizerOrLocationsOrResources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventAttendeesEditViewController setAttendees:](v20, "setAttendees:", v11);

  }
  -[EKUIEventInviteesViewController event](self, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "externalID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventAttendeesEditViewController setSearchAccountID:](v20, "setSearchAccountID:", v15);
  v16 = -[EKUIManagedNavigationController initWithRootViewController:]([EKUIManagedNavigationController alloc], "initWithRootViewController:", v20);
  -[EKUIEventInviteesViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v17))
  {
    -[EKUIEventInviteesViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    IsRegular = EKUICurrentHeightSizeClassIsRegular(v18);

    if (IsRegular)
      -[EKUIManagedNavigationController setModalPresentationStyle:](v16, "setModalPresentationStyle:", 3);
  }
  else
  {

  }
  -[EKUIEventInviteesViewController _presentViewController:](self, "_presentViewController:", v16);

}

- (id)availabilityTapped
{
  EKUIAvailabilityViewController *v3;
  void *v4;
  EKUIAvailabilityViewController *v5;
  EKUIAvailabilityNavigationController *v6;
  void *v7;
  void *v8;
  BOOL IsCompact;

  v3 = [EKUIAvailabilityViewController alloc];
  -[EKUIEventInviteesViewController event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EKUIAvailabilityViewController initWithEvent:](v3, "initWithEvent:", v4);

  -[EKEditItemViewController setEditDelegate:](v5, "setEditDelegate:", self);
  -[EKUIAvailabilityViewController setFromDetail:](v5, "setFromDetail:", -[EKUIEventInviteesViewController fromDetail](self, "fromDetail"));
  v6 = -[EKUIAvailabilityNavigationController initWithRootViewController:]([EKUIAvailabilityNavigationController alloc], "initWithRootViewController:", v5);
  -[EKUIAvailabilityViewController preferredContentSize](v5, "preferredContentSize");
  -[EKUIAvailabilityNavigationController setPreferredContentSize:](v6, "setPreferredContentSize:");
  if (+[SwappableViewControllerImplementationFactory shouldUseOutOfProcessUI](SwappableViewControllerImplementationFactory, "shouldUseOutOfProcessUI"))
  {
    -[EKUIEventInviteesViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v7))
    {

    }
    else
    {
      -[EKUIEventInviteesViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      IsCompact = EKUICurrentHeightSizeClassIsCompact(v8);

      if (!IsCompact)
        -[EKUIAvailabilityNavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 0);
    }
  }
  -[EKUIEventInviteesViewController _presentViewController:](self, "_presentViewController:", v6);

  return v5;
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  EKUIViewControllerNavigationDelegate **p_navigationDelegate;
  id WeakRetained;
  void *v5;

  p_navigationDelegate = &self->_navigationDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_navigationDelegate);
  }
  else
  {
    -[EKUIEventInviteesViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (EKUIViewControllerNavigationDelegate *)v5;
}

- (void)_pushViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
  }
  else
  {
    -[EKUIEventInviteesViewController navigationController](self, "navigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (void)_presentViewController:(id)a3
{
  id v4;
  void *WeakRetained;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  if (WeakRetained
    || (+[EKEditItemViewController preferredViewControllerForPresentationsFromViewController:](EKEditItemViewController, "preferredViewControllerForPresentationsFromViewController:", self), (WeakRetained = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = WeakRetained;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, "Presenting view controller [%@] from view controller [%@].", (uint8_t *)&v8, 0x16u);
    }
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v4, 1, 0);
    -[EKUIEventInviteesViewController setPresentedController:](self, "setPresentedController:", v4);

  }
  else
  {
    v7 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_ERROR, "Could not find a view controller that should perform the presentation of this view controller: [%@].", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)_dismissPresentedViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[EKUIEventInviteesViewController presentedController](self, "presentedController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v3, 0);
  -[EKUIEventInviteesViewController setPresentedController:](self, "setPresentedController:", 0);

}

- (void)_popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[EKUIEventInviteesViewController navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "popViewControllerAnimated:", v3);

}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 IsRegularInViewHierarchy;
  double v14;
  double v15;
  CGSize result;
  CGRect v17;

  -[EKUIEventInviteesViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", 2147483650.0, 2147483650.0);
  v5 = v4;
  v7 = v6;

  -[EKUIEventInviteesViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isToolbarHidden");

  if ((v9 & 1) == 0)
  {
    -[EKUIEventInviteesViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toolbar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v7 = v7 + CGRectGetHeight(v17);

  }
  -[EKUIEventInviteesViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v12);

  if (IsRegularInViewHierarchy)
  {
    if (v7 > 600.0)
      v7 = 600.0;
    v5 = EKUIContainedControllerIdealWidth();
  }
  v14 = v5;
  v15 = v7;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (id)_participantsInArray:(id)a3 thatAreNotInArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5 != v6)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v13 = v6;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v22;
            while (2)
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v22 != v16)
                  objc_enumerationMutation(v13);
                if ((objc_msgSend(v12, "isEqualToParticipant:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17), v19) & 1) != 0)
                {

                  goto LABEL_17;
                }
                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v15)
                continue;
              break;
            }
          }

          objc_msgSend(v20, "addObject:", v12);
LABEL_17:
          ++v11;
        }
        while (v11 != v9);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    v5 = v19;
  }

  return v20;
}

- (int64_t)_indexForSection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[EKUIEventInviteesViewController sections](self, "sections", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v5);
          v11 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "sectionShouldBeShown"))
          {
            if (v11 == v4)
              goto LABEL_13;
            ++v8;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v7);
    }
    v8 = -1;
LABEL_13:

  }
  else
  {
    v12 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v12, OS_LOG_TYPE_ERROR, "No section given.  Will not try to find an index.", buf, 2u);
    }
    v8 = -1;
  }

  return v8;
}

- (id)_sectionForIndex:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_sections;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "sectionShouldBeShown", (_QWORD)v13))
        {
          if (v7 == a3)
          {
            v11 = v10;
            goto LABEL_13;
          }
          ++v7;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (void)_smoothRefreshIfNeededForSections:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEBUG, "Smooth refreshing if needed.", v7, 2u);
  }
  if (-[EKUIEventInviteesViewController resetAttendeesSections](self, "resetAttendeesSections"))
  {
    -[EKUIEventInviteesViewController prepareToReloadAttendeesSections](self, "prepareToReloadAttendeesSections");
    -[EKUIEventInviteesViewController inviteesView](self, "inviteesView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadSections:withRowAnimation:", v4, 100);

  }
}

- (void)prepareToReloadAttendeesSections
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  -[EKUIEventInviteesViewController setResetAttendeesSections:](self, "setResetAttendeesSections:", 0);
  v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_DEBUG, "Resetting the attendees sections.", v21, 2u);
  }
  -[EKUIEventInviteesViewController addInviteesSection](self, "addInviteesSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithEvent:showPending:", v5, -[EKUIEventInviteesViewController fromDetail](self, "fromDetail"));

  for (i = 0; i != 3; ++i)
  {
    -[EKUIEventInviteesViewController respondedSection](self, "respondedSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIEventInviteesViewController event](self, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIEventInviteesViewController event](self, "event");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateWithEvent:editable:", v9, objc_msgSend(v10, "isSelfOrganized"));

  }
  -[EKUIEventInviteesViewController notRespondedSection](self, "notRespondedSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController event](self, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController event](self, "event");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateWithEvent:editable:fromDetail:", v12, objc_msgSend(v13, "isSelfOrganized"), -[EKUIEventInviteesViewController fromDetail](self, "fromDetail"));

  -[EKUIEventInviteesViewController invisibleInviteeStatusSection](self, "invisibleInviteeStatusSection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController event](self, "event");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController event](self, "event");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateWithEvent:editable:fromDetail:", v15, objc_msgSend(v16, "isSelfOrganized"), -[EKUIEventInviteesViewController fromDetail](self, "fromDetail"));

  -[EKUIEventInviteesViewController availabilitySection](self, "availabilitySection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController event](self, "event");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateWithEvent:", v18);

  -[EKUIEventInviteesViewController proposedTimeSection](self, "proposedTimeSection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController event](self, "event");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateWithEvent:", v20);

}

- (void)_refreshIfNeeded
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  EKUIEventInviteesViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  EKUIEventInviteesViewController *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_DEBUG, "Refreshing if needed.", (uint8_t *)&v25, 2u);
  }
  if (-[EKUIEventInviteesViewController resetAttendeesSections](self, "resetAttendeesSections"))
  {
    -[EKUIEventInviteesViewController prepareToReloadAttendeesSections](self, "prepareToReloadAttendeesSections");
    -[EKUIEventInviteesViewController inviteesView](self, "inviteesView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
  if (-[EKUIEventInviteesViewController resetConflictResolutionSections](self, "resetConflictResolutionSections"))
  {
    -[EKUIEventInviteesViewController setResetConflictResolutionSections:](self, "setResetConflictResolutionSections:", 0);
    v5 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEBUG, "Resetting the conflict resolution sections.", (uint8_t *)&v25, 2u);
    }
    -[EKUIEventInviteesViewController event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSelfOrganized");

    if ((v7 & 1) == 0)
    {
      v15 = kEKUILogInviteesHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
        return;
      v25 = 138412290;
      v26 = self;
      v12 = "[%@] is not editable.  Will not continue to reset the conflict resolution sections.";
      v13 = v15;
      v14 = 12;
      goto LABEL_14;
    }
    -[EKUIEventInviteesViewController event](self, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAllDay");

    v10 = kEKUILogInviteesHandle;
    v11 = os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (!v11)
        return;
      LOWORD(v25) = 0;
      v12 = "The event is marked as 'all-day.'  Will not continue to reset the conflict resolution sections.";
      v13 = v10;
      v14 = 2;
LABEL_14:
      _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v25, v14);
      return;
    }
    if (v11)
    {
      v16 = v10;
      -[EKUIEventInviteesViewController event](self, "event");
      v17 = (EKUIEventInviteesViewController *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v17;
      _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_DEBUG, "Telling the availability searcher to reset with event: [%@]", (uint8_t *)&v25, 0xCu);

    }
    -[EKUIEventInviteesViewController event](self, "event");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "calendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "source");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ownerAddresses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "anyObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUIEventInviteesViewController availabilitySearcher](self, "availabilitySearcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIEventInviteesViewController event](self, "event");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resetWithEvent:organizerAddressForNewlyScheduledEvent:", v24, v22);

  }
}

- (void)_requestDismissal
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  EKUIEventInviteesViewController *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_DEBUG, "Requesting dismissal of [%@]", buf, 0xCu);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[EKUIEventInviteesViewController sections](self, "sections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "cancelOutstandingOperations");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[EKUIEventInviteesViewController parentController](self, "parentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveAndDismiss");

}

- (void)_searcherStateChanged:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  EKUIEventInviteesViewController *v17;
  id v18;
  int64_t v19;
  _QWORD aBlock[5];

  if (!-[EKUIEventInviteesViewController prohibitCallingSearcherStateChanged](self, "prohibitCallingSearcherStateChanged"))
  {
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__EKUIEventInviteesViewController__searcherStateChanged___block_invoke;
    aBlock[3] = &unk_1E6018C28;
    aBlock[4] = self;
    v6 = _Block_copy(aBlock);
    -[EKUIEventInviteesViewController inviteesView](self, "inviteesView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v5;
    v14 = 3221225472;
    v15 = __57__EKUIEventInviteesViewController__searcherStateChanged___block_invoke_111;
    v16 = &unk_1E6019380;
    v18 = v6;
    v19 = a3;
    v17 = self;
    v8 = v6;
    objc_msgSend(v7, "performBatchUpdates:completion:", &v13, 0);

    -[EKUIEventInviteesViewController proposedTimeSection](self, "proposedTimeSection", v13, v14, v15, v16, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "refreshCellsAfterStateChange");

    -[EKUIEventInviteesViewController originalConflictSection](self, "originalConflictSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "refreshCellsAfterStateChange");

    -[EKUIEventInviteesViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "refreshCellsAfterStateChange");

    -[EKUIEventInviteesViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "refreshCellsAfterStateChange");

  }
}

void __57__EKUIEventInviteesViewController__searcherStateChanged___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = v15;
  if (a3 != a6)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        v24 = 138412290;
        v25 = v17;
        _os_log_impl(&dword_1AF84D000, v18, OS_LOG_TYPE_DEBUG, "Deleting sections at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "inviteesView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "deleteSections:withRowAnimation:", v17, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a7);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v22 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        v24 = 138412290;
        v25 = v17;
        _os_log_impl(&dword_1AF84D000, v22, OS_LOG_TYPE_DEBUG, "Inserting sections at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "inviteesView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "insertSections:withRowAnimation:", v17, 0);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (a5 != a8 && a6)
  {
    if (objc_msgSend(v15, "injectNewRowsBeforeLastExistingRow"))
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (a5 - 1 < a8 - 1)
      {
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a5 - 1, a7);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v20);

          ++a5;
        }
        while (a8 != a5);
      }
      v21 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        v24 = 138412290;
        v25 = v17;
        _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_DEBUG, "Inserting rows at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "inviteesView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "insertRowsAtIndexPaths:withRowAnimation:", v17, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a7);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v23 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        v24 = 138412290;
        v25 = v17;
        _os_log_impl(&dword_1AF84D000, v23, OS_LOG_TYPE_DEBUG, "Reloading sections at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "inviteesView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reloadSections:withRowAnimation:", v17, 0);
    }
    goto LABEL_20;
  }
LABEL_21:

}

void __57__EKUIEventInviteesViewController__searcherStateChanged___block_invoke_111(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  int v42;
  int v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  id v54;
  unsigned int v55;

  objc_msgSend(*(id *)(a1 + 32), "originalConflictSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v2, "sectionShouldBeShown");

  objc_msgSend(*(id *)(a1 + 32), "allInviteesCanAttendSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v3, "sectionShouldBeShown");

  objc_msgSend(*(id *)(a1 + 32), "someInviteesCanAttendSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v4, "sectionShouldBeShown");

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "originalConflictSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v5, "_indexForSection:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "allInviteesCanAttendSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v7, "_indexForSection:", v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "someInviteesCanAttendSection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v9, "_indexForSection:", v10);

  objc_msgSend(*(id *)(a1 + 32), "originalConflictSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v11, "numberOfRows");

  objc_msgSend(*(id *)(a1 + 32), "allInviteesCanAttendSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v12, "numberOfRows");

  objc_msgSend(*(id *)(a1 + 32), "someInviteesCanAttendSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v13, "numberOfRows");

  objc_msgSend(*(id *)(a1 + 32), "proposedTimeSection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "availabilitySearcherChangedState:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "originalConflictSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "availabilitySearcherChangedState:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "allInviteesCanAttendSection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "availabilitySearcherChangedState:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "someInviteesCanAttendSection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "availabilitySearcherChangedState:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "originalConflictSection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "sectionShouldBeShown");

  objc_msgSend(*(id *)(a1 + 32), "allInviteesCanAttendSection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v20, "sectionShouldBeShown");

  objc_msgSend(*(id *)(a1 + 32), "someInviteesCanAttendSection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v21, "sectionShouldBeShown");

  v22 = *(void **)(a1 + 32);
  objc_msgSend(v22, "originalConflictSection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "_indexForSection:", v23);

  v25 = *(void **)(a1 + 32);
  objc_msgSend(v25, "allInviteesCanAttendSection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "_indexForSection:", v26);

  v28 = *(void **)(a1 + 32);
  objc_msgSend(v28, "someInviteesCanAttendSection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "_indexForSection:", v29);

  objc_msgSend(*(id *)(a1 + 32), "originalConflictSection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "numberOfRows");

  objc_msgSend(*(id *)(a1 + 32), "allInviteesCanAttendSection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "numberOfRows");

  objc_msgSend(*(id *)(a1 + 32), "someInviteesCanAttendSection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "numberOfRows");

  v37 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "originalConflictSection");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE))(v37 + 16))(v37, v38, v52, v49, v46, v19, v24, v32, 0);

  v39 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "allInviteesCanAttendSection");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v42) = 1;
  (*(void (**)(uint64_t, void *, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, int))(v39 + 16))(v39, v40, v53, v50, v47, v44, v27, v34, v42);

  v41 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "someInviteesCanAttendSection");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v43) = 1;
  (*(void (**)(uint64_t, id, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, int))(v41 + 16))(v41, v54, v55, v51, v48, v45, v30, v36, v43);

}

- (id)EKUI_oopContentBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (EKUIEventInviteesEditViewController)parentController
{
  return (EKUIEventInviteesEditViewController *)objc_loadWeakRetained((id *)&self->_parentController);
}

- (void)setParentController:(id)a3
{
  objc_storeWeak((id *)&self->_parentController, a3);
}

- (NSDate)selectedStartDate
{
  return self->_selectedStartDate;
}

- (void)setSelectedStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_selectedStartDate, a3);
}

- (NSDate)selectedEndDate
{
  return self->_selectedEndDate;
}

- (void)setSelectedEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_selectedEndDate, a3);
}

- (BOOL)hidesManagedAttendeesSection
{
  return self->_hidesManagedAttendeesSection;
}

- (void)setHidesManagedAttendeesSection:(BOOL)a3
{
  self->_hidesManagedAttendeesSection = a3;
}

- (BOOL)usesCustomToolbar
{
  return self->_usesCustomToolbar;
}

- (void)setUsesCustomToolbar:(BOOL)a3
{
  self->_usesCustomToolbar = a3;
}

- (BOOL)usesRaisedCustomToolbar
{
  return self->_usesRaisedCustomToolbar;
}

- (void)setUsesRaisedCustomToolbar:(BOOL)a3
{
  self->_usesRaisedCustomToolbar = a3;
}

- (EKViewControllerRemoteUIDelegate)remoteUIDelegate
{
  return (EKViewControllerRemoteUIDelegate *)objc_loadWeakRetained((id *)&self->_remoteUIDelegate);
}

- (void)setRemoteUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_remoteUIDelegate, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIViewController)presentedController
{
  return self->_presentedController;
}

- (void)setPresentedController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedController, a3);
}

- (EKUIEventInviteesView)inviteesView
{
  return self->_inviteesView;
}

- (void)setInviteesView:(id)a3
{
  objc_storeStrong((id *)&self->_inviteesView, a3);
}

- (BOOL)resetAttendeesSections
{
  return self->_resetAttendeesSections;
}

- (void)setResetAttendeesSections:(BOOL)a3
{
  self->_resetAttendeesSections = a3;
}

- (BOOL)resetConflictResolutionSections
{
  return self->_resetConflictResolutionSections;
}

- (void)setResetConflictResolutionSections:(BOOL)a3
{
  self->_resetConflictResolutionSections = a3;
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (void)setViewIsVisible:(BOOL)a3
{
  self->_viewIsVisible = a3;
}

- (BOOL)deletedParticipants
{
  return self->_deletedParticipants;
}

- (void)setDeletedParticipants:(BOOL)a3
{
  self->_deletedParticipants = a3;
}

- (BOOL)fromDetail
{
  return self->_fromDetail;
}

- (void)setFromDetail:(BOOL)a3
{
  self->_fromDetail = a3;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (EKUIInviteesViewAddInviteesSection)addInviteesSection
{
  return self->_addInviteesSection;
}

- (void)setAddInviteesSection:(id)a3
{
  objc_storeStrong((id *)&self->_addInviteesSection, a3);
}

- (NSMutableArray)respondedSection
{
  return self->_respondedSection;
}

- (void)setRespondedSection:(id)a3
{
  objc_storeStrong((id *)&self->_respondedSection, a3);
}

- (EKUIInviteesViewNotRespondedInviteesSection)notRespondedSection
{
  return self->_notRespondedSection;
}

- (void)setNotRespondedSection:(id)a3
{
  objc_storeStrong((id *)&self->_notRespondedSection, a3);
}

- (EKUIInviteesViewInvisibleInviteeStatusSection)invisibleInviteeStatusSection
{
  return self->_invisibleInviteeStatusSection;
}

- (void)setInvisibleInviteeStatusSection:(id)a3
{
  objc_storeStrong((id *)&self->_invisibleInviteeStatusSection, a3);
}

- (EKUIInviteesViewAvailabilitySection)availabilitySection
{
  return self->_availabilitySection;
}

- (void)setAvailabilitySection:(id)a3
{
  objc_storeStrong((id *)&self->_availabilitySection, a3);
}

- (EKUIInviteesViewProposedTimeSection)proposedTimeSection
{
  return self->_proposedTimeSection;
}

- (void)setProposedTimeSection:(id)a3
{
  objc_storeStrong((id *)&self->_proposedTimeSection, a3);
}

- (EKUIInviteesViewOriginalConflictSection)originalConflictSection
{
  return self->_originalConflictSection;
}

- (void)setOriginalConflictSection:(id)a3
{
  objc_storeStrong((id *)&self->_originalConflictSection, a3);
}

- (EKUIInviteesViewSomeInviteesCanAttendSection)someInviteesCanAttendSection
{
  return self->_someInviteesCanAttendSection;
}

- (void)setSomeInviteesCanAttendSection:(id)a3
{
  objc_storeStrong((id *)&self->_someInviteesCanAttendSection, a3);
}

- (EKUIInviteesViewAllInviteesCanAttendSection)allInviteesCanAttendSection
{
  return self->_allInviteesCanAttendSection;
}

- (void)setAllInviteesCanAttendSection:(id)a3
{
  objc_storeStrong((id *)&self->_allInviteesCanAttendSection, a3);
}

- (EKInviteeAlternativeTimeSearcher)availabilitySearcher
{
  return self->_availabilitySearcher;
}

- (void)setAvailabilitySearcher:(id)a3
{
  objc_storeStrong((id *)&self->_availabilitySearcher, a3);
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return self->_messageSendingManager;
}

- (void)setMessageSendingManager:(id)a3
{
  objc_storeStrong((id *)&self->_messageSendingManager, a3);
}

- (BOOL)prohibitCallingSearcherStateChanged
{
  return self->_prohibitCallingSearcherStateChanged;
}

- (void)setProhibitCallingSearcherStateChanged:(BOOL)a3
{
  self->_prohibitCallingSearcherStateChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendingManager, 0);
  objc_storeStrong((id *)&self->_availabilitySearcher, 0);
  objc_storeStrong((id *)&self->_allInviteesCanAttendSection, 0);
  objc_storeStrong((id *)&self->_someInviteesCanAttendSection, 0);
  objc_storeStrong((id *)&self->_originalConflictSection, 0);
  objc_storeStrong((id *)&self->_proposedTimeSection, 0);
  objc_storeStrong((id *)&self->_availabilitySection, 0);
  objc_storeStrong((id *)&self->_invisibleInviteeStatusSection, 0);
  objc_storeStrong((id *)&self->_notRespondedSection, 0);
  objc_storeStrong((id *)&self->_respondedSection, 0);
  objc_storeStrong((id *)&self->_addInviteesSection, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_inviteesView, 0);
  objc_storeStrong((id *)&self->_presentedController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_remoteUIDelegate);
  objc_storeStrong((id *)&self->_selectedEndDate, 0);
  objc_storeStrong((id *)&self->_selectedStartDate, 0);
  objc_destroyWeak((id *)&self->_parentController);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
