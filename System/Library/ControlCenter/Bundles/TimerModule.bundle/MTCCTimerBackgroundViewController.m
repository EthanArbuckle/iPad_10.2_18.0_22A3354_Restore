@implementation MTCCTimerBackgroundViewController

- (void)_updateLabels
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  void *v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  id v84;

  objc_msgSend_dateComponentsFormatter(self, a2, v2);
  v84 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timer(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_state(v8, v9, v10);

  if (v11 == 1)
    objc_msgSend_setUnitsStyle_(v84, v12, 3);
  else
    objc_msgSend_setUnitsStyle_(v84, v12, 0);
  objc_msgSend_setZeroFormattingBehavior_(v84, v13, v11 == 1);
  objc_msgSend_timer(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_state(v16, v17, v18);

  if (v19 == 3)
  {
    objc_msgSend_timer(self, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fireDate(v23, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceNow(v29, v30, v31);
    v22 = v32;

  }
  else
  {
    if (v19 == 2)
    {
      objc_msgSend_timer(self, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_remainingTime(v23, v33, v34);
    }
    else
    {
      v22 = 0.0;
      if (v19 != 1)
        goto LABEL_12;
      objc_msgSend_timer(self, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_duration(v23, v24, v25);
    }
    v22 = v26;
  }

LABEL_12:
  objc_msgSend_timer(self, v20, v21);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_state(v35, v36, v37);

  v41 = round(v22);
  v42 = fmax(v41, 1.0);
  v43 = fmax(v41, 0.0);
  if (v38 == 2)
    v43 = v42;
  objc_msgSend_stringFromTimeInterval_(v84, v39, v40, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeLabel(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setText_(v47, v48, (uint64_t)v44);

  if (v11 != 1)
  {
    objc_msgSend_setUnitsStyle_(v84, v49, 3);
    objc_msgSend_setZeroFormattingBehavior_(v84, v60, 1);
    objc_msgSend_timer(self, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timerLabel(v63, v64, v65);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68
      && (objc_msgSend_timer(self, v66, v67),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_timerLabel(v3, v69, v70),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_length(v4, v71, v72)))
    {
      objc_msgSend_timer(self, v66, v67);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timerLabel(v73, v74, v75);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_timer(self, v66, v67);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_duration(v76, v77, v78);
      objc_msgSend_stringFromTimeInterval_(v84, v79, v80);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v68)
      {
LABEL_21:

        objc_msgSend_titleLabel(self, v81, v82);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setText_(v55, v83, (uint64_t)v53);
        goto LABEL_22;
      }
    }

    goto LABEL_21;
  }
  v50 = (void *)MEMORY[0x24BDD1488];
  v51 = objc_opt_class();
  objc_msgSend_bundleForClass_(v50, v52, v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v53, v54, (uint64_t)CFSTR("SET_TIMER_FOR"), &stru_24FFE6638, CFSTR("TimerModule"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_titleLabel(self, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setText_(v58, v59, (uint64_t)v55);

LABEL_22:
}

- (MTCCTimerBackgroundViewController)init
{
  MTCCTimerBackgroundViewController *v2;
  NSObject *v3;
  uint64_t v4;
  NSDateComponentsFormatter *dateComponentsFormatter;
  const char *v6;
  const char *v7;
  objc_super v9;
  uint8_t buf[4];
  MTCCTimerBackgroundViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)MTCCTimerBackgroundViewController;
  v2 = -[MTCCTimerBackgroundViewController init](&v9, sel_init);
  if (v2)
  {
    MTLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v2;
      _os_log_impl(&dword_23102D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized", buf, 0xCu);
    }

    v4 = objc_opt_new();
    dateComponentsFormatter = v2->_dateComponentsFormatter;
    v2->_dateComponentsFormatter = (NSDateComponentsFormatter *)v4;

    objc_msgSend_setAllowedUnits_(v2->_dateComponentsFormatter, v6, 224);
    objc_msgSend_setUnitsStyle_(v2->_dateComponentsFormatter, v7, 3);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;
  uint8_t buf[4];
  MTCCTimerBackgroundViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  MTLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl(&dword_23102D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing", buf, 0xCu);
  }

  objc_msgSend_displayLink(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v6, v7, v8);

  v9.receiver = self;
  v9.super_class = (Class)MTCCTimerBackgroundViewController;
  -[MTCCTimerBackgroundViewController dealloc](&v9, sel_dealloc);
}

- (void)setTimer:(id)a3
{
  const char *v4;
  const char *v5;
  uint64_t v6;
  MTCCTimer *v7;
  MTCCTimer *timer;
  const char *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  if ((objc_msgSend_isEqual_(self->_timer, v4, (uint64_t)v11) & 1) == 0)
  {
    v7 = (MTCCTimer *)objc_msgSend_copy(v11, v5, v6);
    timer = self->_timer;
    self->_timer = v7;

    objc_msgSend__reloadForCurrentState(self, v9, v10);
  }

}

- (void)viewDidLoad
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  MTCCRoundButton *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  id v84;
  const char *v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  MTCCRoundButton *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  id v129;
  const char *v130;
  void *v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  const char *v147;
  void *v148;
  const char *v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  const char *v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  objc_super v179;

  v179.receiver = self;
  v179.super_class = (Class)MTCCTimerBackgroundViewController;
  -[MTCCTimerBackgroundViewController viewDidLoad](&v179, sel_viewDidLoad);
  v3 = (void *)objc_opt_new();
  objc_msgSend_setCurrentConstraints_(self, v4, (uint64_t)v3);

  v5 = (void *)objc_opt_new();
  objc_msgSend_setTitleLabel_(self, v6, (uint64_t)v5);

  objc_msgSend_whiteColor(MEMORY[0x24BDF6950], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_titleLabel(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTextColor_(v12, v13, (uint64_t)v9);

  objc_msgSend_titleLabel(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setText_(v16, v17, (uint64_t)CFSTR("Set timer for:"));

  objc_msgSend_titleLabel(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdjustsFontSizeToFitWidth_(v20, v21, 1);

  objc_msgSend_titleLabel(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTextAlignment_(v24, v25, 1);

  objc_msgSend_titleLabel(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_controlCenterApplyPrimaryContentShadow(v28, v29, v30);

  objc_msgSend_titleLabel(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v33, v34, 0);

  objc_msgSend_view(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_titleLabel(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSubview_(v37, v41, (uint64_t)v40);

  v42 = (void *)objc_opt_new();
  objc_msgSend_setTimeLabel_(self, v43, (uint64_t)v42);

  objc_msgSend_whiteColor(MEMORY[0x24BDF6950], v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeLabel(self, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTextColor_(v49, v50, (uint64_t)v46);

  objc_msgSend_timeLabel(self, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_controlCenterApplyPrimaryContentShadow(v53, v54, v55);

  objc_msgSend_timeLabel(self, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v58, v59, 0);

  objc_msgSend_timeLabel(self, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTextAlignment_(v62, v63, 1);

  objc_msgSend_view(self, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeLabel(self, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSubview_(v66, v70, (uint64_t)v69);

  v71 = objc_alloc_init(MTCCRoundButton);
  objc_msgSend_setStartStopButton_(self, v72, (uint64_t)v71);

  objc_msgSend_startStopButton(self, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v75, v76, 0);

  objc_msgSend_startStopButton(self, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTarget_action_forControlEvents_(v79, v80, (uint64_t)self, sel_startStopButtonTapped_, 64);

  objc_msgSend_startStopButton(self, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_alloc(MEMORY[0x24BDF6C78]);
  v86 = (void *)objc_msgSend_initWithDelegate_(v84, v85, (uint64_t)self);
  objc_msgSend_addInteraction_(v83, v87, (uint64_t)v86);

  objc_msgSend_startStopButton(self, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemGreenColor(MEMORY[0x24BDF6950], v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackgroundColor_forState_(v90, v94, (uint64_t)v93, 0);

  objc_msgSend_startStopButton(self, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_colorWithWhite_alpha_(MEMORY[0x24BDF6950], v98, v99, 0.0, 0.2);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackgroundColor_forState_(v97, v101, (uint64_t)v100, 1);

  objc_msgSend_startStopButton(self, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemOrangeColor(MEMORY[0x24BDF6950], v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackgroundColor_forState_(v104, v108, (uint64_t)v107, 4);

  objc_msgSend_view(self, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startStopButton(self, v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSubview_(v111, v115, (uint64_t)v114);

  v116 = objc_alloc_init(MTCCRoundButton);
  objc_msgSend_setAddTimerButton_(self, v117, (uint64_t)v116);

  objc_msgSend_addTimerButton(self, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v120, v121, 0);

  objc_msgSend_addTimerButton(self, v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTarget_action_forControlEvents_(v124, v125, (uint64_t)self, sel_addTimerButtonTapped_forEvent_, 64);

  objc_msgSend_addTimerButton(self, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_alloc(MEMORY[0x24BDF6C78]);
  v131 = (void *)objc_msgSend_initWithDelegate_(v129, v130, (uint64_t)self);
  objc_msgSend_addInteraction_(v128, v132, (uint64_t)v131);

  objc_msgSend_addTimerButton(self, v133, v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_controlCenterDarkMaterial(MEMORY[0x24BE19B38], v136, v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackgroundMaterialView_forState_(v135, v139, (uint64_t)v138, 0);

  objc_msgSend_addTimerButton(self, v140, v141);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_colorWithWhite_alpha_(MEMORY[0x24BDF6950], v143, v144, 0.0, 0.2);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackgroundColor_forState_(v142, v146, (uint64_t)v145, 1);

  objc_msgSend_configurationWithPointSize_weight_(MEMORY[0x24BDF6AE0], v147, 7, 17.0);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x24BDF6AC8], v149, (uint64_t)CFSTR("plus"), v148);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTimerButton(self, v151, v152);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setImage_(v153, v154, (uint64_t)v150);

  objc_msgSend_systemWhiteColor(MEMORY[0x24BDF6950], v155, v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTimerButton(self, v158, v159);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTintColor_(v160, v161, (uint64_t)v157);

  objc_msgSend_view(self, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTimerButton(self, v165, v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSubview_(v164, v168, (uint64_t)v167);

  objc_msgSend_setupFonts(self, v169, v170);
  objc_msgSend_setupImage(self, v171, v172);
  objc_msgSend__reloadForCurrentState(self, v173, v174);
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v175, v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v177, v178, (uint64_t)self, sel_handleContentSizeChange_, *MEMORY[0x24BDF7670], 0);

}

- (void)viewWillLayoutSubviews
{
  const char *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTCCTimerBackgroundViewController;
  -[MTCCTimerBackgroundViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  objc_msgSend_setupConstraints(self, v3, v4);
}

- (void)setupFonts
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *lhs;

  objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredContentSizeCategory(v4, v5, v6);
  lhs = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory(lhs, (UIContentSizeCategory)*MEMORY[0x24BDF7650]) == NSOrderedDescending)
    objc_msgSend_setupAxFonts(self, v7, v8);
  else
    objc_msgSend_setupRegularFonts(self, v7, v8);

}

- (void)setupRegularFonts
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  objc_msgSend_preferredFontForTextStyle_(MEMORY[0x24BDF6A70], a2, *MEMORY[0x24BDF77B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_titleLabel(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFont_(v6, v7, (uint64_t)v3);

  objc_msgSend_preferredFontForTextStyle_(MEMORY[0x24BDF6A70], v8, *MEMORY[0x24BDF7848]);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend_pointSize(v19, v10, v11);
  objc_msgSend_monospacedDigitSystemFontOfSize_weight_(v9, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeLabel(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFont_(v17, v18, (uint64_t)v14);

}

- (void)setupImage
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  NSString *lhs;

  objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredContentSizeCategory(v4, v5, v6);
  lhs = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory(lhs, (UIContentSizeCategory)*MEMORY[0x24BDF7650]) == NSOrderedDescending)
    objc_msgSend_accessibilityCappedFontForStyle_(self, v7, *MEMORY[0x24BDF77E8]);
  else
    objc_msgSend_preferredFontForTextStyle_(MEMORY[0x24BDF6A70], v7, *MEMORY[0x24BDF77E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pointSize(v8, v9, v10);
  v12 = v11;

  objc_msgSend_configurationWithPointSize_weight_(MEMORY[0x24BDF6AE0], v13, 7, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTimerButton(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x24BDF6AC8], v18, (uint64_t)CFSTR("plus"), v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setImage_(v17, v20, (uint64_t)v19);

}

- (void)setupAxFonts
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  objc_msgSend_accessibilityCappedFontForStyle_(self, a2, *MEMORY[0x24BDF77B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_titleLabel(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFont_(v6, v7, (uint64_t)v3);

  objc_msgSend_accessibilityCappedFontForStyle_(self, v8, *MEMORY[0x24BDF7848]);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend_pointSize(v19, v10, v11);
  objc_msgSend_monospacedDigitSystemFontOfSize_weight_(v9, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeLabel(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFont_(v17, v18, (uint64_t)v14);

}

- (id)accessibilityCappedFontForStyle:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDF6F30];
  v4 = *MEMORY[0x24BDF7650];
  v5 = a3;
  objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(v3, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(MEMORY[0x24BDF6A70], v8, (uint64_t)v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setupConstraints
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double Width;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double Height;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  id v39;
  CGRect v40;
  CGRect v41;

  objc_msgSend_currentConstraints(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    v10 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend_currentConstraints(self, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deactivateConstraints_(v10, v12, (uint64_t)v11);

    objc_msgSend_currentConstraints(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeAllObjects(v15, v16, v17);

  }
  objc_msgSend_view(self, v8, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v18, v19, v20);
  Width = CGRectGetWidth(v40);
  objc_msgSend_view(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v24, v25, v26);
  Height = CGRectGetHeight(v41);

  if (Width > Height)
    objc_msgSend_landscapeConstraints(self, v28, v29);
  else
    objc_msgSend_portraitConstraints(self, v28, v29);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend_mutableCopy(v39, v30, v31);
  objc_msgSend_setCurrentConstraints_(self, v33, (uint64_t)v32);

  v34 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend_currentConstraints(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activateConstraints_(v34, v38, (uint64_t)v37);

}

- (id)portraitConstraints
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  void *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  void *v127;
  const char *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  void *v139;
  const char *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  void *v148;
  const char *v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  void *v160;
  const char *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  void *v175;
  const char *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  void *v187;
  const char *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  void *v199;
  const char *v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  void *v211;
  const char *v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  void *v225;
  const char *v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  void *v240;
  const char *v241;
  const char *v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  void *v255;
  const char *v256;
  const char *v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  void *v270;
  const char *v271;
  const char *v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  void *v282;
  const char *v283;
  const char *v284;
  uint64_t v285;
  void *v286;
  const char *v287;
  uint64_t v288;
  void *v289;
  const char *v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  void *v294;
  const char *v295;
  void *v296;
  const char *v297;
  uint64_t v298;
  void *v299;
  const char *v300;
  const char *v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  void *v308;
  const char *v309;
  const char *v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  void *v320;
  const char *v321;
  const char *v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  void *v335;
  const char *v336;
  const char *v337;
  uint64_t v338;
  void *v339;
  const char *v340;
  uint64_t v341;
  void *v342;
  const char *v343;
  void *v344;
  const char *v345;
  const char *v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  uint64_t v350;
  void *v351;
  const char *v352;
  uint64_t v353;
  void *v354;
  const char *v355;
  void *v356;
  const char *v357;
  const char *v358;
  uint64_t v359;
  void *v360;
  const char *v361;
  uint64_t v362;
  void *v363;
  const char *v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  void *v368;
  const char *v369;
  const char *v370;
  uint64_t v371;
  void *v372;
  const char *v373;
  uint64_t v374;
  NSString *v375;
  const char *v376;
  uint64_t v377;
  void *v378;
  const char *v379;
  uint64_t v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  double v384;
  void *v385;
  const char *v386;
  uint64_t v387;
  void *v388;
  const char *v389;
  uint64_t v390;
  void *v391;
  const char *v392;
  const char *v393;
  uint64_t v394;
  const char *v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  void *v399;
  const char *v400;
  const char *v401;
  uint64_t v402;
  void *v403;
  void *v405;
  void *v406;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend_view(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addLayoutGuide_(v7, v8, (uint64_t)v4);

  objc_msgSend_widthAnchor(v4, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CCUISliderExpandedContentModuleWidth();
  objc_msgSend_constraintEqualToConstant_(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v15, (uint64_t)v14);

  objc_msgSend_heightAnchor(v4, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CCUISliderExpandedContentModuleHeight();
  objc_msgSend_constraintEqualToConstant_(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v22, (uint64_t)v21);

  objc_msgSend_centerXAnchor(v4, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v25, v35, (uint64_t)v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v37, (uint64_t)v36);

  objc_msgSend_centerYAnchor(v4, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerYAnchor(v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v40, v50, (uint64_t)v49);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v52, (uint64_t)v51);

  v53 = (void *)objc_opt_new();
  objc_msgSend_view(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addLayoutGuide_(v56, v57, (uint64_t)v53);

  objc_msgSend_topAnchor(v53, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v60, v70, (uint64_t)v69);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v72, (uint64_t)v71);

  objc_msgSend_bottomAnchor(v53, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v4, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v75, v79, (uint64_t)v78);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v81, (uint64_t)v80);

  objc_msgSend_leadingAnchor(v53, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v87, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leadingAnchor(v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v84, v94, (uint64_t)v93);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v96, (uint64_t)v95);

  objc_msgSend_trailingAnchor(v53, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v102, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingAnchor(v105, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v99, v109, (uint64_t)v108);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v111, (uint64_t)v110);

  v112 = (void *)objc_opt_new();
  objc_msgSend_view(self, v113, v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addLayoutGuide_(v115, v116, (uint64_t)v112);

  objc_msgSend_leadingAnchor(v112, v117, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v120, v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leadingAnchor(v122, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v119, v126, (uint64_t)v125);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v128, (uint64_t)v127);

  objc_msgSend_trailingAnchor(v112, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v132, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingAnchor(v134, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v131, v138, (uint64_t)v137);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v140, (uint64_t)v139);

  objc_msgSend_centerYAnchor(v112, v141, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v405 = v53;
  objc_msgSend_centerYAnchor(v53, v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v143, v147, (uint64_t)v146);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v149, (uint64_t)v148);

  objc_msgSend_titleLabel(self, v150, v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v152, v153, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v112, v156, v157);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v155, v159, (uint64_t)v158);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v161, (uint64_t)v160);

  objc_msgSend_titleLabel(self, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(v164, v165, v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeLabel(self, v168, v169);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v170, v171, v172);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v167, v174, (uint64_t)v173);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v176, (uint64_t)v175);

  objc_msgSend_timeLabel(self, v177, v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(v179, v180, v181);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(v112, v183, v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v182, v186, (uint64_t)v185);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v188, (uint64_t)v187);

  objc_msgSend_titleLabel(self, v189, v190);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v191, v192, v193);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v112, v195, v196);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v194, v198, (uint64_t)v197);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v200, (uint64_t)v199);

  objc_msgSend_timeLabel(self, v201, v202);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v203, v204, v205);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v112, v207, v208);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v206, v210, (uint64_t)v209);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v212, (uint64_t)v211);

  v213 = (void *)objc_opt_new();
  objc_msgSend_view(self, v214, v215);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addLayoutGuide_(v216, v217, (uint64_t)v213);

  objc_msgSend_topAnchor(v213, v218, v219);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v406 = v4;
  objc_msgSend_bottomAnchor(v4, v221, v222);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v220, v224, (uint64_t)v223);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v226, (uint64_t)v225);

  objc_msgSend_leadingAnchor(v213, v227, v228);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v230, v231);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v232, v233, v234);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leadingAnchor(v235, v236, v237);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v229, v239, (uint64_t)v238);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v241, (uint64_t)v240);

  objc_msgSend_trailingAnchor(v213, v242, v243);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v245, v246);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v247, v248, v249);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingAnchor(v250, v251, v252);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v244, v254, (uint64_t)v253);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v256, (uint64_t)v255);

  objc_msgSend_bottomAnchor(v213, v257, v258);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v260, v261);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v262, v263, v264);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(v265, v266, v267);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v259, v269, (uint64_t)v268);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v271, (uint64_t)v270);

  objc_msgSend_startStopButton(self, v272, v273);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v274, v275, v276);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v213, v278, v279);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v277, v281, (uint64_t)v280);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v283, (uint64_t)v282);

  objc_msgSend_startStopButton(self, v284, v285);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerYAnchor(v286, v287, v288);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerYAnchor(v213, v290, v291);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v289, v293, (uint64_t)v292);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v295, (uint64_t)v294);

  v296 = (void *)objc_opt_new();
  objc_msgSend_view(self, v297, v298);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addLayoutGuide_(v299, v300, (uint64_t)v296);

  objc_msgSend_topAnchor(v296, v301, v302);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v213, v304, v305);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v303, v307, (uint64_t)v306);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v309, (uint64_t)v308);

  objc_msgSend_leadingAnchor(v296, v310, v311);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startStopButton(self, v313, v314);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingAnchor(v315, v316, v317);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v312, v319, (uint64_t)v318);
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v321, (uint64_t)v320);

  objc_msgSend_trailingAnchor(v296, v322, v323);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v325, v326);
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v327, v328, v329);
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingAnchor(v330, v331, v332);
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v324, v334, (uint64_t)v333);
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v336, (uint64_t)v335);

  objc_msgSend_bottomAnchor(v296, v337, v338);
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(v213, v340, v341);
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v339, v343, (uint64_t)v342);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v345, (uint64_t)v344);

  objc_msgSend_addTimerButton(self, v346, v347);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v348, v349, v350);
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v296, v352, v353);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v351, v355, (uint64_t)v354);
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v357, (uint64_t)v356);

  objc_msgSend_addTimerButton(self, v358, v359);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerYAnchor(v360, v361, v362);
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerYAnchor(v296, v364, v365);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v363, v367, (uint64_t)v366);
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v369, (uint64_t)v368);

  objc_msgSend_traitCollection(self, v370, v371);
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredContentSizeCategory(v372, v373, v374);
  v375 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v366) = UIContentSizeCategoryIsAccessibilityCategory(v375);

  if ((_DWORD)v366)
  {
    objc_msgSend_startStopButton(self, v376, v377);
    v378 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_widthAnchor(v378, v379, v380);
    v381 = (void *)objc_claimAutoreleasedReturnValue();
    CCUISliderExpandedContentModuleWidth();
    objc_msgSend_constraintEqualToConstant_(v381, v382, v383, v384);
  }
  else
  {
    objc_msgSend_addTimerButton(self, v376, v377);
    v385 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_widthAnchor(v385, v386, v387);
    v388 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constraintEqualToConstant_(v388, v389, v390, 50.0);
    v391 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v392, (uint64_t)v391);

    objc_msgSend_addTimerButton(self, v393, v394);
    v378 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_heightAnchor(v378, v395, v396);
    v381 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constraintEqualToConstant_(v381, v397, v398, 50.0);
  }
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v400, (uint64_t)v399);

  v403 = (void *)objc_msgSend_copy(v3, v401, v402);
  return v403;
}

