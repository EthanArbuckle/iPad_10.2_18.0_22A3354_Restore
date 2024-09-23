@implementation HKDisplayType

- (HKSampleType)sampleType
{
  return (HKSampleType *)self->_objectType;
}

- (HKDisplayTypeLocalization)localization
{
  return self->_localization;
}

- (HKDisplayTypeBehavior)behavior
{
  return self->_behavior;
}

- (UIImage)unitIcon
{
  void *v2;
  void *v3;
  void *v4;

  if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 13)
  {
    v2 = (void *)MEMORY[0x1E0DC3870];
    HKHealthUIFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("nike_fuel_unit_icon"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (UIImage *)v4;
}

- (unint64_t)roundingMode
{
  uint64_t v2;
  unint64_t result;
  unint64_t v4;

  v2 = -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier");
  result = 1;
  if (v2 > 178)
  {
    if (((unint64_t)(v2 - 280) > 0x18 || ((1 << (v2 - 24)) & 0x107C04F) == 0)
      && v2 != 179
      && v2 != 186)
    {
      return 0;
    }
  }
  else if ((unint64_t)(v2 - 75) > 0x3F || ((1 << (v2 - 75)) & 0x8000005806000111) == 0)
  {
    v4 = v2 - 7;
    if (v4 > 0x3F || ((1 << v4) & 0x800000000000006FLL) == 0)
      return 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectType, 0);
  objc_storeStrong((id *)&self->_defaultAxisRangeOverride, 0);
  objc_storeStrong((id *)&self->_chartingRules, 0);
  objc_storeStrong((id *)&self->_localization, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_secondaryCategoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_detailImage, 0);
  objc_storeStrong((id *)&self->_listIcon, 0);
  objc_storeStrong((id *)&self->_chartingPredicatesByTimeScope, 0);
  objc_storeStrong((id *)&self->_defaultChartingPredicate, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 48) = self->_displayTypeIdentifier;
  *(_QWORD *)(v4 + 56) = self->_categoryIdentifier;
  objc_storeStrong((id *)(v4 + 64), self->_secondaryCategoryIdentifiers);
  objc_storeStrong((id *)(v4 + 112), self->_objectType);
  v5 = -[HKDisplayTypeBehavior copy](self->_behavior, "copy");
  v6 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v5;

  v7 = -[HKDisplayTypePresentation copy](self->_presentation, "copy");
  v8 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v7;

  v9 = -[HKDisplayTypeLocalization copy](self->_localization, "copy");
  v10 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v9;

  objc_storeStrong((id *)(v4 + 24), self->_listIcon);
  objc_storeStrong((id *)(v4 + 32), self->_detailImage);
  objc_storeStrong((id *)(v4 + 8), self->_defaultChartingPredicate);
  objc_storeStrong((id *)(v4 + 16), self->_chartingPredicatesByTimeScope);
  objc_storeStrong((id *)(v4 + 96), self->_chartingRules);
  *(_BYTE *)(v4 + 40) = self->__wheelchairUser;
  v11 = -[HKValueRange copy](self->_defaultAxisRangeOverride, "copy");
  v12 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = v11;

  return (id)v4;
}

- (HKDisplayType)initWithDisplayTypeIdentifier:(int64_t)a3 categoryIdentifier:(int64_t)a4 secondaryCategoryIdentifiers:(id)a5 objectType:(id)a6 behavior:(id)a7 presentation:(id)a8 localization:(id)a9 chartingRules:(id)a10 defaultChartingPredicate:(id)a11 chartingPredicatesByTimeScope:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HKDisplayType *v23;
  HKDisplayType *v24;
  uint64_t v25;
  NSArray *secondaryCategoryIdentifiers;
  uint64_t v27;
  HKObjectType *objectType;
  uint64_t v29;
  HKDisplayTypeBehavior *behavior;
  uint64_t v31;
  HKDisplayTypePresentation *presentation;
  uint64_t v33;
  HKDisplayTypeLocalization *localization;
  uint64_t v35;
  NSDictionary *chartingPredicatesByTimeScope;
  id v40;
  objc_super v41;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v40 = a10;
  v21 = a11;
  v22 = a12;
  v41.receiver = self;
  v41.super_class = (Class)HKDisplayType;
  v23 = -[HKDisplayType init](&v41, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->_displayTypeIdentifier = a3;
    v23->_categoryIdentifier = a4;
    v25 = objc_msgSend(v16, "copy");
    secondaryCategoryIdentifiers = v24->_secondaryCategoryIdentifiers;
    v24->_secondaryCategoryIdentifiers = (NSArray *)v25;

    v27 = objc_msgSend(v17, "copy");
    objectType = v24->_objectType;
    v24->_objectType = (HKObjectType *)v27;

    v29 = objc_msgSend(v18, "copy");
    behavior = v24->_behavior;
    v24->_behavior = (HKDisplayTypeBehavior *)v29;

    v31 = objc_msgSend(v19, "copy");
    presentation = v24->_presentation;
    v24->_presentation = (HKDisplayTypePresentation *)v31;

    v33 = objc_msgSend(v20, "copy");
    localization = v24->_localization;
    v24->_localization = (HKDisplayTypeLocalization *)v33;

    objc_storeStrong((id *)&v24->_chartingRules, a10);
    objc_storeStrong((id *)&v24->_defaultChartingPredicate, a11);
    v35 = objc_msgSend(v22, "copy");
    chartingPredicatesByTimeScope = v24->_chartingPredicatesByTimeScope;
    v24->_chartingPredicatesByTimeScope = (NSDictionary *)v35;

  }
  return v24;
}

- (HKDisplayTypePresentation)presentation
{
  return self->_presentation;
}

- (HKDisplayCategory)displayCategory
{
  return +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", self->_categoryIdentifier);
}

- (id)hk_valueFormatterForUnit:(id)a3 formattingContext:(int64_t)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[HKDisplayType objectType](self, "objectType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_msgSend(v7, "hk_valueFormatterClassForUnit:", v6);

  v9 = [v8 alloc];
  -[HKDisplayType hk_numberFormatterForUnit:formattingContext:](self, "hk_numberFormatterForUnit:formattingContext:", v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithNumberFormatter:", v10);
  return v11;
}

- (id)hk_numberFormatterForUnit:(id)a3 formattingContext:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[HKDisplayType chartingRules](self, "chartingRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allowedDecimalPrecisionRuleForUnit:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKDisplayType objectType](self, "objectType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_numberFormatterForUnit:decimalPrecisionRule:formattingContext:", v6, v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HKDisplayTypeChartingRules)chartingRules
{
  return self->_chartingRules;
}

- (HKObjectType)objectType
{
  return self->_objectType;
}

- (int64_t)displayTypeIdentifier
{
  return self->_displayTypeIdentifier;
}

- (int64_t)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSArray)secondaryCategoryIdentifiers
{
  return self->_secondaryCategoryIdentifiers;
}

- (id)hk_valueFormatterForUnit:(id)a3
{
  return -[HKDisplayType hk_valueFormatterForUnit:formattingContext:](self, "hk_valueFormatterForUnit:formattingContext:", a3, 0);
}

- (BOOL)_isWheelchairUser
{
  return self->__wheelchairUser;
}

+ (id)builtinDisplayTypes
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
  id v13;
  void *v14;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  void *v65;
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
  void *v99;
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
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  _QWORD v220[218];

  v220[216] = *MEMORY[0x1E0C80C00];
  HKDisplayTypeIdentifierBodyMassIndexMake();
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v220[0] = v219;
  HKDisplayTypeIdentifierBodyFatPercentageMake();
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v220[1] = v218;
  HKDisplayTypeIdentifierHeightMake();
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v220[2] = v217;
  HKDisplayTypeIdentifierBodyMassMake();
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v220[3] = v216;
  HKDisplayTypeIdentifierLeanBodyMassMake();
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v220[4] = v215;
  HKDisplayTypeIdentifierHeartRateMake();
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v220[5] = v214;
  HKDisplayTypeIdentifierStepsMake();
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v220[6] = v213;
  HKDisplayTypeIdentifierDistanceWalkingRunningMake();
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v220[7] = v212;
  HKDisplayTypeIdentifierBasalEnergyBurnedMake();
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v220[8] = v211;
  HKDisplayTypeIdentifierActiveEnergyMake();
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v220[9] = v210;
  HKDisplayTypeIdentifierFlightsClimbedMake();
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v220[10] = v209;
  HKDisplayTypeIdentifierNikeFuelMake();
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v220[11] = v208;
  HKDisplayTypeIdentifierOxygenSaturationMake();
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v220[12] = v207;
  HKDisplayTypeIdentifierBloodGlucoseMake();
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v220[13] = v206;
  HKDisplayTypeIdentifierBloodAlcoholContentMake();
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v220[14] = v205;
  HKDisplayTypeIdentifierPeripheralPerfusionIndexMake();
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v220[15] = v204;
  HKDisplayTypeIdentifierDietaryFatTotalMake();
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v220[16] = v203;
  HKDisplayTypeIdentifierDietaryFatPolyunsaturatedMake();
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v220[17] = v202;
  HKDisplayTypeIdentifierDietaryFatMonounsaturatedMake();
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v220[18] = v201;
  HKDisplayTypeIdentifierDietaryFatSaturatedMake();
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v220[19] = v200;
  HKDisplayTypeIdentifierDietaryCholesterolMake();
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v220[20] = v199;
  HKDisplayTypeIdentifierDietarySodiumMake();
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v220[21] = v198;
  HKDisplayTypeIdentifierDietaryCarbohydratesMake();
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v220[22] = v197;
  HKDisplayTypeIdentifierDietaryFiberMake();
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v220[23] = v196;
  HKDisplayTypeIdentifierDietarySugarMake();
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v220[24] = v195;
  HKDisplayTypeIdentifierDietaryEnergyMake();
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v220[25] = v194;
  HKDisplayTypeIdentifierDietaryProteinMake();
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v220[26] = v193;
  HKDisplayTypeIdentifierDietaryVitaminAMake();
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v220[27] = v192;
  HKDisplayTypeIdentifierDietaryVitaminB6Make();
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v220[28] = v191;
  HKDisplayTypeIdentifierDietaryVitaminB12Make();
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v220[29] = v190;
  HKDisplayTypeIdentifierDietaryVitaminCMake();
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v220[30] = v189;
  HKDisplayTypeIdentifierDietaryVitaminDMake();
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v220[31] = v188;
  HKDisplayTypeIdentifierDietaryVitaminEMake();
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v220[32] = v187;
  HKDisplayTypeIdentifierDietaryVitaminKMake();
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v220[33] = v186;
  HKDisplayTypeIdentifierDietaryCalciumMake();
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v220[34] = v185;
  HKDisplayTypeIdentifierDietaryIronMake();
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v220[35] = v184;
  HKDisplayTypeIdentifierDietaryThiaminMake();
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v220[36] = v183;
  HKDisplayTypeIdentifierDietaryRiboflavinMake();
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v220[37] = v182;
  HKDisplayTypeIdentifierDietaryNiacinMake();
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v220[38] = v181;
  HKDisplayTypeIdentifierDietaryFolateMake();
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v220[39] = v180;
  HKDisplayTypeIdentifierDietaryBiotinMake();
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v220[40] = v179;
  HKDisplayTypeIdentifierDietaryPantothenicAcidMake();
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v220[41] = v178;
  HKDisplayTypeIdentifierDietaryPhosphorusMake();
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v220[42] = v177;
  HKDisplayTypeIdentifierDietaryIodineMake();
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v220[43] = v176;
  HKDisplayTypeIdentifierDietaryMagnesiumMake();
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v220[44] = v175;
  HKDisplayTypeIdentifierDietaryZincMake();
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v220[45] = v174;
  HKDisplayTypeIdentifierDietarySeleniumMake();
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v220[46] = v173;
  HKDisplayTypeIdentifierDietaryCopperMake();
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v220[47] = v172;
  HKDisplayTypeIdentifierDietaryManganeseMake();
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v220[48] = v171;
  HKDisplayTypeIdentifierDietaryChromiumMake();
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v220[49] = v170;
  HKDisplayTypeIdentifierDietaryMolybdenumMake();
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v220[50] = v169;
  HKDisplayTypeIdentifierDietaryChlorideMake();
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v220[51] = v168;
  HKDisplayTypeIdentifierDietaryPotassiumMake();
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v220[52] = v167;
  HKDisplayTypeIdentifierNumberOfTimesFallenMake();
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v220[53] = v166;
  HKDisplayTypeIdentifierElectrodermalActivityMake();
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v220[54] = v165;
  HKDisplayTypeIdentifierInhalerUsageMake();
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v220[55] = v164;
  HKDisplayTypeIdentifierRespiratoryRateMake();
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v220[56] = v163;
  HKDisplayTypeIdentifierBodyTemperatureMake();
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v220[57] = v162;
  HKDisplayTypeIdentifierSleepAnalysisMake();
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v220[58] = v161;
  HKDisplayTypeIdentifierBiologicalSexMake();
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v220[59] = v160;
  HKDisplayTypeIdentifierDateOfBirthMake();
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v220[60] = v159;
  HKDisplayTypeIdentifierBloodTypeMake();
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v220[61] = v158;
  HKDisplayTypeIdentifierAppleStandHourMake();
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v220[62] = v157;
  HKDisplayTypeIdentifierForcedVitalCapacityMake();
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v220[63] = v156;
  HKDisplayTypeIdentifierForcedExpiratoryVolume1Make();
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v220[64] = v155;
  HKDisplayTypeIdentifierPeakExpiratoryFlowRateMake();
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v220[65] = v154;
  HKDisplayTypeIdentifierAppleExerciseTimeMake();
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v220[66] = v153;
  HKDisplayTypeIdentifierDietaryCaffeineMake();
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v220[67] = v152;
  HKDisplayTypeIdentifierWorkoutMake();
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v220[68] = v151;
  HKDisplayTypeIdentifierBloodPressureMake();
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v220[69] = v150;
  HKDisplayTypeIdentifierCyclingDistanceMake();
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v220[70] = v149;
  HKDisplayTypeIdentifierDietaryWaterMake();
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v220[71] = v148;
  HKDisplayTypeIdentifierFitzpatrickSkinTypeMake();
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v220[72] = v147;
  HKDisplayTypeIdentifierUVExposureMake();
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v220[73] = v146;
  HKDisplayTypeIdentifierBasalBodyTemperatureMake();
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v220[74] = v145;
  HKDisplayTypeIdentifierCervicalMucusQualityMake();
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v220[75] = v144;
  HKDisplayTypeIdentifierOvulationTestResultMake();
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v220[76] = v143;
  HKDisplayTypeIdentifierMenstruationMake();
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v220[77] = v142;
  HKDisplayTypeIdentifierIntermenstrualBleedingMake();
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v220[78] = v141;
  HKDisplayTypeIdentifierSexualActivityMake();
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v220[79] = v140;
  HKDisplayTypeIdentifierMindfulSessionMake();
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v220[80] = v139;
  HKDisplayTypeIdentifierActivitySummaryMake();
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v220[81] = v138;
  HKDisplayTypeIdentifierPushCountMake();
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v220[82] = v137;
  HKDisplayTypeIdentifierWheelchairUseMake();
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v220[83] = v136;
  HKDisplayTypeIdentifierCDADocumentMake();
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v220[84] = v135;
  HKDisplayTypeIdentifierSwimmingDistanceMake();
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v220[85] = v134;
  HKDisplayTypeIdentifierSwimmingStrokesMake();
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v220[86] = v133;
  HKDisplayTypeIdentifierWheelchairDistanceMake();
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v220[87] = v132;
  HKDisplayTypeIdentifierWaistCircumferenceMake();
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v220[88] = v131;
  HKDisplayTypeIdentifierRestingHeartRateMake();
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v220[89] = v130;
  HKDisplayTypeIdentifierVO2MaxMake();
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v220[90] = v129;
  HKDisplayTypeIdentifierInsulinDeliveryMake();
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v220[91] = v128;
  HKDisplayTypeIdentifierWalkingHeartRateAverageMake();
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v220[92] = v127;
  HKDisplayTypeIdentifierDownhillSnowSportsDistanceMake();
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v220[93] = v126;
  HKDisplayTypeIdentifierHeartRateVariabilityMake();
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v220[94] = v125;
  HKDisplayTypeIdentifierTachycardiaEventMake();
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v220[95] = v124;
  HKDisplayTypeIdentifierElectrocardiogramMake();
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v220[96] = v123;
  HKDisplayTypeIdentifierAudiogramMake();
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v220[97] = v122;
  HKDisplayTypeIdentifierBradycardiaEventMake();
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v220[98] = v121;
  HKDisplayTypeIdentifierAllergyRecordMake();
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v220[99] = v120;
  HKDisplayTypeIdentifierConditionRecordMake();
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v220[100] = v119;
  HKDisplayTypeIdentifierImmunizationRecordMake();
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v220[101] = v118;
  HKDisplayTypeIdentifierLabResultRecordMake();
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v220[102] = v117;
  HKDisplayTypeIdentifierMedicationRecordMake();
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v220[103] = v116;
  HKDisplayTypeIdentifierProcedureRecordMake();
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v220[104] = v115;
  HKDisplayTypeIdentifierVitalSignRecordMake();
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v220[105] = v114;
  HKDisplayTypeIdentifierAtrialFibrillationEventMake();
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v220[106] = v113;
  HKDisplayTypeIdentifierAbdominalCrampsMake();
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v220[107] = v112;
  HKDisplayTypeIdentifierBreastPainMake();
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v220[108] = v111;
  HKDisplayTypeIdentifierBloatingMake();
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v220[109] = v110;
  HKDisplayTypeIdentifierHeadacheMake();
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v220[110] = v109;
  HKDisplayTypeIdentifierAcneMake();
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v220[111] = v108;
  HKDisplayTypeIdentifierLowerBackPainMake();
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v220[112] = v107;
  HKDisplayTypeIdentifierPelvicPainMake();
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v220[113] = v106;
  HKDisplayTypeIdentifierMoodChangesMake();
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v220[114] = v105;
  HKDisplayTypeIdentifierConstipationMake();
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v220[115] = v104;
  HKDisplayTypeIdentifierDiarrheaMake();
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v220[116] = v103;
  HKDisplayTypeIdentifierFatigueMake();
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v220[117] = v102;
  HKDisplayTypeIdentifierNauseaMake();
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v220[118] = v101;
  HKDisplayTypeIdentifierSleepChangesMake();
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v220[119] = v100;
  HKDisplayTypeIdentifierAppetiteChangesMake();
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v220[120] = v99;
  HKDisplayTypeIdentifierHotFlashesMake();
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v220[121] = v98;
  HKDisplayTypeIdentifierEnvironmentalAudioExposureMake();
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v220[122] = v97;
  HKDisplayTypeIdentifierHeadphoneAudioExposureMake();
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v220[123] = v96;
  HKDisplayTypeIdentifierActivityMoveModeMake();
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v220[124] = v95;
  HKDisplayTypeIdentifierEnvironmentalAudioExposureEventMake();
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v220[125] = v94;
  HKDisplayTypeIdentifierAppleMoveTimeMake();
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v220[126] = v93;
  HKDisplayTypeIdentifierWalkingDoubleSupportPercentageMake();
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v220[127] = v92;
  HKDisplayTypeIdentifierSixMinuteWalkTestDistanceMake();
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v220[128] = v91;
  HKDisplayTypeIdentifierAppleStandTimeMake();
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v220[129] = v90;
  HKDisplayTypeIdentifierWalkingSpeedMake();
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v220[130] = v89;
  HKDisplayTypeIdentifierWalkingStepLengthMake();
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v220[131] = v88;
  HKDisplayTypeIdentifierToothbrushingEventMake();
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v220[132] = v87;
  HKDisplayTypeIdentifierPregnancyMake();
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v220[133] = v86;
  HKDisplayTypeIdentifierLactationMake();
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v220[134] = v85;
  HKDisplayTypeIdentifierContraceptiveMake();
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v220[135] = v84;
  HKDisplayTypeIdentifierWalkingAsymmetryPercentageMake();
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v220[136] = v83;
  HKDisplayTypeIdentifierStairAscentSpeedMake();
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v220[137] = v82;
  HKDisplayTypeIdentifierStairDescentSpeedMake();
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v220[138] = v81;
  HKDisplayTypeIdentifierSleepDurationGoalMake();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v220[139] = v80;
  HKDisplayTypeIdentifierSleepScheduleMake();
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v220[140] = v79;
  HKDisplayTypeIdentifierHeadphoneAudioExposureEventMake();
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v220[141] = v78;
  HKDisplayTypeIdentifierRapidPoundingOrFlutteringHeartbeatMake();
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v220[142] = v77;
  HKDisplayTypeIdentifierSkippedHeartbeatMake();
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v220[143] = v76;
  HKDisplayTypeIdentifierFeverMake();
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v220[144] = v75;
  HKDisplayTypeIdentifierShortnessOfBreathMake();
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v220[145] = v74;
  HKDisplayTypeIdentifierChestTightnessOrPainMake();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v220[146] = v73;
  HKDisplayTypeIdentifierFaintingMake();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v220[147] = v72;
  HKDisplayTypeIdentifierDizzinessMake();
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v220[148] = v71;
  HKDisplayTypeIdentifierInsuranceRecordMake();
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v220[149] = v70;
  HKDisplayTypeIdentifierCardioFitnessMedicationsUseMake();
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v220[150] = v69;
  HKDisplayTypeIdentifierVomitingMake();
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v220[151] = v68;
  HKDisplayTypeIdentifierHeartburnMake();
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v220[152] = v67;
  HKDisplayTypeIdentifierCoughingMake();
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v220[153] = v66;
  HKDisplayTypeIdentifierWheezingMake();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v220[154] = v65;
  HKDisplayTypeIdentifierSoreThroatMake();
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v220[155] = v64;
  HKDisplayTypeIdentifierCongestionMake();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v220[156] = v63;
  HKDisplayTypeIdentifierRunnyNoseMake();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v220[157] = v62;
  HKDisplayTypeIdentifierVaginalDrynessMake();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v220[158] = v61;
  HKDisplayTypeIdentifierNightSweatsMake();
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v220[159] = v60;
  HKDisplayTypeIdentifierChillsMake();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v220[160] = v59;
  HKDisplayTypeIdentifierHairLossMake();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v220[161] = v58;
  HKDisplayTypeIdentifierDrySkinMake();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v220[162] = v57;
  HKDisplayTypeIdentifierBladderIncontinenceMake();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v220[163] = v56;
  HKDisplayTypeIdentifierMemoryLapseMake();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v220[164] = v55;
  HKDisplayTypeIdentifierLowCardioFitnessEventMake();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v220[165] = v54;
  HKDisplayTypeIdentifierHandwashingEventMake();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v220[166] = v53;
  HKDisplayTypeIdentifierGeneralizedBodyAcheMake();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v220[167] = v52;
  HKDisplayTypeIdentifierLossOfSmellMake();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v220[168] = v51;
  HKDisplayTypeIdentifierLossOfTasteMake();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v220[169] = v50;
  HKDisplayTypeIdentifierPregnancyTestResultMake();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v220[170] = v49;
  HKDisplayTypeIdentifierProgesteroneTestResultMake();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v220[171] = v48;
  HKDisplayTypeIdentifierAtrialFibrillationBurdenMake();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v220[172] = v47;
  HKDisplayTypeIdentifierAppleWalkingSteadinessMake();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v220[173] = v46;
  HKDisplayTypeIdentifierAppleWalkingSteadinessEventMake();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v220[174] = v45;
  HKDisplayTypeIdentifierNumberOfAlcoholicBeveragesMake();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v220[175] = v44;
  HKDisplayTypeIdentifierAppleSleepingWristTemperatureMake();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v220[176] = v43;
  HKDisplayTypeIdentifierVisionPrescriptionMake();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v220[177] = v42;
  HKDisplayTypeIdentifierRunningStrideLengthMake();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v220[178] = v41;
  HKDisplayTypeIdentifierRunningVerticalOscillationMake();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v220[179] = v40;
  HKDisplayTypeIdentifierRunningGroundContactTimeMake();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v220[180] = v39;
  HKDisplayTypeIdentifierPersistentIntermenstrualBleedingMake();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v220[181] = v38;
  HKDisplayTypeIdentifierProlongedMenstrualPeriodsMake();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v220[182] = v37;
  HKDisplayTypeIdentifierIrregularMenstrualCyclesMake();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v220[183] = v36;
  HKDisplayTypeIdentifierInfrequentMenstrualCyclesMake();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v220[184] = v35;
  HKDisplayTypeIdentifierHeartRateRecoveryMake();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v220[185] = v34;
  HKDisplayTypeIdentifierClinicalNoteRecordMake();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v220[186] = v33;
  HKDisplayTypeIdentifierUnderwaterDepthMake();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v220[187] = v32;
  HKDisplayTypeIdentifierRunningPowerMake();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v220[188] = v31;
  HKDisplayTypeIdentifierEnvironmentalSoundReductionMake();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v220[189] = v30;
  HKDisplayTypeIdentifierMedicationDoseEventMake();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v220[190] = v29;
  HKDisplayTypeIdentifierRunningSpeedMake();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v220[191] = v28;
  HKDisplayTypeIdentifierAppleSleepingBreathingDisturbancesMake();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v220[192] = v27;
  HKDisplayTypeIdentifierSleepApneaEventMake();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v220[193] = v26;
  HKDisplayTypeIdentifierWaterTemperatureMake();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v220[194] = v25;
  HKDisplayTypeIdentifierTimeInDaylightMake();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v220[195] = v24;
  HKDisplayTypeIdentifierCyclingPowerMake();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v220[196] = v23;
  HKDisplayTypeIdentifierCyclingSpeedMake();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v220[197] = v22;
  HKDisplayTypeIdentifierCyclingCadenceMake();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v220[198] = v21;
  HKDisplayTypeIdentifierCyclingFunctionalThresholdPowerMake();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v220[199] = v20;
  HKDisplayTypeIdentifierStateOfMindMake();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v220[200] = v19;
  HKDisplayTypeIdentifierPhysicalEffortMake();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v220[201] = v18;
  HKDisplayTypeIdentifierGAD7Make();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v220[202] = v17;
  HKDisplayTypeIdentifierPHQ9Make();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v220[203] = v16;
  HKDisplayTypeIdentifierPaddleSportsDistanceMake();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v220[204] = v15;
  HKDisplayTypeIdentifierRowingDistanceMake();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v220[205] = v14;
  HKDisplayTypeIdentifierCrossCountrySkiingDistanceMake();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v220[206] = v2;
  HKDisplayTypeIdentifierSkatingSportsDistanceMake();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v220[207] = v3;
  HKDisplayTypeIdentifierEstimatedWorkoutEffortScoreMake();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v220[208] = v4;
  HKDisplayTypeIdentifierRowingSpeedMake();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v220[209] = v5;
  HKDisplayTypeIdentifierCrossCountrySkiingSpeedMake();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v220[210] = v6;
  HKDisplayTypeIdentifierPaddleSportsSpeedMake();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v220[211] = v7;
  HKDisplayTypeIdentifierWorkoutEffortScoreMake();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v220[212] = v8;
  HKDisplayTypeIdentifierAppleBalanceMetricsMake();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v220[213] = v9;
  HKDisplayTypeIdentifierBleedingDuringPregnancyMake();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v220[214] = v10;
  HKDisplayTypeIdentifierBleedingAfterPregnancyMake();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v220[215] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v220, 216);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)hk_numberFormatterForUnit:(id)a3
{
  return -[HKDisplayType hk_numberFormatterForUnit:formattingContext:](self, "hk_numberFormatterForUnit:formattingContext:", a3, 0);
}

