@implementation CSCoverSheetTransitionSettings

- (void)setDefaultValues
{
  id v3;
  CAFrameRateRange v4;

  -[CSCoverSheetTransitionSettings setBlursPanel:](self, "setBlursPanel:", 1);
  -[CSCoverSheetTransitionSettings setBlurRadius:](self, "setBlurRadius:", 20.0);
  -[CSCoverSheetTransitionSettings setBlurStart:](self, "setBlurStart:", 0.2);
  -[CSCoverSheetTransitionSettings setBlurEnd:](self, "setBlurEnd:", 0.4);
  -[CSCoverSheetTransitionSettings setBlurEndReducedTransparency:](self, "setBlurEndReducedTransparency:", 0.275);
  -[CSCoverSheetTransitionSettings setFadesContent:](self, "setFadesContent:", 1);
  -[CSCoverSheetTransitionSettings setMaxContentAlpha:](self, "setMaxContentAlpha:", 1.0);
  -[CSCoverSheetTransitionSettings setContentFadeStart:](self, "setContentFadeStart:", 0.3);
  -[CSCoverSheetTransitionSettings setContentFadeEnd:](self, "setContentFadeEnd:", 0.7);
  -[CSCoverSheetTransitionSettings setDarkensContent:](self, "setDarkensContent:", 1);
  -[CSCoverSheetTransitionSettings setDarkeningColorWhite:](self, "setDarkeningColorWhite:", 0.0);
  -[CSCoverSheetTransitionSettings setDarkeningColorAlpha:](self, "setDarkeningColorAlpha:", 0.2);
  -[CSCoverSheetTransitionSettings setDarkeningStart:](self, "setDarkeningStart:", 0.0);
  -[CSCoverSheetTransitionSettings setDarkeningEnd:](self, "setDarkeningEnd:", 0.5);
  -[CSCoverSheetTransitionSettings setPanelWallpaper:](self, "setPanelWallpaper:", 0);
  -[CSCoverSheetTransitionSettings setTrackingWallpaper:](self, "setTrackingWallpaper:", 0);
  -[CSCoverSheetTransitionSettings setTrackingWallpaperParallaxFactor:](self, "setTrackingWallpaperParallaxFactor:", 0.5);
  -[CSCoverSheetTransitionSettings setRevealWallpaper:](self, "setRevealWallpaper:", 0);
  -[CSCoverSheetTransitionSettings setOrientPanelWallpaper:](self, "setOrientPanelWallpaper:", 1);
  -[CSCoverSheetTransitionSettings setFadePanelWallpaper:](self, "setFadePanelWallpaper:", 0);
  -[CSCoverSheetTransitionSettings setFadePanelWallpaperStart:](self, "setFadePanelWallpaperStart:", 0.2);
  -[CSCoverSheetTransitionSettings setFadePanelWallpaperEnd:](self, "setFadePanelWallpaperEnd:", 1.0);
  -[CSCoverSheetTransitionSettings setScaleWallpaper:](self, "setScaleWallpaper:", 0);
  -[CSCoverSheetTransitionSettings setWallpaperScale:](self, "setWallpaperScale:", 1.4);
  -[CSCoverSheetTransitionSettings wallpaperScaleSettings](self, "wallpaperScaleSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");
  objc_msgSend(v3, "setBehaviorType:", 1);
  objc_msgSend(v3, "setDampingRatio:", 1.0);
  objc_msgSend(v3, "setResponse:", 0.75);
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v3, "setFrameRateRange:highFrameRateReason:", 1114125, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
  -[CSCoverSheetTransitionSettings setFadesCoverSheetContent:](self, "setFadesCoverSheetContent:", 0);
  -[CSCoverSheetTransitionSettings setAlwaysFadesCoverSheetContent:](self, "setAlwaysFadesCoverSheetContent:", 0);
  -[CSCoverSheetTransitionSettings setFadesCoverSheetContentStart:](self, "setFadesCoverSheetContentStart:", 0.0);
  -[CSCoverSheetTransitionSettings setFadesCoverSheetContentEnd:](self, "setFadesCoverSheetContentEnd:", 0.75);
  -[CSCoverSheetTransitionSettings setBlursBehindCoverSheet:](self, "setBlursBehindCoverSheet:", 0);
  -[CSCoverSheetTransitionSettings setBehindCoverSheetBlurRadius:](self, "setBehindCoverSheetBlurRadius:", 50.0);
  -[CSCoverSheetTransitionSettings setBehindCoverSheetBlurStart:](self, "setBehindCoverSheetBlurStart:", 0.0);
  -[CSCoverSheetTransitionSettings setBehindCoverSheetBlurEnd:](self, "setBehindCoverSheetBlurEnd:", 1.0);
  -[CSCoverSheetTransitionSettings setIconsFlyIn:](self, "setIconsFlyIn:", 1);
  -[CSCoverSheetTransitionSettings setFloatingLayerAsWallpaperOverlay:](self, "setFloatingLayerAsWallpaperOverlay:", 0);
  -[CSCoverSheetTransitionSettings setTransitionStyle:](self, "setTransitionStyle:", 0);
  -[CSCoverSheetTransitionSettings setUsesFixedWallpaperPresentationProgress:](self, "setUsesFixedWallpaperPresentationProgress:", 0);
  -[CSCoverSheetTransitionSettings setFixedWallpaperPresentationProgress:](self, "setFixedWallpaperPresentationProgress:", 0.0);

}