- (id)landscapeConstraints
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  void *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  void *v133;
  const char *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  void *v142;
  const char *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  void *v154;
  const char *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  void *v169;
  const char *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  void *v181;
  const char *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  void *v193;
  const char *v194;
  const char *v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  void *v205;
  const char *v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  const char *v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  void *v219;
  const char *v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  void *v234;
  const char *v235;
  const char *v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  void *v249;
  const char *v250;
  const char *v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  void *v264;
  const char *v265;
  const char *v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  void *v276;
  const char *v277;
  const char *v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  void *v286;
  const char *v287;
  void *v288;
  const char *v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  const char *v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  void *v300;
  const char *v301;
  void *v302;
  const char *v303;
  const char *v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  void *v314;
  const char *v315;
  const char *v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  void *v329;
  const char *v330;
  const char *v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  void *v338;
  const char *v339;
  const char *v340;
  uint64_t v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  void *v345;
  const char *v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  void *v350;
  const char *v351;
  const char *v352;
  uint64_t v353;
  void *v354;
  const char *v355;
  uint64_t v356;
  void *v357;
  const char *v358;
  uint64_t v359;
  void *v360;
  const char *v361;
  void *v362;
  const char *v363;
  const char *v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  uint64_t v368;
  NSString *v369;
  const char *v370;
  uint64_t v371;
  void *v372;
  const char *v373;
  uint64_t v374;
  void *v375;
  const char *v376;
  uint64_t v377;
  void *v378;
  const char *v379;
  const char *v380;
  uint64_t v381;
  void *v382;
  const char *v383;
  uint64_t v384;
  void *v385;
  const char *v386;
  uint64_t v387;
  void *v388;
  const char *v389;
  uint64_t v390;
  void *v391;
  const char *v392;
  void *v393;
  const char *v394;
  void *v395;
  const char *v396;
  uint64_t v397;
  void *v398;
  const char *v399;
  uint64_t v400;
  void *v401;
  const char *v402;
  uint64_t v403;
  void *v404;
  const char *v405;
  void *v406;
  const char *v407;
  const char *v408;
  uint64_t v409;
  void *v410;
  const char *v411;
  uint64_t v412;
  void *v413;
  const char *v414;
  uint64_t v415;
  void *v416;
  const char *v417;
  const char *v418;
  uint64_t v419;
  const char *v420;
  uint64_t v421;
  const char *v422;
  uint64_t v423;
  const char *v424;
  const char *v425;
  uint64_t v426;
  void *v427;
  void *v429;
  void *v430;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend_view(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addLayoutGuide_(v7, v8, (uint64_t)v4);

  objc_msgSend_widthAnchor(v4, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CCUISliderExpandedContentModuleWidth();
  objc_msgSend_constraintEqualToConstant_(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v15, (uint64_t)v14);

  objc_msgSend_heightAnchor(v4, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CCUISliderExpandedContentModuleHeight();
  objc_msgSend_constraintEqualToConstant_(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v22, (uint64_t)v21);

  objc_msgSend_centerXAnchor(v4, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v25, v35, (uint64_t)v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v37, (uint64_t)v36);

  objc_msgSend_centerYAnchor(v4, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerYAnchor(v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v40, v50, (uint64_t)v49);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v52, (uint64_t)v51);

  v53 = (void *)objc_opt_new();
  objc_msgSend_view(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addLayoutGuide_(v56, v57, (uint64_t)v53);

  objc_msgSend_topAnchor(v53, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v60, v70, (uint64_t)v69);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v72, (uint64_t)v71);

  objc_msgSend_bottomAnchor(v53, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v75, v85, (uint64_t)v84);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v87, (uint64_t)v86);

  objc_msgSend_leadingAnchor(v53, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leadingAnchor(v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v90, v100, (uint64_t)v99);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v102, (uint64_t)v101);

  objc_msgSend_trailingAnchor(v53, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leadingAnchor(v4, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v105, v109, (uint64_t)v108);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v111, (uint64_t)v110);

  v112 = (void *)objc_opt_new();
  objc_msgSend_view(self, v113, v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addLayoutGuide_(v115, v116, (uint64_t)v112);

  objc_msgSend_leadingAnchor(v112, v117, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leadingAnchor(v53, v120, v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v119, v123, (uint64_t)v122);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v125, (uint64_t)v124);

  objc_msgSend_trailingAnchor(v112, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingAnchor(v53, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v128, v132, (uint64_t)v131);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v134, (uint64_t)v133);

  objc_msgSend_centerYAnchor(v112, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v429 = v53;
  objc_msgSend_centerYAnchor(v53, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v137, v141, (uint64_t)v140);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v143, (uint64_t)v142);

  objc_msgSend_titleLabel(self, v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v146, v147, v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v112, v150, v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v149, v153, (uint64_t)v152);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v155, (uint64_t)v154);

  objc_msgSend_titleLabel(self, v156, v157);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(v158, v159, v160);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeLabel(self, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v164, v165, v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v161, v168, (uint64_t)v167);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v170, (uint64_t)v169);

  objc_msgSend_timeLabel(self, v171, v172);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(v173, v174, v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(v112, v177, v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v176, v180, (uint64_t)v179);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v182, (uint64_t)v181);

  objc_msgSend_titleLabel(self, v183, v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v185, v186, v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v112, v189, v190);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v188, v192, (uint64_t)v191);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v194, (uint64_t)v193);

  objc_msgSend_timeLabel(self, v195, v196);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v197, v198, v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v112, v201, v202);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v200, v204, (uint64_t)v203);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v206, (uint64_t)v205);

  v207 = (void *)objc_opt_new();
  objc_msgSend_view(self, v208, v209);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addLayoutGuide_(v210, v211, (uint64_t)v207);

  objc_msgSend_leadingAnchor(v207, v212, v213);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v430 = v4;
  objc_msgSend_trailingAnchor(v4, v215, v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v214, v218, (uint64_t)v217);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v220, (uint64_t)v219);

  objc_msgSend_trailingAnchor(v207, v221, v222);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v224, v225);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v226, v227, v228);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingAnchor(v229, v230, v231);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v223, v233, (uint64_t)v232);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v235, (uint64_t)v234);

  objc_msgSend_topAnchor(v207, v236, v237);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v239, v240);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v241, v242, v243);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v244, v245, v246);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v238, v248, (uint64_t)v247);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v250, (uint64_t)v249);

  objc_msgSend_bottomAnchor(v207, v251, v252);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v254, v255);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v256, v257, v258);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(v259, v260, v261);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v253, v263, (uint64_t)v262);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v265, (uint64_t)v264);

  objc_msgSend_startStopButton(self, v266, v267);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v268, v269, v270);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v207, v272, v273);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v271, v275, (uint64_t)v274);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v277, (uint64_t)v276);

  objc_msgSend_startStopButton(self, v278, v279);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerYAnchor(v280, v281, v282);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerYAnchor(v207, v284, v285);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v283, v287, (uint64_t)v286);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v289, (uint64_t)v288);

  v290 = (void *)objc_opt_new();
  objc_msgSend_view(self, v291, v292);
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addLayoutGuide_(v293, v294, (uint64_t)v290);

  objc_msgSend_topAnchor(v290, v295, v296);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v207, v298, v299);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v297, v301, (uint64_t)v300);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v303, (uint64_t)v302);

  objc_msgSend_leadingAnchor(v290, v304, v305);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startStopButton(self, v307, v308);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingAnchor(v309, v310, v311);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v306, v313, (uint64_t)v312);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v315, (uint64_t)v314);

  objc_msgSend_trailingAnchor(v290, v316, v317);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v319, v320);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutMarginsGuide(v321, v322, v323);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingAnchor(v324, v325, v326);
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v318, v328, (uint64_t)v327);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v330, (uint64_t)v329);

  objc_msgSend_bottomAnchor(v290, v331, v332);
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(v207, v334, v335);
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v333, v337, (uint64_t)v336);
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v339, (uint64_t)v338);

  objc_msgSend_addTimerButton(self, v340, v341);
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v342, v343, v344);
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerXAnchor(v290, v346, v347);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v345, v349, (uint64_t)v348);
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v351, (uint64_t)v350);

  objc_msgSend_addTimerButton(self, v352, v353);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerYAnchor(v354, v355, v356);
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerYAnchor(v290, v358, v359);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v357, v361, (uint64_t)v360);
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v363, (uint64_t)v362);

  objc_msgSend_traitCollection(self, v364, v365);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredContentSizeCategory(v366, v367, v368);
  v369 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v360) = UIContentSizeCategoryIsAccessibilityCategory(v369);

  if ((_DWORD)v360)
  {
    objc_msgSend_startStopButton(self, v370, v371);
    v372 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_widthAnchor(v372, v373, v374);
    v375 = (void *)objc_claimAutoreleasedReturnValue();
    CCUISliderExpandedContentModuleWidth();
    objc_msgSend_constraintEqualToConstant_(v375, v376, v377);
    v378 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v379, (uint64_t)v378);

    objc_msgSend_trailingAnchor(v207, v380, v381);
    v382 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_view(self, v383, v384);
    v385 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_layoutMarginsGuide(v385, v386, v387);
    v388 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trailingAnchor(v388, v389, v390);
    v391 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constraintEqualToAnchor_constant_(v382, v392, (uint64_t)v391, -50.0);
    v393 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v394, (uint64_t)v393);

  }
  else
  {
    objc_msgSend_trailingAnchor(v207, v370, v371);
    v395 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_view(self, v396, v397);
    v398 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_layoutMarginsGuide(v398, v399, v400);
    v401 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trailingAnchor(v401, v402, v403);
    v404 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constraintEqualToAnchor_(v395, v405, (uint64_t)v404);
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v407, (uint64_t)v406);

    objc_msgSend_addTimerButton(self, v408, v409);
    v410 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_widthAnchor(v410, v411, v412);
    v413 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constraintEqualToConstant_(v413, v414, v415, 50.0);
    v416 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v417, (uint64_t)v416);

    objc_msgSend_addTimerButton(self, v418, v419);
    v382 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_heightAnchor(v382, v420, v421);
    v385 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constraintEqualToConstant_(v385, v422, v423, 50.0);
    v388 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v424, (uint64_t)v388);
  }

  v427 = (void *)objc_msgSend_copy(v3, v425, v426);
  return v427;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTCCTimerBackgroundViewController;
  -[MTCCTimerBackgroundViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  objc_msgSend_setupConstraints(self, v5, v6);
  objc_msgSend_view(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNeedsLayout(v9, v10, v11);

}

- (void)handleContentSizeChange:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  MTCCTimerBackgroundViewController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  MTLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = self;
    _os_log_impl(&dword_23102D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ handling content size chaged", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_setupFonts(self, v5, v6);
  objc_msgSend_setupImage(self, v7, v8);
  objc_msgSend_setupConstraints(self, v9, v10);
  objc_msgSend_view(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNeedsLayout(v13, v14, v15);

}

- (void)startStopButtonTapped:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  int v45;
  MTCCTimerBackgroundViewController *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  MTLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_timer(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 138543618;
    v46 = self;
    v47 = 2050;
    v48 = objc_msgSend_state(v7, v8, v9);
    _os_log_impl(&dword_23102D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ button tapped, current state:%{public}lu", (uint8_t *)&v45, 0x16u);

  }
  objc_msgSend_timer(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fireDate(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_timer(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_state(v18, v19, v20);

  if ((unint64_t)(v21 - 1) >= 2)
  {
    if (v21 == 3)
      v31 = 2;
    else
      v31 = 0;
  }
  else
  {
    v24 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend_timer(self, v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remainingTime(v25, v26, v27);
    objc_msgSend_dateWithTimeIntervalSinceNow_(v24, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v31 = 3;
    v15 = (void *)v30;
  }
  objc_msgSend_timer(self, v22, v23);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setState_(v32, v33, v31);

  objc_msgSend_timer(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFireDate_(v36, v37, (uint64_t)v15);

  objc_msgSend_delegate(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timer(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timerBackgroundViewController_timerDidChange_(v40, v44, (uint64_t)self, v43);

}

- (void)addTimerButtonTapped:(id)a3 forEvent:(id)a4
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  int v16;
  MTCCTimerBackgroundViewController *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  MTLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_timer(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = self;
    v18 = 2050;
    v19 = objc_msgSend_state(v9, v10, v11);
    _os_log_impl(&dword_23102D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ add button tapped, current state:%{public}lu", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend_delegate(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timerBackgroundViewControllerAddButtonTapped_withEvent_(v14, v15, (uint64_t)self, v5);

}

- (void)_reloadForCurrentState
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  _BOOL8 v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  id v86;

  objc_msgSend_timer(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_state(v4, v5, v6);

  switch(v7)
  {
    case 3:
      v33 = (void *)MEMORY[0x24BDD1488];
      v34 = objc_opt_class();
      objc_msgSend_bundleForClass_(v33, v35, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v36, v37, (uint64_t)CFSTR("PAUSE"), &stru_24FFE6638, CFSTR("TimerModule"));
      v86 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addTimerButton(self, v38, v39);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setHidden_(v24, v40, 0);
      v32 = 1;
LABEL_7:
      v21 = 1;
      goto LABEL_8;
    case 2:
      v41 = (void *)MEMORY[0x24BDD1488];
      v42 = objc_opt_class();
      objc_msgSend_bundleForClass_(v41, v43, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v44, v45, (uint64_t)CFSTR("RESUME"), &stru_24FFE6638, CFSTR("TimerModule"));
      v86 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addTimerButton(self, v46, v47);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setHidden_(v24, v48, 0);
      v32 = 0;
      goto LABEL_7;
    case 1:
      v10 = (void *)MEMORY[0x24BDD1488];
      v11 = objc_opt_class();
      objc_msgSend_bundleForClass_(v10, v12, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v13, v14, (uint64_t)CFSTR("START"), &stru_24FFE6638, CFSTR("TimerModule"));
      v86 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_timer(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_duration(v17, v18, v19);
      v21 = v20 > 0.0;

      objc_msgSend_timer(self, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_editingTimer(v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addTimerButton(self, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setHidden_(v30, v31, v27 == 0);

      v32 = 0;
LABEL_8:

      goto LABEL_10;
  }
  v86 = 0;
  v32 = 0;
  v21 = 1;
LABEL_10:
  objc_msgSend_startStopButton(self, v8, v9);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(v49, v50, (uint64_t)v86);

  objc_msgSend_startStopButton(self, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSelected_(v53, v54, v32);

  objc_msgSend_startStopButton(self, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnabled_(v57, v58, v21);

  objc_msgSend__updateLabels(self, v59, v60);
  objc_msgSend_displayLink(self, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v63, v64, v65);

  objc_msgSend_timer(self, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend_state(v68, v69, v70);

  if (v71 == 3)
  {
    objc_msgSend_displayLinkWithTarget_selector_(MEMORY[0x24BDE5670], v72, (uint64_t)self, sel_displayLinkTick_);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDisplayLink_(self, v74, (uint64_t)v73);

    objc_msgSend_displayLink(self, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPreferredFramesPerSecond_(v77, v78, 4);

    objc_msgSend_displayLink(self, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mainRunLoop(MEMORY[0x24BDBCF18], v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addToRunLoop_forMode_(v81, v85, (uint64_t)v84, *MEMORY[0x24BDBCB80]);

  }
  else
  {
    objc_msgSend_setDisplayLink_(self, v72, 0);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;

  v5 = objc_alloc(MEMORY[0x24BDF6E90]);
  objc_msgSend_startStopButton(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerView(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_initWithView_(v5, v12, (uint64_t)v11);

  objc_msgSend_effectWithPreview_(MEMORY[0x24BDF6C80], v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_styleWithEffect_shape_(MEMORY[0x24BDF6C98], v16, (uint64_t)v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (MTCCTimerBackgroundViewControllerDelegate)delegate
{
  return (MTCCTimerBackgroundViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTCCTimer)timer
{
  return self->_timer;
}

- (MTCCRoundButton)startStopButton
{
  return self->_startStopButton;
}

- (void)setStartStopButton:(id)a3
{
  objc_storeStrong((id *)&self->_startStopButton, a3);
}

- (MTCCRoundButton)addTimerButton
{
  return self->_addTimerButton;
}

- (void)setAddTimerButton:(id)a3
{
  objc_storeStrong((id *)&self->_addTimerButton, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (NSMutableArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_currentConstraints, a3);
}

- (NSDateComponentsFormatter)dateComponentsFormatter
{
  return self->_dateComponentsFormatter;
}

- (void)setDateComponentsFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateComponentsFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponentsFormatter, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_addTimerButton, 0);
  objc_storeStrong((id *)&self->_startStopButton, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