- (id)hk_customSeriesPointIntervalComponentsForTimeScope:(int64_t)a3 resolution:(int64_t)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[HKDisplayType presentation](self, "presentation", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationForTimeScope:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "singleDailyValue");

  v8 = 0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6 && v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setDay:", 1);
  }
  return v8;
}

- (unint64_t)hk_chartCalendarUnitForTimeScope:(int64_t)a3
{
  unint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = 16;
  switch(a3)
  {
    case 0:
    case 1:
      v5 = 4;
      break;
    case 2:
      v5 = 8;
      break;
    case 3:
      v5 = 0x2000;
      break;
    case 6:
    case 7:
      v5 = 32;
      break;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDisplayType+HKAdditions.m"), 101, CFSTR("Invalid zoom level (%ld)"), 8);

      v5 = 16;
      break;
    default:
      break;
  }
  -[HKDisplayType presentation](self, "presentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationForTimeScope:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "singleDailyValue");

  if ((((a3 & 0xFFFFFFFFFFFFFFFELL) == 6) & v10) != 0)
    return 16;
  else
    return v5;
}

- (id)hk_startOfDayTransform
{
  if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 63)
    HKCalendarDateTransformPreceding6PM();
  else
    HKCalendarDateTransformNone();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hk_interactiveChartAxisStringFromValue:(id)a3 defaultNumberFormatter:(id)a4 unitController:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v8 = a5;
  -[HKDisplayType hk_defaultChartAxisBoundStringFromValue:defaultNumberFormatter:unitController:](self, "hk_defaultChartAxisBoundStringFromValue:defaultNumberFormatter:unitController:", a3, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType presentation](self, "presentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldDisplayUnitStringOnYAxis");

  if (v11)
  {
    objc_msgSend(v8, "localizedDisplayNameForDisplayType:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKFormatValueAndUnit(v9, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }

  return v9;
}

- (id)hk_defaultChartAxisBoundStringFromValue:(id)a3 defaultNumberFormatter:(id)a4 unitController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "unitForDisplayType:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType hk_numberFormatterForUnit:](self, "hk_numberFormatterForUnit:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v9;
  v15 = v14;

  HKFormattedStringFromValue(v10, self, v8, 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_dataSourceForTimeScope:(int64_t)a3 dataCacheController:(id)a4
{
  void *v4;
  HKCacheBackedChartSeriesDataSource *v5;

  objc_msgSend(a4, "interactiveChartsCacheForDisplayType:timeScope:", self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  -[HKCacheBackedChartSeriesDataSource setChartCache:](v5, "setChartCache:", v4);

  return v5;
}

- (id)_generateBloodPressureSeriesWithColor:(id)a3
{
  return +[HKBloodPressureSeries defaultSeriesWithDiastolicColor:](HKBloodPressureSeries, "defaultSeriesWithDiastolicColor:", a3);
}

- (id)_generateMinMaxSeriesWithColor:(id)a3 opacity:(double)a4 unselectedPointStyle:(int64_t)a5 selectedPointStyle:(int64_t)a6
{
  id v9;
  HKMinMaxSeries *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;

  v9 = a3;
  v10 = objc_alloc_init(HKMinMaxSeries);
  +[HKChartSeriesPointMarker chartPointWithColor:radius:style:](HKChartSeriesPointMarker, "chartPointWithColor:radius:style:", v9, a5, 4.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMinMaxSeries setUnselectedPointMarkerImage:](v10, "setUnselectedPointMarkerImage:", v11);

  objc_msgSend(v9, "colorWithAlphaComponent:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v12, 8.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMinMaxSeries setUnselectedStrokeStyle:](v10, "setUnselectedStrokeStyle:", v13);

  +[HKChartSeriesPointMarker chartPointWithColor:radius:style:](HKChartSeriesPointMarker, "chartPointWithColor:radius:style:", v9, a6, HKUIOnePixel() + 5.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMinMaxSeries setSelectedPointMarkerImage:](v10, "setSelectedPointMarkerImage:", v14);

  objc_msgSend(v9, "colorWithAlphaComponent:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = HKUIOnePixel();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v15, v16 + 5.0 + v16 + 5.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMinMaxSeries setSelectedStrokeStyle:](v10, "setSelectedStrokeStyle:", v17);

  return v10;
}

- (CGSize)_barCornerRadiusForCurrentDevice
{
  void *v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isiPad"))
    v3 = 3.0;
  else
    v3 = 1.5;

  v4 = v3;
  v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)_generateBarSeriesWithFillStyle:(id)a3
{
  id v4;
  HKBarSeries *v5;
  void *v6;
  void *v7;
  HKStrokeStyle *v8;
  void *v9;
  HKSolidFillStyle *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc_init(HKBarSeries);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v6, 3.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(HKStrokeStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStrokeStyle setStrokeColor:](v8, "setStrokeColor:", v9);

  -[HKStrokeStyle setLineWidth:](v8, "setLineWidth:", 3.0);
  -[HKStrokeStyle setBlendMode:](v8, "setBlendMode:", 22);
  -[HKBarSeries setUnselectedStrokeStyle:](v5, "setUnselectedStrokeStyle:", v8);
  -[HKBarSeries setTiledStrokeStyle:](v5, "setTiledStrokeStyle:", v7);
  -[HKBarSeries setUnselectedFillStyle:](v5, "setUnselectedFillStyle:", v4);
  -[HKBarSeries setSelectedFillStyle:](v5, "setSelectedFillStyle:", v4);

  v10 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartInactiveSeriesColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v10, "setColor:", v11);

  -[HKBarSeries setInactiveFillStyle:](v5, "setInactiveFillStyle:", v10);
  -[HKDisplayType _barCornerRadiusForCurrentDevice](self, "_barCornerRadiusForCurrentDevice");
  -[HKBarSeries setCornerRadii:](v5, "setCornerRadii:");

  return v5;
}

- (id)_generateInsulinBarSeriesWithDisplayCategory
{
  HKStackedBarSeries *v3;
  HKStrokeStyle *v4;
  void *v5;
  HKSolidFillStyle *v6;
  void *v7;
  HKSolidFillStyle *v8;
  HKSolidFillStyle *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKSolidFillStyle *v14;
  void *v15;
  HKSolidFillStyle *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(HKStackedBarSeries);
  v4 = objc_alloc_init(HKStrokeStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStrokeStyle setStrokeColor:](v4, "setStrokeColor:", v5);

  -[HKStrokeStyle setLineWidth:](v4, "setLineWidth:", 3.0);
  -[HKStrokeStyle setBlendMode:](v4, "setBlendMode:", 22);
  -[HKBarSeries setUnselectedStrokeStyle:](v3, "setUnselectedStrokeStyle:", v4);
  -[HKDisplayType _barCornerRadiusForCurrentDevice](self, "_barCornerRadiusForCurrentDevice");
  -[HKBarSeries setCornerRadii:](v3, "setCornerRadii:");
  v6 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_insulinBasalKeyColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v6, "setColor:", v7);

  v8 = v6;
  v9 = objc_alloc_init(HKSolidFillStyle);
  HKHealthKeyColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v9, "setColor:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v11, 3.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBarSeries setTiledStrokeStyle:](v3, "setTiledStrokeStyle:", v12);
  v21[0] = v8;
  v21[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStackedBarSeries setUnselectedFillStyles:](v3, "setUnselectedFillStyles:", v13);

  v14 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v14, "setColor:", v15);

  v16 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartInactiveSeriesColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v16, "setColor:", v17);

  v20[0] = v14;
  v20[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKStackedBarSeries setInactiveFillStyles:](v3, "setInactiveFillStyles:", v18);
  return v3;
}

- (id)_generateHandwashingBarSeriesWithDisplayCategory:(id)a3
{
  id v4;
  HKBarSeries *v5;
  HKStrokeStyle *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKSolidFillStyle *v11;
  void *v12;
  HKBarSeriesConfiguration *v13;
  void *v14;

  v4 = a3;
  v5 = objc_alloc_init(HKBarSeries);
  v6 = objc_alloc_init(HKStrokeStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStrokeStyle setStrokeColor:](v6, "setStrokeColor:", v7);

  -[HKStrokeStyle setLineWidth:](v6, "setLineWidth:", 3.0);
  -[HKStrokeStyle setBlendMode:](v6, "setBlendMode:", 22);
  -[HKBarSeries setUnselectedStrokeStyle:](v5, "setUnselectedStrokeStyle:", v6);
  -[HKDisplayType _barCornerRadiusForCurrentDevice](self, "_barCornerRadiusForCurrentDevice");
  -[HKBarSeries setCornerRadii:](v5, "setCornerRadii:");
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v8, 3.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBarSeries setTiledStrokeStyle:](v5, "setTiledStrokeStyle:", v9);
  objc_msgSend(v4, "fillStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKBarSeries setUnselectedFillStyle:](v5, "setUnselectedFillStyle:", v10);
  v11 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_otherSecondaryColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v11, "setColor:", v12);

  v13 = objc_alloc_init(HKBarSeriesConfiguration);
  -[HKBarSeriesConfiguration setUnselectedFillStyle:](v13, "setUnselectedFillStyle:", v11);
  -[HKBarSeriesConfiguration setIsIncludedBlock:](v13, "setIsIncludedBlock:", &__block_literal_global_5);
  -[HKBarSeries overrideConfigurations](v5, "overrideConfigurations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v13);

  return v5;
}

uint64_t __81__HKDisplayType_HKGraphSeries___generateHandwashingBarSeriesWithDisplayCategory___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "meetsGoal") ^ 1;
  else
    v4 = 0;

  return v4;
}