- (BOOL)blursPanel
{
  return !UIAccessibilityIsReduceMotionEnabled() && self->_blursPanel;
}

- (BOOL)fadesContent
{
  return !UIAccessibilityIsReduceMotionEnabled() && self->_fadesContent;
}

- (BOOL)panelWallpaper
{
  return UIAccessibilityIsReduceMotionEnabled() || self->_panelWallpaper;
}

- (BOOL)revealWallpaper
{
  return !-[CSCoverSheetTransitionSettings panelWallpaper](self, "panelWallpaper") && self->_revealWallpaper;
}

- (BOOL)trackingWallpaper
{
  _BOOL4 v3;

  v3 = -[CSCoverSheetTransitionSettings panelWallpaper](self, "panelWallpaper");
  if (v3)
    LOBYTE(v3) = self->_trackingWallpaper;
  return v3;
}

- (BOOL)_isMaglevActive
{
  return _os_feature_enabled_impl();
}

- (double)trackingWallpaperParallaxFactor
{
  double v3;

  v3 = 1.0;
  if (!-[CSCoverSheetTransitionSettings _isMaglevActive](self, "_isMaglevActive"))
  {
    if (-[CSCoverSheetTransitionSettings trackingWallpaper](self, "trackingWallpaper"))
    {
      v3 = 0.0;
      if (!UIAccessibilityIsReduceMotionEnabled())
        return self->_trackingWallpaperParallaxFactor;
    }
  }
  return v3;
}