- (id)_generateStackedSeriesWithColor:(id)a3 numericAxisConfigurationOverrides:(id)a4
{
  id v6;
  id v7;
  HKHorizontalTimePeriodSeries *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HKHorizontalTimePeriodSeries);
  -[HKHorizontalTimePeriodSeries setFillColor:](v8, "setFillColor:", v7);

  -[HKHorizontalTimePeriodSeries setLineWidth:](v8, "setLineWidth:", HKUIOnePixel() + 9.0);
  -[HKDisplayType hk_enumeratedValueLabels](self, "hk_enumeratedValueLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHorizontalTimePeriodSeries setValueLabels:](v8, "setValueLabels:", v9);

  -[HKDisplayType hk_valueOrderForStackedCharts](self, "hk_valueOrderForStackedCharts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHorizontalTimePeriodSeries setEnumerationValueOrdering:](v8, "setEnumerationValueOrdering:", v10);

  HKHealthKeyColor();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKChartSeriesPointMarker chartPointWithColor:radius:style:](HKChartSeriesPointMarker, "chartPointWithColor:radius:style:", v11, 0, HKUIOnePixel() + 5.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHorizontalTimePeriodSeries setSelectedPointMarkerImage:](v8, "setSelectedPointMarkerImage:", v12);

  objc_msgSend(v6, "setLabelDataSource:", v8);
  return v8;
}

- (id)_generateSingleLineSeriesWithColor:(id)a3 timeScope:(int64_t)a4 numericAxisConfigurationOverrides:(id)a5
{
  id v8;
  id v9;
  HKHorizontalSingleLineSeries *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(HKHorizontalSingleLineSeries);
  if (a4 != 6)
  {
    -[HKDisplayType chartingRules](self, "chartingRules");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldConnectSamplesWithLines");

    -[HKHorizontalSingleLineSeries setShouldConnectPoints:](v10, "setShouldConnectPoints:", v12);
  }
  -[HKHorizontalSingleLineSeries setBaseColor:](v10, "setBaseColor:", v8);
  HKHealthKeyColor();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKChartSeriesPointMarker chartPointWithColor:radius:style:](HKChartSeriesPointMarker, "chartPointWithColor:radius:style:", v13, 0, HKUIOnePixel() + 5.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHorizontalSingleLineSeries setSelectedPointMarkerImage:](v10, "setSelectedPointMarkerImage:", v14);

  objc_msgSend(v9, "setLabelDataSource:", v10);
  return v10;
}

- (id)_generateLevelCategorySeriesWithColor:(id)a3 numericAxisConfigurationOverrides:(id)a4
{
  id v6;
  id v7;
  HKLevelCategoryTimePeriodSeries *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HKLevelCategoryTimePeriodSeries);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLevelCategoryTimePeriodSeries setCategoryLevelFont:](v8, "setCategoryLevelFont:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLightGrayTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLevelCategoryTimePeriodSeries setCategoryLevelColor:](v8, "setCategoryLevelColor:", v10);

  -[HKHorizontalTimePeriodSeries setFillColor:](v8, "setFillColor:", v7);
  -[HKDisplayType hk_enumeratedValueLabels](self, "hk_enumeratedValueLabels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHorizontalTimePeriodSeries setValueLabels:](v8, "setValueLabels:", v11);

  -[HKDisplayType hk_valueOrderForStackedCharts](self, "hk_valueOrderForStackedCharts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHorizontalTimePeriodSeries setEnumerationValueOrdering:](v8, "setEnumerationValueOrdering:", v12);

  HKHealthKeyColor();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKChartSeriesPointMarker chartPointWithColor:radius:style:](HKChartSeriesPointMarker, "chartPointWithColor:radius:style:", v13, 0, HKUIOnePixel() + 5.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHorizontalTimePeriodSeries setSelectedPointMarkerImage:](v8, "setSelectedPointMarkerImage:", v14);

  -[HKLevelCategoryTimePeriodSeries setMarkerRadius:](v8, "setMarkerRadius:", 4.0);
  -[HKDisplayType chartingRules](self, "chartingRules");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HKDisplayType chartingRules](self, "chartingRules");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLevelCategoryTimePeriodSeries setDrawSampleSpans:](v8, "setDrawSampleSpans:", objc_msgSend(v16, "shouldConnectSamplesWithLines"));

  }
  objc_msgSend(v6, "setLabelDataSource:", v8);

  return v8;
}

- (id)_generateJulianIndexedSevenDayQuantitySeriesWithColor:(id)a3
{
  id v3;
  HKJulianIndexedSevenDayQuantitySeries *v4;

  v3 = a3;
  v4 = -[HKJulianIndexedSevenDayQuantitySeries initWithColor:lineWidth:]([HKJulianIndexedSevenDayQuantitySeries alloc], "initWithColor:lineWidth:", v3, 6.0);

  return v4;
}

- (id)_generateAFibBurdenLineSeriesWithColor:(id)a3
{
  void *v3;

  -[HKDisplayType generateLineSeriesWithColor:timeScope:](self, "generateLineSeriesWithColor:timeScope:", a3, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaximumConnectionDistance:", &unk_1E9CED428);
  return v3;
}

- (void)_assignAFibBurdenAxisForSeries:(id)a3 standardAxisConfiguration:(id)a4 externalAxisConfigurationOverrides:(id)a5
{
  id v6;
  id v7;
  void *v8;
  HKNumericAxisConfiguration *v9;

  if (!a5)
  {
    v6 = a4;
    v7 = a3;
    v9 = objc_alloc_init(HKNumericAxisConfiguration);
    -[HKNumericAxisConfiguration applyOverridesFromNumericAxisConfiguration:](v9, "applyOverridesFromNumericAxisConfiguration:", v6);

    -[HKAxisConfiguration setMinLabels:](v9, "setMinLabels:", 5);
    -[HKAxisConfiguration setMaxLabels:](v9, "setMaxLabels:", 5);
    +[HKNumericAxis standardNumericYAxisWithConfigurationOverrides:](HKNumericAxis, "standardNumericYAxisWithConfigurationOverrides:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setYAxis:", v8);

  }
}

- (void)_assignWalkingAsymmetryPercentageAxisForSeries:(id)a3 standardAxisConfiguration:(id)a4 externalAxisConfigurationOverrides:(id)a5
{
  id v6;
  id v7;
  void *v8;
  HKNumericAxisConfiguration *v9;

  if (!a5)
  {
    v6 = a4;
    v7 = a3;
    v9 = objc_alloc_init(HKNumericAxisConfiguration);
    -[HKNumericAxisConfiguration applyOverridesFromNumericAxisConfiguration:](v9, "applyOverridesFromNumericAxisConfiguration:", v6);

    -[HKNumericAxisConfiguration setTopVerticalLabelPadding:](v9, "setTopVerticalLabelPadding:", HKUIOnePixel() + 4.0);
    +[HKNumericAxis standardNumericYAxisWithConfigurationOverrides:](HKNumericAxis, "standardNumericYAxisWithConfigurationOverrides:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setYAxis:", v8);

  }
}

- (id)_generateRelativeLineSeriesWithColor:(id)a3 timeScope:(int64_t)a4 valueAxisAnnotationFormatter:(id)a5 chartSizeClass:(int64_t)a6
{
  id v10;
  void *v11;
  HKRelativeLineSeries *v12;
  void *v13;
  id v14;

  v10 = a3;
  -[HKDisplayType generateLineSeriesWithColor:timeScope:valueAxisAnnotationFormatter:](self, "generateLineSeriesWithColor:timeScope:valueAxisAnnotationFormatter:", v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [HKRelativeLineSeries alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKRelativeLineSeries initFromLineSeries:color:unavailableColor:indeterminateLozengeLineWidth:chartSizeClass:](v12, "initFromLineSeries:color:unavailableColor:indeterminateLozengeLineWidth:chartSizeClass:", v11, v10, v13, a6, 6.0);

  return v14;
}

- (id)_generateAbnormalBreathingSeriesWithDisplayCategory:(id)a3 timeScope:(int64_t)a4
{
  void *v6;
  void *v7;
  HKBreathingDisturbancesAxis *v8;

  objc_msgSend(a3, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType generateLineSeriesWithColor:timeScope:](self, "generateLineSeriesWithColor:timeScope:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HKBreathingDisturbancesAxis initWithDisplayType:]([HKBreathingDisturbancesAxis alloc], "initWithDisplayType:", self);
  objc_msgSend(v7, "setYAxis:", v8);

  return v7;
}

- (id)_generateGraphSeriesForTimeScope:(int64_t)a3 displayCategory:(id)a4 unitController:(id)a5 standardAxisConfiguration:(id)a6 externalAxisConfigurationOverrides:(id)a7 chartSizeClass:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HKDisplayTypeNumberFormatter *v18;
  HKDisplayTypeNumberFormatter *v19;
  _BOOL8 v20;
  HKDisplayType *v21;
  HKDisplayTypeNumberFormatter *v22;
  HKDisplayTypeNumberFormatter *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  HKTieredDecimalPrecisionRule *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  HKRelativeNumberFormatter *v38;
  __objc2_class *v39;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 286)
  {
LABEL_2:
    v18 = -[HKDisplayTypeNumberFormatter initWithDisplayType:unitController:]([HKDisplayTypeNumberFormatter alloc], "initWithDisplayType:unitController:", self, v15);
    objc_msgSend(v14, "color");
    v19 = (HKDisplayTypeNumberFormatter *)objc_claimAutoreleasedReturnValue();
    v20 = -[HKDisplayType hk_supportsMinMaxOverlayForChartSizeClass:](self, "hk_supportsMinMaxOverlayForChartSizeClass:", a8);
    v21 = self;
    v22 = v19;
    v23 = v18;
LABEL_3:
    -[HKDisplayType generateDistributionSeriesWithColor:numberFormatter:hasMinMaxOverlay:](v21, "generateDistributionSeriesWithColor:numberFormatter:hasMinMaxOverlay:", v22, v23, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 15)
  {
LABEL_5:
    objc_msgSend(v15, "unitForDisplayType:", self);
    v18 = (HKDisplayTypeNumberFormatter *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType hk_numberFormatterForUnit:](self, "hk_numberFormatterForUnit:", v18);
    v19 = (HKDisplayTypeNumberFormatter *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "color");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType generateDistributionSeriesWithColor:numberFormatter:hasMinMaxOverlay:](self, "generateDistributionSeriesWithColor:numberFormatter:hasMinMaxOverlay:", v25, v19, -[HKDisplayType hk_supportsMinMaxOverlayForChartSizeClass:](self, "hk_supportsMinMaxOverlayForChartSizeClass:", a8));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 80)
  {
    objc_msgSend(v14, "color");
    v18 = (HKDisplayTypeNumberFormatter *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType _generateBloodPressureSeriesWithColor:](self, "_generateBloodPressureSeriesWithColor:", v18);
    v29 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v24 = (void *)v29;
    goto LABEL_7;
  }
  if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 125)
  {
    -[HKDisplayType _generateInsulinBarSeriesWithDisplayCategory](self, "_generateInsulinBarSeriesWithDisplayCategory");
    v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v24 = v30;
    goto LABEL_8;
  }
  if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 5
    || -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 172
    || -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 173
    || -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 272)
  {
    objc_msgSend(v14, "color");
    v18 = (HKDisplayTypeNumberFormatter *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37F0], "hk_wholeNumberFormatter");
    v19 = (HKDisplayTypeNumberFormatter *)objc_claimAutoreleasedReturnValue();
    v20 = -[HKDisplayType hk_supportsMinMaxOverlayForChartSizeClass:](self, "hk_supportsMinMaxOverlayForChartSizeClass:", a8);
    v21 = self;
    v22 = v18;
    v23 = v19;
    goto LABEL_3;
  }
  if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 237)
  {
    -[HKDisplayType _generateHandwashingBarSeriesWithDisplayCategory:](self, "_generateHandwashingBarSeriesWithDisplayCategory:", v14);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 14)
  {
    v18 = -[HKDisplayTypeNumberFormatter initWithDisplayType:unitController:]([HKDisplayTypeNumberFormatter alloc], "initWithDisplayType:unitController:", self, v15);
    objc_msgSend(v14, "color");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType generateDistributionSeriesWithColor:numberFormatter:hasMinMaxOverlay:](self, "generateDistributionSeriesWithColor:numberFormatter:hasMinMaxOverlay:", v31, v18, -[HKDisplayType hk_supportsMinMaxOverlayForChartSizeClass:](self, "hk_supportsMinMaxOverlayForChartSizeClass:", a8));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setZeroCountForGap:", 5);
    goto LABEL_7;
  }
  if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") != 248)
  {
    if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 61)
      goto LABEL_5;
    if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 194)
    {
      -[HKDisplayType chartingRules](self, "chartingRules");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType _generateStandardSeriesForChartStyle:timeScope:chartSizeClass:axisConfiguration:displayCategory:unitController:](self, "_generateStandardSeriesForChartStyle:timeScope:chartSizeClass:axisConfiguration:displayCategory:unitController:", objc_msgSend(v33, "chartStyleForTimeScope:", a3), a3, a8, v16, v14, v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKDisplayType _assignWalkingAsymmetryPercentageAxisForSeries:standardAxisConfiguration:externalAxisConfigurationOverrides:](self, "_assignWalkingAsymmetryPercentageAxisForSeries:standardAxisConfiguration:externalAxisConfigurationOverrides:", v24, v16, v17);
      goto LABEL_8;
    }
    if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 182)
      goto LABEL_2;
    if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 269
      || -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 277)
    {
      objc_msgSend(v14, "color");
      v18 = (HKDisplayTypeNumberFormatter *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType _generateMinMaxSeriesWithColor:opacity:unselectedPointStyle:selectedPointStyle:](self, "_generateMinMaxSeriesWithColor:opacity:unselectedPointStyle:selectedPointStyle:", v18, 0, 0, 1.0);
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 187
      || -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 188
      || -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 195
      || -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 196)
    {
      v34 = objc_alloc_init(HKTieredDecimalPrecisionRule);
      -[HKTieredDecimalPrecisionRule numberFormatter](v34, "numberFormatter");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "color");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType generateDistributionSeriesWithColor:numberFormatter:hasMinMaxOverlay:](self, "generateDistributionSeriesWithColor:numberFormatter:hasMinMaxOverlay:", v36, v35, -[HKDisplayType hk_supportsMinMaxOverlayForChartSizeClass:](self, "hk_supportsMinMaxOverlayForChartSizeClass:", a8));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 249)
      {
        objc_msgSend(v14, "color");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKMobilityUtilities generateAppleWalkingSteadinessSeriesForTimeScope:displayType:color:](HKMobilityUtilities, "generateAppleWalkingSteadinessSeriesForTimeScope:displayType:color:", a3, self, v35);
        v37 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 256)
        {
          objc_msgSend(v14, "color");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_alloc_init(HKRelativeNumberFormatter);
          -[HKDisplayType _generateRelativeLineSeriesWithColor:timeScope:valueAxisAnnotationFormatter:chartSizeClass:](self, "_generateRelativeLineSeriesWithColor:timeScope:valueAxisAnnotationFormatter:chartSizeClass:", v35, a3, v38, a8);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_41;
        }
        if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 284)
        {
          +[HKStateOfMindSeries standardStateOfMindSeriesWithStateOfMindDisplayType:unitController:](HKStateOfMindSeries, "standardStateOfMindSeriesWithStateOfMindDisplayType:unitController:", self, v15);
          v30 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 275)
        {
          -[HKDisplayType _generateAbnormalBreathingSeriesWithDisplayCategory:timeScope:](self, "_generateAbnormalBreathingSeriesWithDisplayCategory:timeScope:", v14, a3);
          v30 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 305)
        {
          if (a3 == 6)
            v39 = HKBalanceDaySeries;
          else
            v39 = HKBalanceSeries;
          v30 = objc_alloc_init(v39);
          goto LABEL_14;
        }
        if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 191)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "hk_pregnancyKeyColor");
          v18 = (HKDisplayTypeNumberFormatter *)objc_claimAutoreleasedReturnValue();
          -[HKDisplayType _generateLevelCategorySeriesWithColor:numericAxisConfigurationOverrides:](self, "_generateLevelCategorySeriesWithColor:numericAxisConfigurationOverrides:", v18, v16);
          v29 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        -[HKDisplayType chartingRules](self, "chartingRules");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKDisplayType _generateStandardSeriesForChartStyle:timeScope:chartSizeClass:axisConfiguration:displayCategory:unitController:](self, "_generateStandardSeriesForChartStyle:timeScope:chartSizeClass:axisConfiguration:displayCategory:unitController:", objc_msgSend(v35, "chartStyleForTimeScope:", a3), a3, a8, v16, v14, v15);
        v37 = objc_claimAutoreleasedReturnValue();
      }
      v24 = (void *)v37;
    }
LABEL_41:

    goto LABEL_8;
  }
  objc_msgSend(v14, "color");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 3)
    -[HKDisplayType _generateAFibBurdenLineSeriesWithColor:](self, "_generateAFibBurdenLineSeriesWithColor:", v32);
  else
    -[HKDisplayType _generateJulianIndexedSevenDayQuantitySeriesWithColor:](self, "_generateJulianIndexedSevenDayQuantitySeriesWithColor:", v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKDisplayType _assignAFibBurdenAxisForSeries:standardAxisConfiguration:externalAxisConfigurationOverrides:](self, "_assignAFibBurdenAxisForSeries:standardAxisConfiguration:externalAxisConfigurationOverrides:", v24, v16, v17);
LABEL_8:
  objc_msgSend(v14, "color");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setOffScreenIndicatorColor:", v26);

  -[HKDisplayType chartingRules](self, "chartingRules");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWantsRoundingDuringYRangeExpansion:", objc_msgSend(v27, "shouldRoundYAxisDuringExpansion"));

  return v24;
}

- (id)_generateStandardSeriesForChartStyle:(int64_t)a3 timeScope:(int64_t)a4 chartSizeClass:(int64_t)a5 axisConfiguration:(id)a6 displayCategory:(id)a7 unitController:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HKDisplayTypeNumberFormatter *v21;

  v14 = a6;
  v15 = a7;
  v16 = a8;
  switch(a3)
  {
    case 1:
      objc_msgSend(v15, "color");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType generateLineSeriesWithColor:timeScope:](self, "generateLineSeriesWithColor:timeScope:", v17, a4);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      objc_msgSend(v15, "color");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType generateScatterPlotSeriesWithColor:](self, "generateScatterPlotSeriesWithColor:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      objc_msgSend(v15, "color");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType _generateMinMaxSeriesWithColor:opacity:unselectedPointStyle:selectedPointStyle:](self, "_generateMinMaxSeriesWithColor:opacity:unselectedPointStyle:selectedPointStyle:", v17, 1, 0, 0.3);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4:
      objc_msgSend(v15, "fillStyle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType _generateBarSeriesWithFillStyle:](self, "_generateBarSeriesWithFillStyle:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5:
    case 6:
      objc_msgSend(v15, "color");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType _generateStackedSeriesWithColor:numericAxisConfigurationOverrides:](self, "_generateStackedSeriesWithColor:numericAxisConfigurationOverrides:", v17, v14);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 7:
      objc_msgSend(v15, "color");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType _generateSingleLineSeriesWithColor:timeScope:numericAxisConfigurationOverrides:](self, "_generateSingleLineSeriesWithColor:timeScope:numericAxisConfigurationOverrides:", v17, a4, v14);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 8:
      objc_msgSend(v15, "color");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType _generateLevelCategorySeriesWithColor:numericAxisConfigurationOverrides:](self, "_generateLevelCategorySeriesWithColor:numericAxisConfigurationOverrides:", v17, v14);
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v19 = (void *)v18;
      goto LABEL_11;
    case 9:
      objc_msgSend(v15, "color");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HKDisplayTypeNumberFormatter initWithDisplayType:unitController:]([HKDisplayTypeNumberFormatter alloc], "initWithDisplayType:unitController:", self, v16);
      -[HKDisplayType generateDistributionSeriesWithColor:numberFormatter:hasMinMaxOverlay:](self, "generateDistributionSeriesWithColor:numberFormatter:hasMinMaxOverlay:", v17, v21, -[HKDisplayType hk_supportsMinMaxOverlayForChartSizeClass:](self, "hk_supportsMinMaxOverlayForChartSizeClass:", a5));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      break;
    default:
      v19 = 0;
      break;
  }

  return v19;
}

- (id)hk_standardSeriesForTimeScope:(int64_t)a3 displayCategory:(id)a4 unitController:(id)a5 dataCacheController:(id)a6
{
  return -[HKDisplayType hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:](self, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:", a3, a4, a5, a6, 0);
}

- (id)hk_standardSeriesForTimeScope:(int64_t)a3 displayCategory:(id)a4 unitController:(id)a5 dataCacheController:(id)a6 numericAxisConfigurationOverrides:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  -[HKDisplayType _dataSourceForTimeScope:dataCacheController:](self, "_dataSourceForTimeScope:dataCacheController:", a3, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType hk_standardSeriesForTimeScope:graphSeriesDataSource:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:](self, "hk_standardSeriesForTimeScope:graphSeriesDataSource:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:", a3, v16, v15, v14, v13, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)hk_standardSeriesForTimeScope:(int64_t)a3 displayCategory:(id)a4 unitController:(id)a5 dataCacheController:(id)a6 numericAxisConfigurationOverrides:(id)a7 chartSizeClass:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  -[HKDisplayType _dataSourceForTimeScope:dataCacheController:](self, "_dataSourceForTimeScope:dataCacheController:", a3, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType hk_standardSeriesForTimeScope:graphSeriesDataSource:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:chartSizeClass:](self, "hk_standardSeriesForTimeScope:graphSeriesDataSource:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:chartSizeClass:", a3, v18, v17, v16, v15, v14, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)hk_standardSeriesForTimeScope:(int64_t)a3 graphSeriesDataSource:(id)a4 displayCategory:(id)a5 unitController:(id)a6 dataCacheController:(id)a7
{
  return -[HKDisplayType hk_standardSeriesForTimeScope:graphSeriesDataSource:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:](self, "hk_standardSeriesForTimeScope:graphSeriesDataSource:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:", a3, a4, a5, a6, a7, 0);
}

- (id)hk_standardSeriesForTimeScope:(int64_t)a3 graphSeriesDataSource:(id)a4 displayCategory:(id)a5 unitController:(id)a6 dataCacheController:(id)a7 numericAxisConfigurationOverrides:(id)a8
{
  return -[HKDisplayType hk_standardSeriesForTimeScope:graphSeriesDataSource:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:chartSizeClass:](self, "hk_standardSeriesForTimeScope:graphSeriesDataSource:displayCategory:unitController:dataCacheController:numericAxisConfigurationOverrides:chartSizeClass:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)hk_standardSeriesForTimeScope:(int64_t)a3 graphSeriesDataSource:(id)a4 displayCategory:(id)a5 unitController:(id)a6 dataCacheController:(id)a7 numericAxisConfigurationOverrides:(id)a8 chartSizeClass:(int64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  HKNumericAxisConfiguration *v20;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  -[HKDisplayType chartingRules](self, "chartingRules");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "chartStyleForTimeScope:", a3);

  v20 = objc_alloc_init(HKNumericAxisConfiguration);
  -[HKDisplayType hk_dimensionForChartAxisWithUnitController:](self, "hk_dimensionForChartAxisWithUnitController:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKNumericAxisConfiguration setLabelDimension:](v20, "setLabelDimension:", v21);

  if (!+[HKDisplayTypeChartingRules chartStyleContainsHorizontalGridlines:](HKDisplayTypeChartingRules, "chartStyleContainsHorizontalGridlines:", v19))-[HKAxisConfiguration setOverrideNoTopBaseline:](v20, "setOverrideNoTopBaseline:", 1);
  -[HKDisplayType chartingRules](self, "chartingRules");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "maximumYAxisLabelCount");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[HKDisplayType chartingRules](self, "chartingRules");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "maximumYAxisLabelCount");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisConfiguration setMaxLabels:](v20, "setMaxLabels:", objc_msgSend(v25, "integerValue"));

  }
  -[HKDisplayType chartingRules](self, "chartingRules");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "maximumYAxisLabelWidth");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[HKDisplayType chartingRules](self, "chartingRules");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "maximumYAxisLabelWidth");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisConfiguration setMaxLabelWidth:](v20, "setMaxLabelWidth:", v29);

  }
  if (v17)
    -[HKNumericAxisConfiguration applyOverridesFromNumericAxisConfiguration:](v20, "applyOverridesFromNumericAxisConfiguration:", v17);
  if (v14)
  {
    -[HKDisplayType _generateGraphSeriesForTimeScope:displayCategory:unitController:standardAxisConfiguration:externalAxisConfigurationOverrides:chartSizeClass:](self, "_generateGraphSeriesForTimeScope:displayCategory:unitController:standardAxisConfiguration:externalAxisConfigurationOverrides:chartSizeClass:", a3, v15, v16, v20, v17, a9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKNumericAxis standardNumericYAxisWithConfigurationOverrides:](HKNumericAxis, "standardNumericYAxisWithConfigurationOverrides:", v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "yAxis");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
      objc_msgSend(v30, "setYAxis:", v31);
    objc_msgSend(v30, "setDataSource:", v14);
    -[HKDisplayType hk_axisScalingRuleForChartSizeClass:unitController:](self, "hk_axisScalingRuleForChartSizeClass:unitController:", a9, v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAxisScalingRule:", v33);
    -[HKDisplayType presentation](self, "presentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setIsCriticalForAutoscale:", objc_msgSend(v34, "isCriticalForAutoscale"));

    -[HKDisplayType chartingRules](self, "chartingRules");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setInvertYAxis:", objc_msgSend(v35, "shouldInvertYAxis"));

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)hk_axisScalingRuleForChartSizeClass:(int64_t)a3 unitController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  if (a3 == 1
    && (-[HKDisplayType chartingRules](self, "chartingRules"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "compactChartAxisScalingRule"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    -[HKDisplayType chartingRules](self, "chartingRules");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "compactChartAxisScalingRule");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKDisplayType chartingRules](self, "chartingRules");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "axisScalingRule");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  objc_msgSend(v6, "unitForChartingDisplayType:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "setUnit:", v12);

  return v11;
}

- (BOOL)hk_supportsMinMaxOverlayForChartSizeClass:(int64_t)a3
{
  return a3 != 1;
}

- (int64_t)hk_stackedChartSectionsCountForTimeScope:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;

  -[HKDisplayType chartingRules](self, "chartingRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "chartStyleForTimeScope:", a3) == 7)
  {
    v6 = 1;
  }
  else
  {
    -[HKDisplayType hk_enumeratedValueLabels](self, "hk_enumeratedValueLabels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v8 <= 1)
      v6 = 1;
    else
      v6 = v8;

  }
  return v6;
}

- (BOOL)hk_isSupportedTimeScope:(int64_t)a3
{
  BOOL result;

  switch(a3)
  {
    case 0:
      result = -[HKDisplayType _supportsTenYearTimeScope](self, "_supportsTenYearTimeScope");
      break;
    case 1:
      result = -[HKDisplayType _supportsFiveYearTimeScope](self, "_supportsFiveYearTimeScope");
      break;
    case 2:
      result = -[HKDisplayType _supportsYearTimeScope](self, "_supportsYearTimeScope");
      break;
    case 3:
      result = -[HKDisplayType _supportsSixMonthTimeScope](self, "_supportsSixMonthTimeScope");
      break;
    case 4:
      result = -[HKDisplayType _supportsMonthTimeScope](self, "_supportsMonthTimeScope");
      break;
    case 5:
      result = -[HKDisplayType _supportsWeekTimeScope](self, "_supportsWeekTimeScope");
      break;
    case 6:
      result = -[HKDisplayType _supportsDayTimeScope](self, "_supportsDayTimeScope");
      break;
    case 7:
      result = -[HKDisplayType _supportsHourTimeScope](self, "_supportsHourTimeScope");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)_supportsHourTimeScope
{
  return (-[HKDisplayType hk_interactiveChartOptions](self, "hk_interactiveChartOptions") >> 7) & 1;
}

- (BOOL)_supportsDayTimeScope
{
  return (-[HKDisplayType hk_interactiveChartOptions](self, "hk_interactiveChartOptions") & 0x400) == 0;
}

- (BOOL)_supportsWeekTimeScope
{
  return (-[HKDisplayType hk_interactiveChartOptions](self, "hk_interactiveChartOptions") & 0x8000) == 0;
}

- (BOOL)_supportsSixMonthTimeScope
{
  return (-[HKDisplayType hk_interactiveChartOptions](self, "hk_interactiveChartOptions") & 0x4000) == 0;
}

- (BOOL)_supportsMonthTimeScope
{
  return 1;
}

- (BOOL)_supportsYearTimeScope
{
  return (-[HKDisplayType hk_interactiveChartOptions](self, "hk_interactiveChartOptions") & 0x200) == 0;
}

- (BOOL)_supportsFiveYearTimeScope
{
  return (-[HKDisplayType hk_interactiveChartOptions](self, "hk_interactiveChartOptions") >> 8) & 1;
}

- (BOOL)_supportsTenYearTimeScope
{
  return (-[HKDisplayType hk_interactiveChartOptions](self, "hk_interactiveChartOptions") >> 21) & 1;
}

- (BOOL)contextItemShouldUseTightSpacingBetweenValueAndUnit
{
  void *v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[HKDisplayType objectType](self, "objectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hk_valueFormatterClass");

  if (v4 == objc_opt_class())
    return 1;
  -[HKDisplayType objectType](self, "objectType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[HKDisplayType objectType](self, "objectType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "canonicalUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "degreeCelsiusUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "_isCompatibleWithUnit:", v9);

  return (v10 & 1) != 0;
}

- (BOOL)contextItemShouldDisplayEventCountForDistributionStyle:(int64_t)a3
{
  return ((unint64_t)a3 < 8) & (0xB8u >> a3);
}

- (id)copyWithPresentation:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (_QWORD *)-[HKDisplayType copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[10];
  v5[10] = v6;

  v8 = (void *)v5[3];
  v5[3] = 0;

  v9 = (void *)v5[4];
  v5[4] = 0;

  return v5;
}

- (id)copyWithDefaultAxisRangeOverride:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[HKDisplayType copy](self, "copy");
  v6 = (void *)v5[13];
  v5[13] = v4;

  return v5;
}

- (id)copyWithLocalization:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[HKDisplayType copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[11];
  v5[11] = v6;

  return v5;
}

- (id)copyWithIsWheelchairUser:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  HKDisplayTypeLocalization *localization;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v5 = -[HKDisplayType copy](self, "copy");
  *(_BYTE *)(v5 + 40) = v3;
  localization = self->_localization;
  -[HKDisplayType localizedStringSuffixForWheelchairUser:](self, "localizedStringSuffixForWheelchairUser:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKDisplayTypeLocalization copyWithLocalizedKeySuffix:](localization, "copyWithLocalizedKeySuffix:", v7);
  v9 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v8;

  return (id)v5;
}

- (NSString)displayTypeIdentifierString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  HKDisplayTypeIdentifierToString(-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownDisplayType(%ld)"), -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (id)color
{
  void *v2;
  void *v3;

  +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", -[HKDisplayType categoryIdentifier](self, "categoryIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)defaultValuePredicate
{
  return self->_defaultChartingPredicate;
}

- (id)chartingPredicateForTimeScope:(int64_t)a3
{
  NSDictionary *chartingPredicatesByTimeScope;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  chartingPredicatesByTimeScope = self->_chartingPredicatesByTimeScope;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](chartingPredicatesByTimeScope, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    if (v6)
    {
      v10 = v6;
    }
    else
    {
      -[HKDisplayType defaultValuePredicate](self, "defaultValuePredicate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v10;
  }

  return v9;
}

- (id)unitNameForValue:(id)a3 unitPreferenceController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "unitForDisplayType:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDisplayNameForUnit:value:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UIImage)detailImage
{
  UIImage *detailImage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImage *v10;
  UIImage *v11;

  detailImage = self->_detailImage;
  if (!detailImage)
  {
    -[HKDisplayType presentation](self, "presentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "detailImageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0DC3870];
      -[HKDisplayType presentation](self, "presentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "detailImageName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageNamed:inBundle:", v8, v9);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v11 = self->_detailImage;
      self->_detailImage = v10;

    }
    else
    {
      v7 = self->_detailImage;
      self->_detailImage = 0;
    }

    detailImage = self->_detailImage;
  }
  return detailImage;
}

- (HKSampleType)recordSampleType
{
  if (-[HKDisplayType isActivitySummary](self, "isActivitySummary"))
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 76);
  else
    -[HKDisplayType sampleType](self, "sampleType");
  return (HKSampleType *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isCharacteristic
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isActivitySummary
{
  return -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 100;
}

- (BOOL)isDocument
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (UIImage)listIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImage *v9;
  UIImage *listIcon;
  UIImage *v11;

  if (!self->_listIcon)
  {
    -[HKDisplayType presentation](self, "presentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "listIconImageNameOverride");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0DC3870];
      -[HKDisplayType presentation](self, "presentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "listIconImageNameOverride");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageNamed:inBundle:", v7, v8);
      v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
      listIcon = self->_listIcon;
      self->_listIcon = v9;

    }
    else
    {
      -[HKDisplayType displayCategory](self, "displayCategory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "listIcon");
      v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v7 = self->_listIcon;
      self->_listIcon = v11;
    }

  }
  return self->_listIcon;
}

- (NSString)listIconImageName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[HKDisplayType presentation](self, "presentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listIconImageNameOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[HKDisplayType displayCategory](self, "displayCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "listIconName");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSArray)secondaryDisplayCategories
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType secondaryCategoryIdentifiers](self, "secondaryCategoryIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HKDisplayType_secondaryDisplayCategories__block_invoke;
  v7[3] = &unk_1E9C3F9F0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

void __43__HKDisplayType_secondaryDisplayCategories__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", (int)objc_msgSend(a2, "intValue"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_displayTypeIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t displayTypeIdentifier;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    displayTypeIdentifier = self->_displayTypeIdentifier;
    v6 = displayTypeIdentifier == objc_msgSend(v4, "displayTypeIdentifier");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HKDisplayType;
  -[HKDisplayType description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKDisplayTypeIdentifierToString(self->_displayTypeIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HKValueRange)defaultAxisRangeOverride
{
  return self->_defaultAxisRangeOverride;
}

- (void)_setWheelchairUser:(BOOL)a3
{
  self->__wheelchairUser = a3;
}

- (id)generateLineSeriesWithColor:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  HKIntegerFormatter();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType generateLineSeriesWithColor:timeScope:valueAxisAnnotationFormatter:](self, "generateLineSeriesWithColor:timeScope:valueAxisAnnotationFormatter:", v6, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)generateLineSeriesWithColor:(id)a3 timeScope:(int64_t)a4 valueAxisAnnotationFormatter:(id)a5
{
  id v7;
  HKLineSeries *v8;
  HKGradientFillStyle *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HKLineSeriesPresentationStyle *v16;
  void *v17;
  HKLineSeriesPresentationStyle *v18;
  void *v19;
  void *v20;
  HKLineSeriesPointMarkerStyle *v21;
  void *v22;
  uint64_t v23;
  HKLineSeriesPresentationStyle *v24;
  void *v25;
  void *v26;
  int64_t v27;
  int64_t v28;
  HKLineSeriesPresentationStyle *v29;
  HKLineSeriesPointMarkerStyle *v30;
  HKLineSeriesPointMarkerStyle *v31;
  HKLineSeriesPointMarkerStyle *v32;
  void *v33;
  HKLineSeriesPointMarkerStyle *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  HKLineSeriesPresentationStyle *v46;
  void *v47;
  HKLineSeriesPresentationStyle *v48;
  HKLineSeriesPresentationStyle *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v44 = a5;
  v8 = objc_alloc_init(HKLineSeries);
  v9 = [HKGradientFillStyle alloc];
  HKHealthKeyColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWithAlphaComponent:", 0.3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthKeyColor();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKGradientFillStyle initWithFirstColor:secondColor:](v9, "initWithFirstColor:secondColor:", v11, v13);

  v46 = objc_alloc_init(HKLineSeriesPresentationStyle);
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v7, 2.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v46, "setStrokeStyle:", v15);

  -[HKLineSeriesPresentationStyle setWaveForm:](v46, "setWaveForm:", 0);
  v16 = objc_alloc_init(HKLineSeriesPresentationStyle);
  v47 = v7;
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v7, 2.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v16, "setStrokeStyle:", v17);

  -[HKLineSeriesPresentationStyle setWaveForm:](v16, "setWaveForm:", 0);
  v18 = objc_alloc_init(HKLineSeriesPresentationStyle);
  HKHealthKeyColor();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v19, 2.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v18, "setStrokeStyle:", v20);

  v21 = [HKLineSeriesPointMarkerStyle alloc];
  HKHealthKeyColor();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:](v21, "initWithColor:radius:style:", v22, 0, 4.0);

  v42 = (void *)v23;
  -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v18, "setPointMarkerStyle:", v23);
  v43 = (void *)v14;
  -[HKLineSeriesPresentationStyle setFillStyle:](v18, "setFillStyle:", v14);
  -[HKLineSeriesPresentationStyle setWaveForm:](v18, "setWaveForm:", 0);
  v24 = objc_alloc_init(HKLineSeriesPresentationStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartInactiveSeriesColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", 2.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v24, "setStrokeStyle:", v25);

  -[HKDisplayType chartingRules](self, "chartingRules");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setFlatLastValue:](v8, "setFlatLastValue:", objc_msgSend(v26, "lineChartFlatLastValueForTimeScope:", a4));
  -[HKLineSeries setExtendLastValue:](v8, "setExtendLastValue:", objc_msgSend(v26, "lineChartExtendLastValueForTimeScope:", a4));
  -[HKLineSeries setExtendFirstValue:](v8, "setExtendFirstValue:", objc_msgSend(v26, "lineChartExtendFirstValueForTimeScope:", a4));
  v27 = a4;
  v28 = a4;
  v29 = v24;
  if (objc_msgSend(v26, "lineChartUsesPointMarkerImageForTimeScope:", v28))
  {
    v30 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:]([HKLineSeriesPointMarkerStyle alloc], "initWithColor:radius:style:", v47, 1, 4.0);
    -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v46, "setPointMarkerStyle:", v30);
    -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v16, "setPointMarkerStyle:", v30);
    v31 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:]([HKLineSeriesPointMarkerStyle alloc], "initWithColor:radius:style:", v45, 1, 4.0);
    -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v29, "setPointMarkerStyle:", v31);
    v32 = [HKLineSeriesPointMarkerStyle alloc];
    HKHealthKeyColor();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:](v32, "initWithColor:radius:style:", v33, 0, HKUIOnePixel() + 5.0);

    -[HKLineSeries setSelectedPointMarkerStyle:](v8, "setSelectedPointMarkerStyle:", v34);
  }
  if (objc_msgSend(v26, "lineChartUsesValueAxisAnnotationForTimeScope:", v27))
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_roundedSystemFontWithSize:weight:", 18.0, *MEMORY[0x1E0DC1438]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:", v47, v35, 0, 2, v44);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLineSeriesPresentationStyle setAxisAnnotationStyle:](v46, "setAxisAnnotationStyle:", v36);
    -[HKLineSeriesPresentationStyle setAxisAnnotationStyle:](v16, "setAxisAnnotationStyle:", v36);
    -[HKLineSeriesPresentationStyle setAxisAnnotationStyle:](v18, "setAxisAnnotationStyle:", v36);

  }
  v50[0] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setUnhighlightedPresentationStyles:](v8, "setUnhighlightedPresentationStyles:", v37);

  v49 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setHighlightedPresentationStyles:](v8, "setHighlightedPresentationStyles:", v38);

  v48 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setSelectedPresentationStyles:](v8, "setSelectedPresentationStyles:", v39);

  -[HKLineSeries setInactivePresentationStyle:](v8, "setInactivePresentationStyle:", v29);
  return v8;
}