+ (id)settingsControllerModule
{
  uint64_t v2;
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
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
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
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
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  _QWORD v151[10];
  _QWORD v152[2];
  void *v153;
  void *v154;
  _QWORD v155[4];
  _QWORD v156[4];
  _QWORD v157[5];
  _QWORD v158[4];
  _QWORD v159[3];
  _QWORD v160[8];
  _QWORD v161[6];

  v161[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Blurs Panel"), CFSTR("blursPanel"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("blursPanel == YES"));
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Blur Start"), CFSTR("blurStart"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueValidator:", &__block_literal_global_260);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "condition:", v2);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Blur End"), CFSTR("blurEnd"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueValidator:", &__block_literal_global_260);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = (void *)v2;
  objc_msgSend(v8, "condition:", v2);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Blur End Reduced Transparency"), CFSTR("blurEndReducedTransparency"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 0.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueValidator:", &__block_literal_global_260);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "condition:", v2);
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  v161[0] = v142;
  v161[1] = v141;
  v161[2] = v140;
  v161[3] = v139;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:title:", v13, CFSTR("Blur"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("orientPanelWallpaper == YES"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("panelWallpaper == YES"));
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("trackingWallpaper == YES"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Panel Wallpaper"), CFSTR("panelWallpaper"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Tracking Wallpaper"), CFSTR("trackingWallpaper"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)v14;
  objc_msgSend(v15, "condition:", v14);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Parallax Factor"), CFSTR("trackingWallpaperParallaxFactor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "minValue:maxValue:", 0.0, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueValidator:", &__block_literal_global_260);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "condition:", v138);
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Reveal Wallpaper"), CFSTR("revealWallpaper"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("panelWallpaper == NO"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "condition:", v21);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Orient Panel Wallpaper"), CFSTR("orientPanelWallpaper"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "condition:", v137);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Fade Panel Wallpaper"), CFSTR("fadePanelWallpaper"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "condition:", v16);
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Panel WP Fade Start"), CFSTR("fadePanelWallpaperStart"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "minValue:maxValue:", 0.0, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "valueValidator:", &__block_literal_global_260);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v16;
  objc_msgSend(v26, "condition:", v16);
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Panel WP Fade End"), CFSTR("fadePanelWallpaperEnd"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "minValue:maxValue:", 0.0, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "valueValidator:", &__block_literal_global_260);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "condition:", v16);
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D83078];
  v160[0] = v149;
  v160[1] = v148;
  v160[2] = v147;
  v160[3] = v135;
  v160[4] = v134;
  v160[5] = v133;
  v160[6] = v132;
  v160[7] = v131;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v160, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sectionWithRows:title:", v31, CFSTR("Panel Wallpaper"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Scale Wallpaper"), CFSTR("scaleWallpaper"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("scaleWallpaper == YES"));
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("WP Scale"), CFSTR("wallpaperScale"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "minValue:maxValue:", 0.75, 2.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = (void *)v32;
  objc_msgSend(v34, "condition:", v32);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("WP Scale Settings"), CFSTR("wallpaperScaleSettings"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "condition:", v32);
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)MEMORY[0x1E0D83078];
  v159[0] = v129;
  v159[1] = v128;
  v159[2] = v127;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sectionWithRows:title:", v37, CFSTR("Scale Wallpaper"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Fades Content"), CFSTR("fadesContent"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("fadesContent == YES"));
  v38 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Content Alpha"), CFSTR("maxContentAlpha"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "minValue:maxValue:", 0.0, 1.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "valueValidator:", &__block_literal_global_260);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "condition:", v38);
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fade Start"), CFSTR("contentFadeStart"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "minValue:maxValue:", 0.0, 1.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "valueValidator:", &__block_literal_global_260);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = (void *)v38;
  objc_msgSend(v44, "condition:", v38);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fade End"), CFSTR("contentFadeEnd"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "minValue:maxValue:", 0.0, 1.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "valueValidator:", &__block_literal_global_260);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "condition:", v38);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = (void *)MEMORY[0x1E0D83078];
  v158[0] = v125;
  v158[1] = v124;
  v158[2] = v123;
  v158[3] = v122;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v158, 4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "sectionWithRows:title:", v49, CFSTR("Fade Content"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Darkens Content"), CFSTR("darkensContent"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("darkensContent == YES"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Color White"), CFSTR("darkeningColorWhite"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "minValue:maxValue:", 0.0, 1.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "valueValidator:", &__block_literal_global_260);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "condition:", v50);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Color Alpha"), CFSTR("darkeningColorAlpha"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "minValue:maxValue:", 0.0, 1.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "valueValidator:", &__block_literal_global_260);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "condition:", v50);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Start"), CFSTR("darkeningStart"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "minValue:maxValue:", 0.0, 1.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "valueValidator:", &__block_literal_global_260);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "condition:", v50);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("End"), CFSTR("darkeningEnd"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "minValue:maxValue:", 0.0, 1.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "valueValidator:", &__block_literal_global_260);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "condition:", v50);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = (void *)MEMORY[0x1E0D83078];
  v157[0] = v121;
  v157[1] = v120;
  v157[2] = v119;
  v157[3] = v118;
  v157[4] = v117;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v157, 5);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "sectionWithRows:title:", v64, CFSTR("Darken Content"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Fades Cover Sheet"), CFSTR("fadesCoverSheetContent"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("fadesCoverSheetContent == YES"));
  v65 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fade Start"), CFSTR("fadesCoverSheetContentStart"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "minValue:maxValue:", 0.0, 1.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "condition:", v65);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fade End"), CFSTR("fadesCoverSheetContentEnd"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "minValue:maxValue:", 0.0, 1.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)v65;
  objc_msgSend(v69, "condition:", v65);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always Fade"), CFSTR("alwaysFadesCoverSheetContent"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "condition:", v65);
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = (void *)MEMORY[0x1E0D83078];
  v156[0] = v115;
  v156[1] = v113;
  v156[2] = v112;
  v156[3] = v111;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 4);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "sectionWithRows:title:", v72, CFSTR("Fade Cover Sheet"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Blurs Behind Cover Sheet"), CFSTR("blursBehindCoverSheet"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("blursBehindCoverSheet == YES"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Blur Radius"), CFSTR("behindCoverSheetBlurRadius"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "minValue:maxValue:", 0.0, 100.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "valueValidator:", &__block_literal_global_261);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "condition:", v110);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Blur Start"), CFSTR("behindCoverSheetBlurStart"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "minValue:maxValue:", 0.0, 1.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "valueValidator:", &__block_literal_global_260);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "condition:", v2);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Blur End"), CFSTR("behindCoverSheetBlurEnd"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "minValue:maxValue:", 0.0, 1.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "valueValidator:", &__block_literal_global_260);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "condition:", v2);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = (void *)MEMORY[0x1E0D83078];
  v155[0] = v108;
  v155[1] = v107;
  v155[2] = v106;
  v155[3] = v105;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 4);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "sectionWithRows:title:", v83, CFSTR("Blur Behind Cover Sheet"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Transition Style"), CFSTR("transitionStyle"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setPossibleTitles:", &unk_1E8E896D0);
  objc_msgSend(v104, "setPossibleValues:", &unk_1E8E896E8);
  v85 = (void *)MEMORY[0x1E0D83078];
  v154 = v104;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "sectionWithRows:title:", v86, CFSTR("Transition Style"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Icons Fly In"), CFSTR("iconsFlyIn"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (void *)MEMORY[0x1E0D83078];
  v153 = v103;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "sectionWithRows:title:", v88, CFSTR("Icons Fly In"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Uses Fixed Wallpaper Presentation Progress"), CFSTR("usesFixedWallpaperPresentationProgress"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("usesFixedWallpaperPresentationProgress == YES"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fixed Wallpaper Presentation Progress"), CFSTR("fixedWallpaperPresentationProgress"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "minValue:maxValue:", 0.0, 1.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "condition:", v89);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = (void *)MEMORY[0x1E0D83078];
  v152[0] = v100;
  v152[1] = v92;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 2);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "sectionWithRows:title:", v94, CFSTR("Fixed Wallpaper Presentation Progress"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = (void *)MEMORY[0x1E0D83078];
  v151[0] = v150;
  v151[1] = v146;
  v151[2] = v144;
  v151[3] = v143;
  v151[4] = v114;
  v151[5] = v109;
  v151[6] = v84;
  v151[7] = v102;
  v151[8] = v101;
  v151[9] = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 10);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "moduleWithTitle:contents:", CFSTR("Hey"), v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  return v98;
}

uint64_t __58__CSCoverSheetTransitionSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "numberWithDouble:", round(v3 / 0.1) * 0.1);
}

uint64_t __58__CSCoverSheetTransitionSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "numberWithDouble:", roundf(v3));
}

- (NSString)description
{
  return (NSString *)-[CSCoverSheetTransitionSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSCoverSheetTransitionSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  _BOOL8 v5;
  id v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  id v13;
  void *v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  CSCoverSheetTransitionSettings *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  CSCoverSheetTransitionSettings *v29;
  _QWORD v30[4];
  id v31;
  CSCoverSheetTransitionSettings *v32;
  _QWORD v33[4];
  id v34;
  CSCoverSheetTransitionSettings *v35;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_iconsFlyIn, CFSTR("iconsFlyIn"));
  v5 = -[CSCoverSheetTransitionSettings blursPanel](self, "blursPanel");
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", v5, CFSTR("blursPanel"));
  v7 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    objc_msgSend(v3, "activeMultilinePrefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke;
    v33[3] = &unk_1E8E2DC00;
    v34 = v3;
    v35 = self;
    objc_msgSend(v34, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Blur Settings"), v8, v33);

  }
  v9 = -[CSCoverSheetTransitionSettings fadesContent](self, "fadesContent");
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", v9, CFSTR("fadesContent"));
  if (v9)
  {
    objc_msgSend(v3, "activeMultilinePrefix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v7;
    v30[1] = 3221225472;
    v30[2] = __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_2;
    v30[3] = &unk_1E8E2DC00;
    v31 = v3;
    v32 = self;
    objc_msgSend(v31, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Fade Settings"), v11, v30);

  }
  v12 = -[CSCoverSheetTransitionSettings darkensContent](self, "darkensContent");
  v13 = (id)objc_msgSend(v3, "appendBool:withName:", v12, CFSTR("darkensContent"));
  if (v12)
  {
    objc_msgSend(v3, "activeMultilinePrefix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_3;
    v27[3] = &unk_1E8E2DC00;
    v28 = v3;
    v29 = self;
    objc_msgSend(v28, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Darken Settings"), v14, v27);

  }
  v15 = -[CSCoverSheetTransitionSettings panelWallpaper](self, "panelWallpaper");
  v16 = (id)objc_msgSend(v3, "appendBool:withName:", v15, CFSTR("panelWallpaper"));
  if (v15)
  {
    objc_msgSend(v3, "activeMultilinePrefix");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7;
    v22 = 3221225472;
    v23 = __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_4;
    v24 = &unk_1E8E2DC00;
    v25 = self;
    v26 = v3;
    objc_msgSend(v26, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Panel Wallpaper Settings"), v17, &v21);

  }
  else
  {
    v18 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSCoverSheetTransitionSettings revealWallpaper](self, "revealWallpaper"), CFSTR("revealWallpaper"));
  }
  v19 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSCoverSheetTransitionSettings iconsFlyIn](self, "iconsFlyIn", v21, v22, v23, v24, v25), CFSTR("iconsFlyIn"));
  return v3;
}

id __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "blurStart");
  v3 = (id)objc_msgSend(v2, "appendFloat:withName:", CFSTR("blurStart"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "blurEnd");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("blurEnd"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "blurEndReducedTransparency");
  return (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("blurEndReducedTransparency"));
}

id __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentFadeStart");
  v3 = (id)objc_msgSend(v2, "appendFloat:withName:", CFSTR("contentFadeStart"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentFadeEnd");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("contentFadeEnd"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "maxContentAlpha");
  return (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("maxContentAlpha"));
}

id __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "darkeningStart");
  v3 = (id)objc_msgSend(v2, "appendFloat:withName:", CFSTR("darkeningStart"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "darkeningEnd");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("darkeningEnd"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "darkeningColorWhite");
  v7 = (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("darkeningColorWhite"));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "darkeningColorAlpha");
  return (id)objc_msgSend(v8, "appendFloat:withName:", CFSTR("darkeningColorAlpha"));
}