- (id)generateScatterPlotSeriesWithColor:(id)a3
{
  id v3;
  HKLineSeries *v4;
  HKLineSeriesPointMarkerStyle *v5;
  HKLineSeriesPointMarkerStyle *v6;
  void *v7;
  HKLineSeriesPointMarkerStyle *v8;
  HKLineSeriesPresentationStyle *v9;
  HKLineSeriesPresentationStyle *v10;
  void *v11;
  void *v12;
  HKLineSeriesPointMarkerStyle *v13;
  void *v14;
  HKLineSeriesPointMarkerStyle *v15;
  void *v16;
  HKLineSeriesPresentationStyle *v17;
  HKLineSeriesPointMarkerStyle *v18;
  HKLineSeriesPresentationStyle *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(HKLineSeries);
  v5 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:]([HKLineSeriesPointMarkerStyle alloc], "initWithColor:radius:style:", v3, 1, 4.0);

  v6 = [HKLineSeriesPointMarkerStyle alloc];
  HKHealthKeyColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:](v6, "initWithColor:radius:style:", v7, 0, 4.0);

  v9 = objc_alloc_init(HKLineSeriesPresentationStyle);
  -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v9, "setPointMarkerStyle:", v5);
  v10 = objc_alloc_init(HKLineSeriesPresentationStyle);
  -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v10, "setPointMarkerStyle:", v8);
  v21[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setUnhighlightedPresentationStyles:](v4, "setUnhighlightedPresentationStyles:", v11);

  v20 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setSelectedPresentationStyles:](v4, "setSelectedPresentationStyles:", v12);

  v13 = [HKLineSeriesPointMarkerStyle alloc];
  HKHealthKeyColor();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:](v13, "initWithColor:radius:style:", v14, 0, HKUIOnePixel() + 5.0);
  -[HKLineSeries setSelectedPointMarkerStyle:](v4, "setSelectedPointMarkerStyle:", v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartInactiveSeriesColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(HKLineSeriesPresentationStyle);
  v18 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:]([HKLineSeriesPointMarkerStyle alloc], "initWithColor:radius:style:", v16, 1, 4.0);
  -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v17, "setPointMarkerStyle:", v18);

  -[HKLineSeries setInactivePresentationStyle:](v4, "setInactivePresentationStyle:", v17);
  return v4;
}

- (id)generateDistributionSeriesWithColor:(id)a3 numberFormatter:(id)a4 hasMinMaxOverlay:(BOOL)a5
{
  return -[HKDisplayType generateDistributionSeriesWithColor:numberFormatter:lineWidth:hasMinMaxOverlay:](self, "generateDistributionSeriesWithColor:numberFormatter:lineWidth:hasMinMaxOverlay:", a3, a4, a5, 7.0);
}

- (id)generateDistributionSeriesWithColor:(id)a3 numberFormatter:(id)a4 lineWidth:(double)a5 hasMinMaxOverlay:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  HKQuantityDistributionSeries *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  id v28;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(HKQuantityDistributionSeries);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartInactiveSeriesColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineCap:", 1);
  -[HKQuantityDistributionSeries setInactiveStrokeStyle:](v11, "setInactiveStrokeStyle:", v13);
  v14 = v9;
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLineCap:", 1);
  -[HKQuantityDistributionSeries setUnselectedStrokeStyle:](v11, "setUnselectedStrokeStyle:", v15);
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v14, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLineCap:", 1);
  -[HKQuantityDistributionSeries setSelectedStrokeStyle:](v11, "setSelectedStrokeStyle:", v16);
  if (v6)
  {
    v17 = (void *)MEMORY[0x1E0DC1350];
    v18 = *MEMORY[0x1E0DC1448];
    v28 = v10;
    v19 = v14;
    objc_msgSend(v17, "hk_roundedSystemFontWithSize:weight:", 13.0, v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:", v19, v26, 1, 2);
    v27 = v12;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityDistributionSeries setMinMaxLabelStyle:](v11, "setMinMaxLabelStyle:", v20);
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_roundedSystemFontWithSize:weight:", 18.0, *MEMORY[0x1E0DC1438]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:", v19, v21, 1, 2, v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKQuantityDistributionSeries setMinMaxValueStyle:](v11, "setMinMaxValueStyle:", v22);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v23, a5 * 0.5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKQuantityDistributionSeries setMinMaxPointStyle:](v11, "setMinMaxPointStyle:", v24);
    v10 = v28;

    v12 = v27;
  }

  return v11;
}

- (id)cardioFitnessDataSourceWithUnitController:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  HKQuantityTypeDataSource *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v6 = a4;
  v7 = a3;
  v8 = -[HKQuantityTypeDataSource initWithUnitController:options:displayType:healthStore:]([HKQuantityTypeDataSource alloc], "initWithUnitController:options:displayType:healthStore:", v7, 2, self, v6);
  objc_msgSend(v7, "unitForDisplayType:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  objc_msgSend(v6, "biologicalSexWithError:", &v37);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v37;
  if (!v10)
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      -[HKPopulationNormsAbstractViewModel currentBiologicalSexSegmentIndex].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
  }
  v36 = v11;
  objc_msgSend(v6, "dateOfBirthComponentsWithError:", &v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v36;

  if (!v19)
  {
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      -[HKPopulationNormsAbstractViewModel currentAgeInYears].cold.1((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);
  }
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __84__HKDisplayType_DataSources__cardioFitnessDataSourceWithUnitController_healthStore___block_invoke;
  v32[3] = &unk_1E9C43E58;
  v33 = v9;
  v34 = v10;
  v35 = v19;
  v28 = v19;
  v29 = v10;
  v30 = v9;
  -[HKQuantityTypeDataSource setUserInfoCreationBlock:](v8, "setUserInfoCreationBlock:", v32);

  return v8;
}

HKInteractiveChartCardioFitnessData *__84__HKDisplayType_DataSources__cardioFitnessDataSourceWithUnitController_healthStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HKInteractiveChartCardioFitnessData *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int64_t v21;

  v3 = a2;
  v4 = objc_alloc_init(HKInteractiveChartCardioFitnessData);
  objc_msgSend(v3, "averageQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  v7 = v6;

  -[HKInteractiveChartSinglePointData setValue:](v4, "setValue:", v7);
  -[HKInteractiveChartSinglePointData setUnit:](v4, "setUnit:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "minQuantity");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v3, "maxQuantity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HKInteractiveChartSinglePointData setRepresentsRange:](v4, "setRepresentsRange:", 1);
      objc_msgSend(v3, "minQuantity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
      -[HKInteractiveChartSinglePointData setMinValue:](v4, "setMinValue:");

      objc_msgSend(v3, "maxQuantity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
      -[HKInteractiveChartSinglePointData setMaxValue:](v4, "setMaxValue:");

    }
  }
  -[HKInteractiveChartSinglePointData setRecordCount:](v4, "setRecordCount:", objc_msgSend(v3, "recordCount"));
  objc_msgSend(v3, "statisticsInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartSinglePointData setStatisticsInterval:](v4, "setStatisticsInterval:", v13);

  v14 = *(void **)(a1 + 40);
  if (v14 && *(_QWORD *)(a1 + 48))
  {
    v15 = objc_msgSend(v14, "biologicalSex");
    objc_msgSend(v3, "statisticsInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKCardioFitnessUtilities effectiveChartPointDateWithStatisticsInterval:startDate:endDate:](HKCardioFitnessUtilities, "effectiveChartPointDateWithStatisticsInterval:startDate:endDate:", v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(*(id *)(a1 + 48), "hk_ageWithCurrentDate:", v19);
    v21 = +[HKCardioFitnessUtilities cardioFitnessLevelForVO2Max:biologicalSex:age:](HKCardioFitnessUtilities, "cardioFitnessLevelForVO2Max:biologicalSex:age:", v15, v20, v7);
    -[HKInteractiveChartCardioFitnessData setBiologicalSex:](v4, "setBiologicalSex:", v15);
    -[HKInteractiveChartCardioFitnessData setAge:](v4, "setAge:", v20);
    -[HKInteractiveChartCardioFitnessData setClassification:](v4, "setClassification:", v21);
    -[HKInteractiveChartCardioFitnessData setSampleCount:](v4, "setSampleCount:", objc_msgSend(v3, "recordCount"));

  }
  return v4;
}

- (id)_audioLevelDataSourceForTypeIdentifier:(id)a3 withHealthStore:(id)a4 attenuatesExposureData:(BOOL)a5 unitController:(id)a6
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HKQuantityDistributionDataSource *v20;
  HKQuantityDistributionDataSource *v21;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (id)*MEMORY[0x1E0CB5C78];
  v13 = *MEMORY[0x1E0CB5CA8];
  v25[0] = *MEMORY[0x1E0CB5C78];
  v25[1] = v13;
  v25[2] = *MEMORY[0x1E0CB5C80];
  v14 = (void *)MEMORY[0x1E0C99D20];
  v15 = a6;
  v16 = a4;
  objc_msgSend(v14, "arrayWithObjects:count:", v25, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "containsObject:", v11) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKDisplayType+DataSources.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[validIdentifiers containsObject:audioExposureTypeIdentifier]"));

  }
  if (v12 == v11 && a5)
    v18 = 5;
  else
    v18 = 1;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [HKQuantityDistributionDataSource alloc];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __123__HKDisplayType_DataSources___audioLevelDataSourceForTypeIdentifier_withHealthStore_attenuatesExposureData_unitController___block_invoke;
  v24[3] = &unk_1E9C43E80;
  v24[4] = self;
  v21 = -[HKQuantityDistributionDataSource initWithQuantityType:unitController:healthStore:contextStyle:predicate:options:baseDisplayType:specificStartDate:specificEndDate:userInfoCreationBlock:](v20, "initWithQuantityType:unitController:healthStore:contextStyle:predicate:options:baseDisplayType:specificStartDate:specificEndDate:userInfoCreationBlock:", v19, v15, v16, 0, 0, v18, self, 0, 0, v24);

  return v21;
}

HKQuantityDistributionChartPointData *__123__HKDisplayType_DataSources___audioLevelDataSourceForTypeIdentifier_withHealthStore_attenuatesExposureData_unitController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HKQuantityDistributionChartPointData *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[HKQuantityDistributionChartPointData initWithDistributionData:unit:displayType:]([HKQuantityDistributionChartPointData alloc], "initWithDistributionData:unit:displayType:", v6, v5, *(_QWORD *)(a1 + 32));

  return v7;
}

- (id)_singleValueUserInfoBlockWithUnitController:(id)a3 displayType:(id)a4 statisticsOption:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD aBlock[4];
  id v14;
  id v15;
  unint64_t v16;

  v7 = a3;
  v8 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__HKDisplayType_DataSources___singleValueUserInfoBlockWithUnitController_displayType_statisticsOption___block_invoke;
  aBlock[3] = &unk_1E9C43EA8;
  v14 = v7;
  v15 = v8;
  v16 = a5;
  v9 = v8;
  v10 = v7;
  v11 = _Block_copy(aBlock);

  return v11;
}