void __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  double v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v2 = objc_msgSend(*(id *)(a1 + 32), "trackingWallpaper");
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", v2, CFSTR("trackingWallpaper"));
  if ((_DWORD)v2)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "trackingWallpaperParallaxFactor");
    v6 = (id)objc_msgSend(v4, "appendBool:withName:", v5 != 0.0, CFSTR("trackingWallpaperParallaxFactor"));
  }
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 32), "orientPanelWallpaper"), CFSTR("orientPanelWallpaper"));
  v8 = objc_msgSend(*(id *)(a1 + 32), "fadePanelWallpaper");
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", v8, CFSTR("fadePanelWallpaper"));
  if ((_DWORD)v8)
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v10, "activeMultilinePrefix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_5;
    v14[3] = &unk_1E8E2DC00;
    v12 = *(id *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 32);
    v15 = v12;
    v16 = v13;
    objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Fade Panel Wallpaper Settings"), v11, v14);

  }
}

id __60__CSCoverSheetTransitionSettings_succinctDescriptionBuilder__block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fadePanelWallpaperStart");
  v3 = (id)objc_msgSend(v2, "appendFloat:withName:", CFSTR("fadePanelWallpaperStart"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fadePanelWallpaperEnd");
  return (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("fadePanelWallpaperEnd"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSCoverSheetTransitionSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setBlursPanel:(BOOL)a3
{
  self->_blursPanel = a3;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
}

- (double)blurStart
{
  return self->_blurStart;
}

- (void)setBlurStart:(double)a3
{
  self->_blurStart = a3;
}

- (double)blurEnd
{
  return self->_blurEnd;
}

- (void)setBlurEnd:(double)a3
{
  self->_blurEnd = a3;
}

- (double)blurEndReducedTransparency
{
  return self->_blurEndReducedTransparency;
}

- (void)setBlurEndReducedTransparency:(double)a3
{
  self->_blurEndReducedTransparency = a3;
}

- (void)setFadesContent:(BOOL)a3
{
  self->_fadesContent = a3;
}

- (double)maxContentAlpha
{
  return self->_maxContentAlpha;
}

- (void)setMaxContentAlpha:(double)a3
{
  self->_maxContentAlpha = a3;
}

- (double)contentFadeStart
{
  return self->_contentFadeStart;
}

- (void)setContentFadeStart:(double)a3
{
  self->_contentFadeStart = a3;
}

- (double)contentFadeEnd
{
  return self->_contentFadeEnd;
}

- (void)setContentFadeEnd:(double)a3
{
  self->_contentFadeEnd = a3;
}

- (BOOL)darkensContent
{
  return self->_darkensContent;
}

- (void)setDarkensContent:(BOOL)a3
{
  self->_darkensContent = a3;
}

- (double)darkeningColorWhite
{
  return self->_darkeningColorWhite;
}

- (void)setDarkeningColorWhite:(double)a3
{
  self->_darkeningColorWhite = a3;
}

- (double)darkeningColorAlpha
{
  return self->_darkeningColorAlpha;
}

- (void)setDarkeningColorAlpha:(double)a3
{
  self->_darkeningColorAlpha = a3;
}

- (double)darkeningStart
{
  return self->_darkeningStart;
}

- (void)setDarkeningStart:(double)a3
{
  self->_darkeningStart = a3;
}

- (double)darkeningEnd
{
  return self->_darkeningEnd;
}

- (void)setDarkeningEnd:(double)a3
{
  self->_darkeningEnd = a3;
}

- (void)setPanelWallpaper:(BOOL)a3
{
  self->_panelWallpaper = a3;
}

- (void)setTrackingWallpaper:(BOOL)a3
{
  self->_trackingWallpaper = a3;
}

- (void)setTrackingWallpaperParallaxFactor:(double)a3
{
  self->_trackingWallpaperParallaxFactor = a3;
}

- (void)setRevealWallpaper:(BOOL)a3
{
  self->_revealWallpaper = a3;
}

- (BOOL)orientPanelWallpaper
{
  return self->_orientPanelWallpaper;
}

- (void)setOrientPanelWallpaper:(BOOL)a3
{
  self->_orientPanelWallpaper = a3;
}

- (BOOL)fadePanelWallpaper
{
  return self->_fadePanelWallpaper;
}

- (void)setFadePanelWallpaper:(BOOL)a3
{
  self->_fadePanelWallpaper = a3;
}

- (double)fadePanelWallpaperStart
{
  return self->_fadePanelWallpaperStart;
}

- (void)setFadePanelWallpaperStart:(double)a3
{
  self->_fadePanelWallpaperStart = a3;
}

- (double)fadePanelWallpaperEnd
{
  return self->_fadePanelWallpaperEnd;
}

- (void)setFadePanelWallpaperEnd:(double)a3
{
  self->_fadePanelWallpaperEnd = a3;
}

- (BOOL)scaleWallpaper
{
  return self->_scaleWallpaper;
}

- (void)setScaleWallpaper:(BOOL)a3
{
  self->_scaleWallpaper = a3;
}

- (double)wallpaperScale
{
  return self->_wallpaperScale;
}

- (void)setWallpaperScale:(double)a3
{
  self->_wallpaperScale = a3;
}

- (SBFFluidBehaviorSettings)wallpaperScaleSettings
{
  return self->_wallpaperScaleSettings;
}

- (void)setWallpaperScaleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperScaleSettings, a3);
}

- (BOOL)fadesCoverSheetContent
{
  return self->_fadesCoverSheetContent;
}

- (void)setFadesCoverSheetContent:(BOOL)a3
{
  self->_fadesCoverSheetContent = a3;
}

- (double)fadesCoverSheetContentStart
{
  return self->_fadesCoverSheetContentStart;
}

- (void)setFadesCoverSheetContentStart:(double)a3
{
  self->_fadesCoverSheetContentStart = a3;
}

- (double)fadesCoverSheetContentEnd
{
  return self->_fadesCoverSheetContentEnd;
}

- (void)setFadesCoverSheetContentEnd:(double)a3
{
  self->_fadesCoverSheetContentEnd = a3;
}

- (BOOL)alwaysFadesCoverSheetContent
{
  return self->_alwaysFadesCoverSheetContent;
}

- (void)setAlwaysFadesCoverSheetContent:(BOOL)a3
{
  self->_alwaysFadesCoverSheetContent = a3;
}

- (BOOL)blursBehindCoverSheet
{
  return self->_blursBehindCoverSheet;
}

- (void)setBlursBehindCoverSheet:(BOOL)a3
{
  self->_blursBehindCoverSheet = a3;
}

- (double)behindCoverSheetBlurRadius
{
  return self->_behindCoverSheetBlurRadius;
}

- (void)setBehindCoverSheetBlurRadius:(double)a3
{
  self->_behindCoverSheetBlurRadius = a3;
}

- (double)behindCoverSheetBlurStart
{
  return self->_behindCoverSheetBlurStart;
}

- (void)setBehindCoverSheetBlurStart:(double)a3
{
  self->_behindCoverSheetBlurStart = a3;
}

- (double)behindCoverSheetBlurEnd
{
  return self->_behindCoverSheetBlurEnd;
}

- (void)setBehindCoverSheetBlurEnd:(double)a3
{
  self->_behindCoverSheetBlurEnd = a3;
}

- (int64_t)transitionStyle
{
  return self->_transitionStyle;
}

- (void)setTransitionStyle:(int64_t)a3
{
  self->_transitionStyle = a3;
}

- (BOOL)iconsFlyIn
{
  return self->_iconsFlyIn;
}

- (void)setIconsFlyIn:(BOOL)a3
{
  self->_iconsFlyIn = a3;
}

- (BOOL)floatingLayerAsWallpaperOverlay
{
  return self->_floatingLayerAsWallpaperOverlay;
}

- (void)setFloatingLayerAsWallpaperOverlay:(BOOL)a3
{
  self->_floatingLayerAsWallpaperOverlay = a3;
}

- (BOOL)usesFixedWallpaperPresentationProgress
{
  return self->_usesFixedWallpaperPresentationProgress;
}

- (void)setUsesFixedWallpaperPresentationProgress:(BOOL)a3
{
  self->_usesFixedWallpaperPresentationProgress = a3;
}

- (double)fixedWallpaperPresentationProgress
{
  return self->_fixedWallpaperPresentationProgress;
}

- (void)setFixedWallpaperPresentationProgress:(double)a3
{
  self->_fixedWallpaperPresentationProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperScaleSettings, 0);
}

@end