HKInteractiveChartSinglePointData *__103__HKDisplayType_DataSources___singleValueUserInfoBlockWithUnitController_displayType_statisticsOption___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  HKInteractiveChartSinglePointData *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "unitForDisplayType:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 == 4)
  {
    objc_msgSend(v3, "minQuantity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 != 16)
    {
      objc_msgSend(v3, "averageQuantity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValueForUnit:", v4);
      v9 = v12;

      v10 = objc_msgSend(v3, "recordCount");
      goto LABEL_7;
    }
    objc_msgSend(v3, "sumQuantity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "doubleValueForUnit:", v4);
  v9 = v8;

  v10 = 1;
LABEL_7:
  v13 = objc_alloc_init(HKInteractiveChartSinglePointData);
  -[HKInteractiveChartSinglePointData setValue:](v13, "setValue:", v9);
  -[HKInteractiveChartSinglePointData setUnit:](v13, "setUnit:", v4);
  objc_msgSend(v3, "minQuantity");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v3, "maxQuantity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[HKInteractiveChartSinglePointData setRepresentsRange:](v13, "setRepresentsRange:", 1);
      objc_msgSend(v3, "minQuantity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValueForUnit:", v4);
      -[HKInteractiveChartSinglePointData setMinValue:](v13, "setMinValue:");

      objc_msgSend(v3, "maxQuantity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValueForUnit:", v4);
      -[HKInteractiveChartSinglePointData setMaxValue:](v13, "setMaxValue:");

      v10 = objc_msgSend(v3, "recordCount");
    }
  }
  -[HKInteractiveChartSinglePointData setRecordCount:](v13, "setRecordCount:", v10);
  objc_msgSend(v3, "statisticsInterval");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartSinglePointData setStatisticsInterval:](v13, "setStatisticsInterval:", v19);

  return v13;
}

+ (HKDisplayType)displayTypeWithIdentifier:(int64_t)a3
{
  void *v3;

  v3 = 0;
  switch(a3)
  {
    case 0:
      HKDisplayTypeIdentifierBodyMassIndexMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      HKDisplayTypeIdentifierBodyFatPercentageMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      HKDisplayTypeIdentifierHeightMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      HKDisplayTypeIdentifierBodyMassMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      HKDisplayTypeIdentifierLeanBodyMassMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      HKDisplayTypeIdentifierHeartRateMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      HKDisplayTypeIdentifierStepsMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      HKDisplayTypeIdentifierDistanceWalkingRunningMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      HKDisplayTypeIdentifierBasalEnergyBurnedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      HKDisplayTypeIdentifierActiveEnergyMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      HKDisplayTypeIdentifierFlightsClimbedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      HKDisplayTypeIdentifierNikeFuelMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      HKDisplayTypeIdentifierOxygenSaturationMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      HKDisplayTypeIdentifierBloodGlucoseMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      HKDisplayTypeIdentifierBloodAlcoholContentMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 19:
      HKDisplayTypeIdentifierPeripheralPerfusionIndexMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      HKDisplayTypeIdentifierDietaryFatTotalMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 21:
      HKDisplayTypeIdentifierDietaryFatPolyunsaturatedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 22:
      HKDisplayTypeIdentifierDietaryFatMonounsaturatedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 23:
      HKDisplayTypeIdentifierDietaryFatSaturatedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 24:
      HKDisplayTypeIdentifierDietaryCholesterolMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 25:
      HKDisplayTypeIdentifierDietarySodiumMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 26:
      HKDisplayTypeIdentifierDietaryCarbohydratesMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 27:
      HKDisplayTypeIdentifierDietaryFiberMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 28:
      HKDisplayTypeIdentifierDietarySugarMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 29:
      HKDisplayTypeIdentifierDietaryEnergyMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 30:
      HKDisplayTypeIdentifierDietaryProteinMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 31:
      HKDisplayTypeIdentifierDietaryVitaminAMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 32:
      HKDisplayTypeIdentifierDietaryVitaminB6Make();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 33:
      HKDisplayTypeIdentifierDietaryVitaminB12Make();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 34:
      HKDisplayTypeIdentifierDietaryVitaminCMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 35:
      HKDisplayTypeIdentifierDietaryVitaminDMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 36:
      HKDisplayTypeIdentifierDietaryVitaminEMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 37:
      HKDisplayTypeIdentifierDietaryVitaminKMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 38:
      HKDisplayTypeIdentifierDietaryCalciumMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 39:
      HKDisplayTypeIdentifierDietaryIronMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 40:
      HKDisplayTypeIdentifierDietaryThiaminMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 41:
      HKDisplayTypeIdentifierDietaryRiboflavinMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 42:
      HKDisplayTypeIdentifierDietaryNiacinMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 43:
      HKDisplayTypeIdentifierDietaryFolateMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 44:
      HKDisplayTypeIdentifierDietaryBiotinMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 45:
      HKDisplayTypeIdentifierDietaryPantothenicAcidMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 46:
      HKDisplayTypeIdentifierDietaryPhosphorusMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 47:
      HKDisplayTypeIdentifierDietaryIodineMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 48:
      HKDisplayTypeIdentifierDietaryMagnesiumMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 49:
      HKDisplayTypeIdentifierDietaryZincMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 50:
      HKDisplayTypeIdentifierDietarySeleniumMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 51:
      HKDisplayTypeIdentifierDietaryCopperMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 52:
      HKDisplayTypeIdentifierDietaryManganeseMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 53:
      HKDisplayTypeIdentifierDietaryChromiumMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 54:
      HKDisplayTypeIdentifierDietaryMolybdenumMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 55:
      HKDisplayTypeIdentifierDietaryChlorideMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 56:
      HKDisplayTypeIdentifierDietaryPotassiumMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 57:
      HKDisplayTypeIdentifierNumberOfTimesFallenMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 58:
      HKDisplayTypeIdentifierElectrodermalActivityMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 60:
      HKDisplayTypeIdentifierInhalerUsageMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 61:
      HKDisplayTypeIdentifierRespiratoryRateMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 62:
      HKDisplayTypeIdentifierBodyTemperatureMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 63:
      HKDisplayTypeIdentifierSleepAnalysisMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 64:
      HKDisplayTypeIdentifierBiologicalSexMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 65:
      HKDisplayTypeIdentifierDateOfBirthMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 66:
      HKDisplayTypeIdentifierBloodTypeMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 70:
      HKDisplayTypeIdentifierAppleStandHourMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 71:
      HKDisplayTypeIdentifierForcedVitalCapacityMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 72:
      HKDisplayTypeIdentifierForcedExpiratoryVolume1Make();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 73:
      HKDisplayTypeIdentifierPeakExpiratoryFlowRateMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 75:
      HKDisplayTypeIdentifierAppleExerciseTimeMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 78:
      HKDisplayTypeIdentifierDietaryCaffeineMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 79:
      HKDisplayTypeIdentifierWorkoutMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 80:
      HKDisplayTypeIdentifierBloodPressureMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 83:
      HKDisplayTypeIdentifierCyclingDistanceMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 87:
      HKDisplayTypeIdentifierDietaryWaterMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 88:
      HKDisplayTypeIdentifierFitzpatrickSkinTypeMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 89:
      HKDisplayTypeIdentifierUVExposureMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 90:
      HKDisplayTypeIdentifierBasalBodyTemperatureMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 91:
      HKDisplayTypeIdentifierCervicalMucusQualityMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 92:
      HKDisplayTypeIdentifierOvulationTestResultMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 95:
      HKDisplayTypeIdentifierMenstruationMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 96:
      HKDisplayTypeIdentifierIntermenstrualBleedingMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 97:
      HKDisplayTypeIdentifierSexualActivityMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 99:
      HKDisplayTypeIdentifierMindfulSessionMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 100:
      HKDisplayTypeIdentifierActivitySummaryMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 101:
      HKDisplayTypeIdentifierPushCountMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 102:
      HKDisplayTypeIdentifierLocationSeriesMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 103:
      HKDisplayTypeIdentifierWheelchairUseMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 107:
      HKDisplayTypeIdentifierCDADocumentMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 110:
      HKDisplayTypeIdentifierSwimmingDistanceMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 111:
      HKDisplayTypeIdentifierSwimmingStrokesMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 113:
      HKDisplayTypeIdentifierWheelchairDistanceMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 114:
      HKDisplayTypeIdentifierWaistCircumferenceMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 118:
      HKDisplayTypeIdentifierRestingHeartRateMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 119:
      HKDisplayTypeIdentifierHeartbeatSeriesMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 124:
      HKDisplayTypeIdentifierVO2MaxMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 125:
      HKDisplayTypeIdentifierInsulinDeliveryMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 137:
      HKDisplayTypeIdentifierWalkingHeartRateAverageMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 138:
      HKDisplayTypeIdentifierDownhillSnowSportsDistanceMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 139:
      HKDisplayTypeIdentifierHeartRateVariabilityMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 140:
      HKDisplayTypeIdentifierTachycardiaEventMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 144:
      HKDisplayTypeIdentifierElectrocardiogramMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 145:
      HKDisplayTypeIdentifierAudiogramMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 147:
      HKDisplayTypeIdentifierBradycardiaEventMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 149:
      HKDisplayTypeIdentifierAllergyRecordMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 150:
      HKDisplayTypeIdentifierConditionRecordMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 151:
      HKDisplayTypeIdentifierImmunizationRecordMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 152:
      HKDisplayTypeIdentifierLabResultRecordMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 153:
      HKDisplayTypeIdentifierMedicationRecordMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 154:
      HKDisplayTypeIdentifierProcedureRecordMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 155:
      HKDisplayTypeIdentifierVitalSignRecordMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 156:
      HKDisplayTypeIdentifierAtrialFibrillationEventMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 157:
      HKDisplayTypeIdentifierAbdominalCrampsMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 158:
      HKDisplayTypeIdentifierBreastPainMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 159:
      HKDisplayTypeIdentifierBloatingMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 160:
      HKDisplayTypeIdentifierHeadacheMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 161:
      HKDisplayTypeIdentifierAcneMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 162:
      HKDisplayTypeIdentifierLowerBackPainMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 163:
      HKDisplayTypeIdentifierPelvicPainMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 164:
      HKDisplayTypeIdentifierMoodChangesMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 165:
      HKDisplayTypeIdentifierConstipationMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 166:
      HKDisplayTypeIdentifierDiarrheaMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 167:
      HKDisplayTypeIdentifierFatigueMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 168:
      HKDisplayTypeIdentifierNauseaMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 169:
      HKDisplayTypeIdentifierSleepChangesMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 170:
      HKDisplayTypeIdentifierAppetiteChangesMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 171:
      HKDisplayTypeIdentifierHotFlashesMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 172:
      HKDisplayTypeIdentifierEnvironmentalAudioExposureMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 173:
      HKDisplayTypeIdentifierHeadphoneAudioExposureMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 177:
      HKDisplayTypeIdentifierActivityMoveModeMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 178:
      HKDisplayTypeIdentifierEnvironmentalAudioExposureEventMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 179:
      HKDisplayTypeIdentifierAppleMoveTimeMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 182:
      HKDisplayTypeIdentifierWalkingDoubleSupportPercentageMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 183:
      HKDisplayTypeIdentifierSixMinuteWalkTestDistanceMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 186:
      HKDisplayTypeIdentifierAppleStandTimeMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 187:
      HKDisplayTypeIdentifierWalkingSpeedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 188:
      HKDisplayTypeIdentifierWalkingStepLengthMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 189:
      HKDisplayTypeIdentifierToothbrushingEventMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 191:
      HKDisplayTypeIdentifierPregnancyMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 192:
      HKDisplayTypeIdentifierLactationMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 193:
      HKDisplayTypeIdentifierContraceptiveMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 194:
      HKDisplayTypeIdentifierWalkingAsymmetryPercentageMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 195:
      HKDisplayTypeIdentifierStairAscentSpeedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 196:
      HKDisplayTypeIdentifierStairDescentSpeedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 197:
      HKDisplayTypeIdentifierSleepDurationGoalMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 198:
      HKDisplayTypeIdentifierSleepScheduleMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 199:
      HKDisplayTypeIdentifierHeadphoneAudioExposureEventMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 201:
      HKDisplayTypeIdentifierRapidPoundingOrFlutteringHeartbeatMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 202:
      HKDisplayTypeIdentifierSkippedHeartbeatMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 203:
      HKDisplayTypeIdentifierFeverMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 204:
      HKDisplayTypeIdentifierShortnessOfBreathMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 205:
      HKDisplayTypeIdentifierChestTightnessOrPainMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 206:
      HKDisplayTypeIdentifierFaintingMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 207:
      HKDisplayTypeIdentifierDizzinessMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 217:
      HKDisplayTypeIdentifierInsuranceRecordMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 218:
      HKDisplayTypeIdentifierCardioFitnessMedicationsUseMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 220:
      HKDisplayTypeIdentifierVomitingMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 221:
      HKDisplayTypeIdentifierHeartburnMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 222:
      HKDisplayTypeIdentifierCoughingMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 223:
      HKDisplayTypeIdentifierWheezingMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 224:
      HKDisplayTypeIdentifierSoreThroatMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 225:
      HKDisplayTypeIdentifierCongestionMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 226:
      HKDisplayTypeIdentifierRunnyNoseMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 229:
      HKDisplayTypeIdentifierVaginalDrynessMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 230:
      HKDisplayTypeIdentifierNightSweatsMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 231:
      HKDisplayTypeIdentifierChillsMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 232:
      HKDisplayTypeIdentifierHairLossMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 233:
      HKDisplayTypeIdentifierDrySkinMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 234:
      HKDisplayTypeIdentifierBladderIncontinenceMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 235:
      HKDisplayTypeIdentifierMemoryLapseMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 236:
      HKDisplayTypeIdentifierLowCardioFitnessEventMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 237:
      HKDisplayTypeIdentifierHandwashingEventMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 240:
      HKDisplayTypeIdentifierGeneralizedBodyAcheMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 241:
      HKDisplayTypeIdentifierLossOfSmellMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 242:
      HKDisplayTypeIdentifierLossOfTasteMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 243:
      HKDisplayTypeIdentifierPregnancyTestResultMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 244:
      HKDisplayTypeIdentifierProgesteroneTestResultMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 248:
      HKDisplayTypeIdentifierAtrialFibrillationBurdenMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 249:
      HKDisplayTypeIdentifierAppleWalkingSteadinessMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 250:
      HKDisplayTypeIdentifierAppleWalkingSteadinessEventMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 251:
      HKDisplayTypeIdentifierNumberOfAlcoholicBeveragesMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 256:
      HKDisplayTypeIdentifierAppleSleepingWristTemperatureMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 257:
      HKDisplayTypeIdentifierVisionPrescriptionMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 258:
      HKDisplayTypeIdentifierRunningStrideLengthMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 259:
      HKDisplayTypeIdentifierRunningVerticalOscillationMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 260:
      HKDisplayTypeIdentifierRunningGroundContactTimeMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 262:
      HKDisplayTypeIdentifierPersistentIntermenstrualBleedingMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 263:
      HKDisplayTypeIdentifierProlongedMenstrualPeriodsMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 264:
      HKDisplayTypeIdentifierIrregularMenstrualCyclesMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 265:
      HKDisplayTypeIdentifierInfrequentMenstrualCyclesMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 266:
      HKDisplayTypeIdentifierHeartRateRecoveryMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 268:
      HKDisplayTypeIdentifierClinicalNoteRecordMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 269:
      HKDisplayTypeIdentifierUnderwaterDepthMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 270:
      HKDisplayTypeIdentifierRunningPowerMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 272:
      HKDisplayTypeIdentifierEnvironmentalSoundReductionMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 273:
      HKDisplayTypeIdentifierMedicationDoseEventMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 274:
      HKDisplayTypeIdentifierRunningSpeedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 275:
      HKDisplayTypeIdentifierAppleSleepingBreathingDisturbancesMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 276:
      HKDisplayTypeIdentifierSleepApneaEventMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 277:
      HKDisplayTypeIdentifierWaterTemperatureMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 279:
      HKDisplayTypeIdentifierTimeInDaylightMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 280:
      HKDisplayTypeIdentifierCyclingPowerMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 281:
      HKDisplayTypeIdentifierCyclingSpeedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 282:
      HKDisplayTypeIdentifierCyclingCadenceMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 283:
      HKDisplayTypeIdentifierCyclingFunctionalThresholdPowerMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 284:
      HKDisplayTypeIdentifierStateOfMindMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 286:
      HKDisplayTypeIdentifierPhysicalEffortMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 287:
      HKDisplayTypeIdentifierGAD7Make();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 288:
      HKDisplayTypeIdentifierPHQ9Make();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 294:
      HKDisplayTypeIdentifierPaddleSportsDistanceMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 295:
      HKDisplayTypeIdentifierRowingDistanceMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 296:
      HKDisplayTypeIdentifierCrossCountrySkiingDistanceMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 297:
      HKDisplayTypeIdentifierSkatingSportsDistanceMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 298:
      HKDisplayTypeIdentifierEstimatedWorkoutEffortScoreMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 301:
      HKDisplayTypeIdentifierRowingSpeedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 302:
      HKDisplayTypeIdentifierCrossCountrySkiingSpeedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 303:
      HKDisplayTypeIdentifierPaddleSportsSpeedMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 304:
      HKDisplayTypeIdentifierWorkoutEffortScoreMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 305:
      HKDisplayTypeIdentifierAppleBalanceMetricsMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 313:
      HKDisplayTypeIdentifierBleedingDuringPregnancyMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 314:
      HKDisplayTypeIdentifierBleedingAfterPregnancyMake();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return (HKDisplayType *)v3;
  }
  return (HKDisplayType *)v3;
}

- (BOOL)allowsManualEntry
{
  uint64_t v2;
  BOOL result;

  v2 = -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier");
  result = 0;
  if (v2 > 235)
  {
    if (((unint64_t)(v2 - 236) > 0x34 || ((1 << (v2 + 20)) & 0x1801903C107001) == 0)
      && v2 != 305
      && v2 != 313)
    {
      return 1;
    }
  }
  else if (((unint64_t)(v2 - 137) > 0x3E || ((1 << (v2 + 119)) & 0x41C2061800080489) == 0)
         && ((unint64_t)(v2 - 70) > 0x25 || ((1 << (v2 - 70)) & 0x2040000021) == 0)
         && v2 != 13)
  {
    return 1;
  }
  return result;
}

- (id)localizedStringSuffixForWheelchairUser:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  v4 = -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier");
  v5 = (unint64_t)(v4 - 70) > 0x1E || ((1 << (v4 - 70)) & 0x40000021) == 0;
  if (v5 && v4 != 186)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6780], "localizationStringSuffixForWheelchairUser:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (UIImage)displayTypeIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier") == 13)
  {
    v2 = (void *)MEMORY[0x1E0DC3870];
    HKHealthUIFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("healthdata_glyph_nikeplus"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_flatImageWithColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (UIImage *)v6;
}

- (UIImage)shareIcon
{
  int64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;

  v3 = -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier");
  if (v3 == 13)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    HKHealthUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("sharedata_glyph_nikeplus");
  }
  else
  {
    if (v3 != 100)
    {
      -[HKDisplayType displayCategory](self, "displayCategory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shareIcon");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v4 = (void *)MEMORY[0x1E0DC3870];
    HKHealthUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("sharedata_glyph_activity");
  }
  objc_msgSend(v4, "imageNamed:inBundle:", v6, v5);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;

  return (UIImage *)v8;
}

- (id)hk_enumeratedValueLabels
{
  return +[HKDisplayType hk_enumeratedValueLabelsWithDisplayTypeIdentifier:](HKDisplayType, "hk_enumeratedValueLabelsWithDisplayTypeIdentifier:", -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier"));
}

+ (id)hk_enumeratedValueLabelsWithDisplayTypeIdentifier:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  _QWORD *v38;
  void *v39;
  void **v40;
  void **v41;
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
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[6];
  _QWORD v71[6];
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[5];
  _QWORD v77[5];
  _QWORD v78[4];
  _QWORD v79[4];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[5];
  _QWORD v83[5];
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD v88[4];
  _QWORD v89[4];
  void *v90;
  void *v91;
  _QWORD v92[7];
  _QWORD v93[7];
  _QWORD v94[5];
  _QWORD v95[5];
  _QWORD v96[4];
  _QWORD v97[4];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[4];
  _QWORD v101[4];
  _QWORD v102[5];
  _QWORD v103[7];

  v3 = 0;
  v103[5] = *MEMORY[0x1E0C80C00];
  if (a3 <= 156)
  {
    if (a3 <= 90)
    {
      if (a3 == 63)
      {
        v70[0] = &unk_1E9CECE60;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("IN_BED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = v15;
        v70[1] = &unk_1E9CECE78;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("ASLEEP_UNSPECIFIED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
        v63 = objc_claimAutoreleasedReturnValue();
        v71[1] = v63;
        v70[2] = &unk_1E9CECE90;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("AWAKE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v71[2] = v51;
        v70[3] = &unk_1E9CECEA8;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("ASLEEP_CORE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v71[3] = v53;
        v70[4] = &unk_1E9CECEC0;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("ASLEEP_DEEP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v71[4] = v55;
        v70[5] = &unk_1E9CECED8;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("ASLEEP_REM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v71[5] = v57;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 6);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v67;
        v50 = (void *)v63;
LABEL_41:

        goto LABEL_6;
      }
      if (a3 != 70)
        return v3;
      v98[0] = &unk_1E9CECE60;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6780], "localizationStringAdditionForWheelchairUser");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("STOOD"), "stringByAppendingString:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v99[0] = v19;
      v98[1] = &unk_1E9CECE78;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("IDLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v99[1] = v21;
      v22 = (void *)MEMORY[0x1E0C99D80];
      v23 = v99;
      v24 = v98;
      v25 = 2;
LABEL_32:
      objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_39:
      goto LABEL_7;
    }
    if (a3 != 91)
    {
      if (a3 != 92)
      {
        if (a3 != 95)
          return v3;
        v82[0] = &unk_1E9CECE78;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("UNSPECIFIED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v4 = objc_claimAutoreleasedReturnValue();
        v83[0] = v4;
        v82[1] = &unk_1E9CECE90;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("LIGHT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v83[1] = v5;
        v82[2] = &unk_1E9CECEA8;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MEDIUM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v83[2] = v7;
        v82[3] = &unk_1E9CECEC0;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("HEAVY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v83[3] = v9;
        v82[4] = &unk_1E9CECED8;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MENSTRUAL_FLOW_NONE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v83[4] = v11;
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = v83;
        v14 = v82;
        goto LABEL_5;
      }
      v78[0] = &unk_1E9CECE78;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("OVULATION_TEST_RESULT_NEGATIVE_LOW"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = v15;
      v78[1] = &unk_1E9CECE90;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OVULATION_TEST_RESULT_LUTEINIZING_HORMONE_SURGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v79[1] = v19;
      v78[2] = &unk_1E9CECEA8;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("OVULATION_TEST_RESULT_INDETERMINATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v79[2] = v33;
      v78[3] = &unk_1E9CECEC0;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("OVULATION_TEST_RESULT_ESTROGEN_SURGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v79[3] = v35;
      v36 = (void *)MEMORY[0x1E0C99D80];
      v37 = v79;
      v38 = v78;
LABEL_38:
      objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_39;
    }
    v94[0] = &unk_1E9CECE78;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("DRY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v4 = objc_claimAutoreleasedReturnValue();
    v95[0] = v4;
    v94[1] = &unk_1E9CECE90;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("STICKY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v5;
    v94[2] = &unk_1E9CECEA8;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CREAMY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2] = v7;
    v94[3] = &unk_1E9CECEC0;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("WATERY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v95[3] = v9;
    v94[4] = &unk_1E9CECED8;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("EGG_WHITE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v95[4] = v11;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = v95;
    v14 = v94;
  }
  else
  {
    if (a3 <= 286)
    {
      switch(a3)
      {
        case 157:
        case 158:
        case 159:
        case 160:
        case 161:
        case 162:
        case 163:
        case 165:
        case 166:
        case 167:
        case 168:
        case 171:
        case 201:
        case 202:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 220:
        case 221:
        case 222:
        case 223:
        case 224:
        case 225:
        case 226:
        case 229:
        case 230:
        case 231:
        case 232:
        case 233:
        case 234:
        case 235:
        case 240:
        case 241:
        case 242:
          v102[0] = &unk_1E9CECE60;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("SEVERITY_UNSPECIFIED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v4 = objc_claimAutoreleasedReturnValue();
          v103[0] = v4;
          v102[1] = &unk_1E9CECE78;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("SEVERITY_NOT_PRESENT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v103[1] = v5;
          v102[2] = &unk_1E9CECE90;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SEVERITY_MILD"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v103[2] = v7;
          v102[3] = &unk_1E9CECEA8;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SEVERITY_MODERATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v103[3] = v9;
          v102[4] = &unk_1E9CECEC0;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SEVERITY_SEVERE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v103[4] = v11;
          v12 = (void *)MEMORY[0x1E0C99D80];
          v13 = v103;
          v14 = v102;
          goto LABEL_5;
        case 164:
        case 169:
          v80[0] = &unk_1E9CECE60;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PRESENCE_PRESENT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v80[1] = &unk_1E9CECE78;
          v81[0] = v15;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("PRESENCE_NOT_PRESENT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v81[1] = v27;
          v28 = (void *)MEMORY[0x1E0C99D80];
          v29 = v81;
          v30 = v80;
          v31 = 2;
          goto LABEL_34;
        case 170:
          v100[0] = &unk_1E9CECE60;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("APPETITE_CHANGES_UNSPECIFIED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v101[0] = v15;
          v100[1] = &unk_1E9CECE78;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("APPETITE_CHANGES_NO_CHANGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v101[1] = v19;
          v100[2] = &unk_1E9CECE90;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("APPETITE_CHANGES_DECREASED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v101[2] = v33;
          v100[3] = &unk_1E9CECEA8;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("APPETITE_CHANGES_INCREASED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v101[3] = v35;
          v36 = (void *)MEMORY[0x1E0C99D80];
          v37 = v101;
          v38 = v100;
          goto LABEL_38;
        case 178:
          v90 = &unk_1E9CECE78;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NOISE_NOTIFICATION_LOUD_ENVIRONMENT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v15;
          v39 = (void *)MEMORY[0x1E0C99D80];
          v40 = &v91;
          v41 = &v90;
          goto LABEL_28;
        case 193:
          v92[0] = &unk_1E9CECE78;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("CONTRACEPTIVE_UNSPECIFIED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v62 = objc_claimAutoreleasedReturnValue();
          v93[0] = v62;
          v92[1] = &unk_1E9CECE90;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("CONTRACEPTIVE_IMPLANT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v60 = objc_claimAutoreleasedReturnValue();
          v93[1] = v60;
          v92[2] = &unk_1E9CECEA8;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("CONTRACEPTIVE_INJECTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v93[2] = v58;
          v92[3] = &unk_1E9CECEC0;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("CONTRACEPTIVE_INTRAUTERINE_DEVICE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v93[3] = v43;
          v92[4] = &unk_1E9CECED8;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("CONTRACEPTIVE_INTRAVAGINAL_RING"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v93[4] = v45;
          v92[5] = &unk_1E9CECEF0;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("CONTRACEPTIVE_ORAL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v93[5] = v47;
          v92[6] = &unk_1E9CECF08;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v66;
          objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("CONTRACEPTIVE_PATCH"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v93[6] = v49;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 7);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = (void *)v62;
          v50 = (void *)v60;
          goto LABEL_41;
        case 199:
          v86 = &unk_1E9CECE78;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("HEADPHONE_NOTIFICATION_LOUD_ENVIRONMENT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = v15;
          v39 = (void *)MEMORY[0x1E0C99D80];
          v40 = &v87;
          v41 = &v86;
          goto LABEL_28;
        case 236:
          v84 = &unk_1E9CECE78;
          HKHealthKitFrameworkBundle();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_EVENT_LOW_THRESHOLD"), &stru_1E9C4C428, CFSTR("Localizable-CardioFitness"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v15;
          v39 = (void *)MEMORY[0x1E0C99D80];
          v40 = &v85;
          v41 = &v84;
LABEL_28:
          objc_msgSend(v39, "dictionaryWithObjects:forKeys:count:", v40, v41, 1);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_7;
        case 243:
          v74[0] = &unk_1E9CECE78;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PREGNANCY_TEST_RESULT_NEGATIVE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v75[0] = v15;
          v74[1] = &unk_1E9CECE90;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PREGNANCY_TEST_RESULT_POSITIVE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v75[1] = v19;
          v74[2] = &unk_1E9CECEA8;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("PREGNANCY_TEST_RESULT_INDETERMINATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v75[2] = v21;
          v22 = (void *)MEMORY[0x1E0C99D80];
          v23 = v75;
          v24 = v74;
          goto LABEL_31;
        case 244:
          v72[0] = &unk_1E9CECE78;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PROGESTERONE_TEST_RESULT_NEGATIVE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v73[0] = v15;
          v72[1] = &unk_1E9CECE90;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PROGESTERONE_TEST_RESULT_POSITIVE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v73[1] = v19;
          v72[2] = &unk_1E9CECEA8;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("PROGESTERONE_TEST_RESULT_INDETERMINATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v73[2] = v21;
          v22 = (void *)MEMORY[0x1E0C99D80];
          v23 = v73;
          v24 = v72;
LABEL_31:
          v25 = 3;
          goto LABEL_32;
        case 250:
          v96[0] = &unk_1E9CECE78;
          +[HKMobilityUtilities localizedTitleForWalkingSteadinessEventCategoryValue:](HKMobilityUtilities, "localizedTitleForWalkingSteadinessEventCategoryValue:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v97[0] = v16;
          v96[1] = &unk_1E9CECE90;
          +[HKMobilityUtilities localizedTitleForWalkingSteadinessEventCategoryValue:](HKMobilityUtilities, "localizedTitleForWalkingSteadinessEventCategoryValue:", 2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v97[1] = v15;
          v96[2] = &unk_1E9CECEA8;
          +[HKMobilityUtilities localizedTitleForWalkingSteadinessEventCategoryValue:](HKMobilityUtilities, "localizedTitleForWalkingSteadinessEventCategoryValue:", 3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v97[2] = v26;
          v96[3] = &unk_1E9CECEC0;
          +[HKMobilityUtilities localizedTitleForWalkingSteadinessEventCategoryValue:](HKMobilityUtilities, "localizedTitleForWalkingSteadinessEventCategoryValue:", 4);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v97[3] = v27;
          v28 = (void *)MEMORY[0x1E0C99D80];
          v29 = v97;
          v30 = v96;
          v31 = 4;
LABEL_34:
          objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, v31);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_7;
        default:
          return v3;
      }
    }
    if ((unint64_t)(a3 - 313) >= 2)
    {
      if (a3 != 287)
      {
        if (a3 != 288)
          return v3;
        v76[0] = &unk_1E9CECE78;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("PHQ9_RISK_NONE_TO_MINIMAL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
        v4 = objc_claimAutoreleasedReturnValue();
        v77[0] = v4;
        v76[1] = &unk_1E9CECE90;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("PHQ9_RISK_MILD"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v77[1] = v5;
        v76[2] = &unk_1E9CECEA8;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PHQ9_RISK_MODERATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v77[2] = v7;
        v76[3] = &unk_1E9CECEC0;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PHQ9_RISK_MODERATELY_SEVERE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v77[3] = v9;
        v76[4] = &unk_1E9CECED8;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PHQ9_RISK_SEVERE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v77[4] = v11;
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = v77;
        v14 = v76;
        goto LABEL_5;
      }
      v88[0] = &unk_1E9CECE78;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("GAD7_RISK_NONE_TO_MINIMAL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = v15;
      v88[1] = &unk_1E9CECE90;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("GAD7_RISK_MILD"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v89[1] = v19;
      v88[2] = &unk_1E9CECEA8;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("GAD7_RISK_MODERATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v89[2] = v33;
      v88[3] = &unk_1E9CECEC0;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("GAD7_RISK_SEVERE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v89[3] = v35;
      v36 = (void *)MEMORY[0x1E0C99D80];
      v37 = v89;
      v38 = v88;
      goto LABEL_38;
    }
    v68[0] = &unk_1E9CECE78;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("VAGINAL_BLEEDING_UNSPECIFIED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v4 = objc_claimAutoreleasedReturnValue();
    v69[0] = v4;
    v68[1] = &unk_1E9CECE90;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("VAGINAL_BLEEDING_LIGHT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v5;
    v68[2] = &unk_1E9CECEA8;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("VAGINAL_BLEEDING_MEDIUM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v7;
    v68[3] = &unk_1E9CECEC0;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("VAGINAL_BLEEDING_HEAVY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v9;
    v68[4] = &unk_1E9CECED8;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("VAGINAL_BLEEDING_NONE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v69[4] = v11;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = v69;
    v14 = v68;
  }
LABEL_5:
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)v4;
  v16 = v65;

LABEL_6:
LABEL_7:

  return v3;
}

- (id)hk_valueOrderForStackedCharts
{
  uint64_t v2;
  uint64_t v3;
  id result;

  v2 = -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier");
  if (v2 <= 156)
  {
    if (v2 <= 90)
    {
      if (v2 == 63)
        return &unk_1E9CEA640;
      if (v2 == 70)
        return &unk_1E9CEA550;
      return &unk_1E9CEA658;
    }
    if (v2 == 91)
      return &unk_1E9CEA568;
    if (v2 == 92)
      return &unk_1E9CEA5E0;
    if (v2 != 95)
      return &unk_1E9CEA658;
    return &unk_1E9CEA5B0;
  }
  if (v2 > 286)
  {
    if ((unint64_t)(v2 - 313) >= 2)
    {
      if (v2 == 287)
        return &unk_1E9CEA598;
      if (v2 == 288)
        return &unk_1E9CEA5F8;
      return &unk_1E9CEA658;
    }
    return &unk_1E9CEA5B0;
  }
  v3 = v2 - 157;
  result = &unk_1E9CEA520;
  switch(v3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 14:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 83:
    case 84:
    case 85:
      return result;
    case 7:
    case 12:
      result = &unk_1E9CEA5C8;
      break;
    case 13:
      result = &unk_1E9CEA538;
      break;
    case 36:
      result = &unk_1E9CEA580;
      break;
    case 86:
      result = &unk_1E9CEA610;
      break;
    case 87:
      result = &unk_1E9CEA628;
      break;
    default:
      return &unk_1E9CEA658;
  }
  return result;
}

- (unint64_t)hk_interactiveChartOptions
{
  uint64_t v2;
  unint64_t result;

  v2 = -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier");
  result = 2048;
  if (v2 > 94)
  {
    switch(v2)
    {
      case 145:
        return 0x200000;
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 174:
      case 175:
      case 176:
      case 177:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 227:
      case 228:
      case 236:
      case 237:
      case 238:
      case 239:
      case 245:
      case 246:
      case 247:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
      case 257:
      case 261:
      case 262:
      case 263:
      case 264:
      case 265:
      case 266:
      case 267:
      case 268:
      case 271:
      case 273:
      case 276:
      case 278:
      case 279:
      case 285:
      case 286:
      case 289:
      case 290:
      case 291:
      case 292:
      case 293:
      case 294:
      case 295:
      case 296:
      case 297:
      case 298:
      case 299:
      case 300:
      case 304:
      case 306:
      case 307:
      case 308:
      case 309:
      case 310:
      case 311:
      case 312:
        return 0;
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 287:
      case 288:
      case 313:
      case 314:
        return result;
      case 172:
      case 173:
      case 178:
      case 258:
      case 259:
      case 260:
      case 269:
      case 270:
      case 272:
      case 274:
      case 277:
      case 280:
      case 281:
      case 282:
      case 283:
      case 301:
      case 302:
      case 303:
        return 128;
      case 191:
      case 192:
      case 284:
        return 1024;
      case 193:
        return 3072;
      case 248:
        return 99840;
      case 249:
      case 275:
        return 33792;
      case 256:
        return 1536;
      case 305:
        return 512;
      default:
        if (v2 == 95)
          return result;
        if (v2 == 125)
          return 512;
        return 0;
    }
  }
  if (v2 > 90)
  {
    if ((unint64_t)(v2 - 91) >= 2)
      return 0;
  }
  else
  {
    if (v2 != 5 && v2 != 61)
    {
      if (v2 == 63)
        return 512;
      return 0;
    }
    return 128;
  }
  return result;
}

- (id)hk_healthQueryChartCacheDataSourceForTimeScope:(int64_t)a3 healthStore:(id)a4 unitController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HKQuantityDistributionDataSource *v13;
  uint64_t v14;
  void *v16;
  void *v17;

  v8 = a4;
  v9 = a5;
  v10 = 0;
  switch(-[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier"))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 62:
    case 71:
    case 72:
    case 73:
    case 75:
    case 78:
    case 83:
    case 87:
    case 89:
    case 90:
    case 101:
    case 110:
    case 111:
    case 113:
    case 114:
    case 118:
    case 124:
    case 137:
    case 138:
    case 139:
    case 179:
    case 183:
    case 186:
    case 194:
    case 251:
    case 258:
    case 259:
    case 260:
    case 266:
    case 270:
    case 274:
    case 275:
    case 277:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 294:
    case 295:
    case 296:
    case 297:
    case 298:
    case 301:
    case 302:
    case 303:
    case 304:
      -[HKDisplayType objectType](self, "objectType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HKInteractiveChartDataSourceQuantityType(self, v11, a3, v8, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 5:
    case 15:
    case 61:
    case 182:
    case 187:
    case 188:
    case 195:
    case 196:
    case 286:
      -[HKDisplayType objectType](self, "objectType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HKQuantityDistributionDataSource initWithQuantityType:unitController:healthStore:contextStyle:predicate:options:baseDisplayType:specificStartDate:specificEndDate:userInfoCreationBlock:]([HKQuantityDistributionDataSource alloc], "initWithQuantityType:unitController:healthStore:contextStyle:predicate:options:baseDisplayType:specificStartDate:specificEndDate:userInfoCreationBlock:", v12, v9, v8, 0, 0, 0, self, 0, 0, &__block_literal_global_70);
      goto LABEL_5;
    case 14:
      -[HKDisplayType objectType](self, "objectType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HKQuantityDistributionDataSource initWithQuantityType:unitController:healthStore:contextStyle:predicate:options:baseDisplayType:specificStartDate:specificEndDate:userInfoCreationBlock:]([HKQuantityDistributionDataSource alloc], "initWithQuantityType:unitController:healthStore:contextStyle:predicate:options:baseDisplayType:specificStartDate:specificEndDate:userInfoCreationBlock:", v12, v9, v8, 0, 0, 1, self, 0, 0, &__block_literal_global_374);
LABEL_5:
      v10 = v13;

      break;
    case 63:
    case 70:
    case 91:
    case 92:
    case 96:
    case 99:
    case 140:
    case 145:
    case 147:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 178:
    case 189:
    case 191:
    case 192:
    case 193:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 220:
    case 221:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 229:
    case 230:
    case 231:
    case 232:
    case 233:
    case 234:
    case 235:
    case 240:
    case 241:
    case 242:
    case 243:
    case 244:
    case 250:
    case 262:
    case 263:
    case 264:
    case 265:
    case 276:
    case 313:
    case 314:
      goto LABEL_10;
    case 79:
      if (a3 == 6)
      {
        HKInteractiveChartDataSourceForWorkouts(self, v8);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_10:
        HKInteractiveChartDataSourceChartStyle(self, (void *)a3, v8, v9);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_11;
    case 80:
      HKInteractiveChartDataSourceForBloodPressure(self, v8);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 95:
      HKInteractiveChartDataSourceForMenstruation(self, a3, v8);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 97:
      HKInteractiveChartDataSourceCount(self, v8);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 125:
      HKInteractiveChartDataSourceForInsulinDelivery(self, v8);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 172:
    case 173:
    case 272:
      HKInteractiveChartDataSourceForAudioLevel(self, v8, v9);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 237:
      HKInteractiveChartDataSourceForHandwashingEvent(self, v8);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 248:
      HKInteractiveChartDataSourceForAfibBurden(self, a3, v8, v9);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 249:
      HKInteractiveChartDataSourceForAppleWalkingSteadiness(self, a3, v8, v9);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 256:
      HKInteractiveChartDataSourceForSleepingWristTemperature(self, a3, v8, v9);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 269:
      -[HKDisplayType objectType](self, "objectType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType objectType](self, "objectType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HKPreprocessingHandlerForUnderwaterDepth(v16, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HKInteractiveChartDataSourceQuantityType(self, v11, a3, v8, v9, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_3:
      break;
    case 284:
      HKInteractiveChartDataSourceForStateOfMind(self, v8);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 287:
    case 288:
      HKInteractiveChartDataSourceForScoredAssessment(self, v8);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 305:
      HKInteractiveChartDataSourceForBalance(self, v8);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v10 = (void *)v14;
      break;
    default:
      break;
  }

  return v10;
}

HKInteractiveChartSinglePointData *__110__HKDisplayType_DerivedProperties__hk_healthQueryChartCacheDataSourceForTimeScope_healthStore_unitController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HKInteractiveChartSinglePointData *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  v5 = a2;
  v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
  -[HKInteractiveChartSinglePointData setUnit:](v6, "setUnit:", v4);
  objc_msgSend(v5, "minimumValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v4);
  -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

  objc_msgSend(v5, "maximumValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValueForUnit:", v4);
  v10 = v9;

  -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:", v10);
  -[HKInteractiveChartSinglePointData setRepresentsRange:](v6, "setRepresentsRange:", 1);
  return v6;
}

HKInteractiveChartSinglePointData *__110__HKDisplayType_DerivedProperties__hk_healthQueryChartCacheDataSourceForTimeScope_healthStore_unitController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HKInteractiveChartSinglePointData *v6;
  void *v7;
  double v8;
  unint64_t v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
  -[HKInteractiveChartSinglePointData setUnit:](v6, "setUnit:", v5);
  objc_msgSend(v4, "histogramCounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_sumUsingEvaluationBlock:", &__block_literal_global_376);
  v9 = (unint64_t)v8;

  objc_msgSend(v4, "minimumValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValueForUnit:", v5);
  if (v9 < 2)
  {
    -[HKInteractiveChartSinglePointData setValue:](v6, "setValue:");
  }
  else
  {
    -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

    objc_msgSend(v4, "maximumValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValueForUnit:", v5);
    -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:");
  }

  -[HKInteractiveChartSinglePointData setRepresentsRange:](v6, "setRepresentsRange:", v9 > 1);
  return v6;
}

uint64_t __110__HKDisplayType_DerivedProperties__hk_healthQueryChartCacheDataSourceForTimeScope_healthStore_unitController___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "doubleValue");
}

- (id)hk_standardInteractiveChartsFormatterForTimeScope:(int64_t)a3
{
  void *v5;
  char isKindOfClass;
  __objc2_class *v7;
  void *v8;
  uint64_t v9;
  HKInteractiveChartCategoryValueFormatter *v10;
  void *v11;
  void *v12;
  HKInteractiveChartCategoryValueFormatter *v13;

  -[HKDisplayType objectType](self, "objectType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = HKInteractiveChartGenericStatFormatter;
LABEL_8:
    v13 = (HKInteractiveChartCategoryValueFormatter *)objc_alloc_init(v7);
    return v13;
  }
  -[HKDisplayType chartingRules](self, "chartingRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "chartStyleForTimeScope:", a3);

  if ((unint64_t)(v9 - 4) < 3)
  {
    v7 = HKInteractiveChartTimePeriodFormatter;
    goto LABEL_8;
  }
  if ((unint64_t)(v9 - 7) >= 2)
  {
    v7 = HKInteractiveChartDataFormatter;
    goto LABEL_8;
  }
  v10 = [HKInteractiveChartCategoryValueFormatter alloc];
  -[HKDisplayType localization](self, "localization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKInteractiveChartCategoryValueFormatter initWithLocalizedCategoryName:](v10, "initWithLocalizedCategoryName:", v12);

  return v13;
}

- (id)hk_interactiveChartsFormatterForTimeScope:(int64_t)a3
{
  uint64_t v5;
  HKInteractiveChartGenericStatFormatter *v6;
  __objc2_class *v7;
  HKInteractiveChartGenericStatFormatter *v8;
  uint64_t v9;
  HKInteractiveChartGenericStatFormatter *v10;
  HKInteractiveChartMenstruationFormatter *v11;
  void *v12;
  void *v13;

  v5 = -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier");
  if (v5 > 247)
  {
    if (v5 <= 271)
    {
      if (v5 > 255)
      {
        if (v5 != 256)
        {
          if (v5 == 269)
          {
            v6 = objc_alloc_init(HKInteractiveChartGenericStatFormatter);
            -[HKInteractiveChartGenericStatFormatter setOverrideStatFormatterItemOptions:](v6, "setOverrideStatFormatterItemOptions:", &unk_1E9CEA670);
            return v6;
          }
          goto LABEL_32;
        }
        v7 = HKInteractiveChartBaselineRelativeStatFormatter;
      }
      else
      {
        if (v5 == 248)
        {
          v7 = HKInteractiveChartAFibBurdenFormatter;
          goto LABEL_42;
        }
        if (v5 != 249)
          goto LABEL_32;
        v7 = HKInteractiveChartAppleWalkingSteadinessFormatter;
      }
LABEL_42:
      v10 = (HKInteractiveChartGenericStatFormatter *)objc_alloc_init(v7);
      goto LABEL_43;
    }
    if (v5 > 283)
    {
      if (v5 == 284)
      {
        v7 = HKStateOfMindChartFormatter;
        goto LABEL_42;
      }
      if (v5 == 305)
      {
        v7 = HKBalanceChartFormatter;
        goto LABEL_42;
      }
      goto LABEL_32;
    }
    if (v5 != 272)
    {
      if (v5 != 275)
        goto LABEL_32;
      v7 = HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter;
      goto LABEL_42;
    }
    v8 = -[HKInteractiveChartAudioLevelStatFormatter initForDisplayType:timeScope:]([HKInteractiveChartAudioLevelStatFormatter alloc], "initForDisplayType:timeScope:", self, a3);
    v6 = v8;
    v9 = 0;
LABEL_37:
    -[HKInteractiveChartGenericStatFormatter setShowsClassificationInCurrentValueView:](v8, "setShowsClassificationInCurrentValueView:", v9);
    return v6;
  }
  if (v5 > 124)
  {
    if ((unint64_t)(v5 - 172) >= 2)
    {
      if (v5 == 125)
      {
        v7 = HKInteractiveChartInsulinFormatter;
        goto LABEL_42;
      }
      if (v5 != 237)
        goto LABEL_32;
      v7 = HKInteractiveChartHandwashingEventFormatter;
      goto LABEL_42;
    }
    v8 = -[HKInteractiveChartAudioLevelStatFormatter initForDisplayType:timeScope:]([HKInteractiveChartAudioLevelStatFormatter alloc], "initForDisplayType:timeScope:", self, a3);
    v6 = v8;
    v9 = 1;
    goto LABEL_37;
  }
  if (v5 <= 79)
  {
    if (v5 == 14)
    {
      v7 = HKInteractiveChartOxygenSaturationFormatter;
      goto LABEL_42;
    }
    if (v5 == 79 && a3 == 6)
    {
      v7 = HKInteractiveChartTimePeriodFormatter;
      goto LABEL_42;
    }
LABEL_32:
    -[HKDisplayType hk_standardInteractiveChartsFormatterForTimeScope:](self, "hk_standardInteractiveChartsFormatterForTimeScope:", a3);
    v10 = (HKInteractiveChartGenericStatFormatter *)objc_claimAutoreleasedReturnValue();
LABEL_43:
    v6 = v10;
    return v6;
  }
  if (v5 == 80)
  {
    v7 = HKInteractiveChartBloodPressureFormatter;
    goto LABEL_42;
  }
  if (v5 == 95)
  {
    v11 = [HKInteractiveChartMenstruationFormatter alloc];
    -[HKDisplayType localization](self, "localization");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HKInteractiveChartCategoryValueFormatter initWithLocalizedCategoryName:](v11, "initWithLocalizedCategoryName:", v13);

    return v6;
  }
  if (v5 != 97)
    goto LABEL_32;
  v6 = objc_alloc_init(HKInteractiveChartNumberFormatter);
  -[HKInteractiveChartGenericStatFormatter setUnitFormatString:](v6, "setUnitFormatString:", CFSTR("SEXUAL_ACTIVITY_UNIT"));
  return v6;
}

- (id)hk_dimensionForChartAxisWithUnitController:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  __objc2_class *v7;
  HKAxisLabelDimensionInteger *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  HKAxisLabelDimensionInteger *v14;

  v4 = a3;
  v5 = -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier");
  if (v5 <= 69)
  {
    if ((unint64_t)v5 <= 0x3F)
    {
      if (((1 << v5) & 0x2200000000004080) != 0)
        goto LABEL_10;
      if (v5 == 2)
      {
        objc_msgSend(v4, "unitForDisplayType:", self);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v11)
          goto LABEL_22;
        v9 = 1;
        goto LABEL_14;
      }
      if (v5 == 63)
        goto LABEL_13;
    }
LABEL_17:
    -[HKDisplayType chartingRules](self, "chartingRules");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldDisplayUnitForAxisLabels");

    if (v13)
    {
      v7 = HKAxisLabelDimensionDisplayType;
      goto LABEL_19;
    }
LABEL_22:
    v14 = 0;
    goto LABEL_21;
  }
  v6 = v5 - 70;
  if ((unint64_t)(v5 - 70) > 0x29)
    goto LABEL_5;
  if (((1 << v6) & 0x20088080000) == 0)
  {
    if (((1 << v6) & 0x20000201) == 0)
    {
LABEL_5:
      if (v5 != 189)
      {
        if (v5 == 256)
        {
          v7 = HKAxisLabelDimensionRelativeTemperature;
LABEL_19:
          v8 = (HKAxisLabelDimensionInteger *)objc_msgSend([v7 alloc], "initWithDisplayType:unitPreferencesController:", self, v4);
          goto LABEL_20;
        }
        goto LABEL_17;
      }
    }
LABEL_13:
    v9 = 0;
LABEL_14:
    +[HKChartAxisDimensionFactory dimensionWithPurpose:displayType:unitController:](HKChartAxisDimensionFactory, "dimensionWithPurpose:displayType:unitController:", v9, self, v4);
    v8 = (HKAxisLabelDimensionInteger *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_10:
  v8 = objc_alloc_init(HKAxisLabelDimensionInteger);
LABEL_20:
  v14 = v8;
LABEL_21:

  return v14;
}

- (BOOL)hk_healthQueryChartDataSourceDependsOnTimeScope
{
  int64_t v2;
  BOOL result;

  v2 = -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier");
  result = 1;
  switch(v2)
  {
    case 140:
    case 145:
    case 147:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 178:
    case 189:
    case 191:
    case 192:
    case 193:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 220:
    case 221:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 229:
    case 230:
    case 231:
    case 232:
    case 233:
    case 234:
    case 235:
    case 240:
    case 241:
    case 242:
    case 243:
    case 244:
    case 248:
    case 249:
    case 250:
    case 256:
    case 262:
    case 263:
    case 264:
    case 265:
    case 276:
      return result;
    case 141:
    case 142:
    case 143:
    case 144:
    case 146:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 190:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 208:
    case 209:
    case 210:
    case 211:
    case 212:
    case 213:
    case 214:
    case 215:
    case 216:
    case 217:
    case 218:
    case 219:
    case 227:
    case 228:
    case 236:
    case 237:
    case 238:
    case 239:
    case 245:
    case 246:
    case 247:
    case 251:
    case 252:
    case 253:
    case 254:
    case 255:
    case 257:
    case 258:
    case 259:
    case 260:
    case 261:
    case 266:
    case 267:
    case 268:
    case 269:
    case 270:
    case 271:
    case 272:
    case 273:
    case 274:
    case 275:
      goto LABEL_6;
    default:
      if (((unint64_t)(v2 - 63) > 0x24 || ((1 << (v2 - 63)) & 0x1330010081) == 0)
        && (unint64_t)(v2 - 313) >= 2)
      {
LABEL_6:
        result = 0;
      }
      break;
  }
  return result;
}

id __62__HKDisplayType_DerivedProperties__hk_chartFactorDisplayTypes__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;

  v0 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v1 = (void *)objc_msgSend(v0, "initWithArray:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "features");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "seahorse");

  if (v4)
  {
    +[HKDisplayType displayTypeWithIdentifier:](HKDisplayType, "displayTypeWithIdentifier:", 191);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "addObject:", v5);

  }
  return v1;
}

- (id)hk_chartExcludedFactorDisplayTypes
{
  -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier");
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)hk_chartFactorDescriptionDisplayTypes
{
  uint64_t v2;
  void *v3;

  v2 = -[HKDisplayType displayTypeIdentifier](self, "displayTypeIdentifier");
  v3 = (void *)MEMORY[0x1E0C9AA60];
  if (v2 > 247)
  {
    if (v2 != 284 && v2 != 248)
      return v3;
LABEL_8:
    __62__HKDisplayType_DerivedProperties__hk_chartFactorDisplayTypes__block_invoke();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if ((unint64_t)(v2 - 118) <= 0x13 && ((1 << (v2 - 118)) & 0x80041) != 0 || v2 == 3)
    goto LABEL_8;
  return v3;
}

@end
