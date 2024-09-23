@implementation FUFlightInfoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FUFlightInfoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("leg"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightLeg"), CFSTR("duration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("flightButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("flight"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("leg"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelAirlineName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelFlightCode"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelStatusTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelStatus"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelDepartureCity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelDepartureCode"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelDepartureInfo1"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelDepartureInfo2"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelArrivalCity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelArrivalCode"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelArrivalInfo1"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelArrivalInfo2"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelDepartureTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelDepartureDate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelDepartureDelay"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelArrivalTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelArrivalDate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelArrivalDelay"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelDurationTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelDurationValue"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelDurationComplete"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelBaggageClaimTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FUFlightInfoView"), CFSTR("labelBaggageClaimValue"), "@", 0);

}

- (void)setFlight:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FUFlightInfoViewAccessibility;
  -[FUFlightInfoViewAccessibility setFlight:](&v4, sel_setFlight_, a3);
  -[FUFlightInfoViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIAccessibilityFrameRecalculatingElement *v8;
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
  uint64_t v20;
  UIAccessibilityFrameRecalculatingElement *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
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
  id v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  unint64_t v78;
  id v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  UIAccessibilityFrameRecalculatingElement *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  UIAccessibilityFrameRecalculatingElement *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  void *v149;
  void *v150;
  id v151;
  FUFlightInfoViewAccessibility *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  UIAccessibilityFrameRecalculatingElement *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  id v163;
  void *v164;
  void *v166;
  void *v167;
  id v168;
  id v169;
  void *v170;
  void *v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  id v177;
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
  UIAccessibilityFrameRecalculatingElement *v190;
  void *v191;
  void *v192;
  void *v193;
  UIAccessibilityFrameRecalculatingElement *v194;
  void *v195;
  uint64_t v196;
  FUFlightInfoViewAccessibility *v197;
  UIAccessibilityFrameRecalculatingElement *v198;
  UIAccessibilityFrameRecalculatingElement *v199;
  void *v200;
  void *v201;
  uint64_t v202;
  _QWORD v203[4];
  id v204;
  id v205;
  _QWORD v206[4];
  id v207;
  id v208;
  id v209;
  _QWORD v210[4];
  id v211;
  id v212;
  id v213;
  _QWORD v214[4];
  id v215;
  id v216;
  id v217;
  _QWORD v218[4];
  id v219;
  id v220;
  id v221;
  id v222;
  _QWORD v223[4];
  id v224;
  id v225;
  id v226;
  id v227;
  _QWORD v228[4];
  id v229;
  id v230;
  _QWORD v231[5];
  char v232;

  -[FUFlightInfoViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v232 = 0;
    objc_opt_class();
    -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("flight"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v232 = 0;
    objc_opt_class();
    -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leg"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v201 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[UIAccessibilityFrameRecalculatingElement initWithAccessibilityContainer:]([UIAccessibilityFrameRecalculatingElement alloc], "initWithAccessibilityContainer:", self);
    v202 = *MEMORY[0x24BDF7410];
    -[UIAccessibilityFrameRecalculatingElement setAccessibilityTraits:](v8, "setAccessibilityTraits:");
    v9 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("flight.code.label"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "airline");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flightCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityFrameRecalculatingElement setAccessibilityLabel:](v8, "setAccessibilityLabel:", v14);

    v231[0] = MEMORY[0x24BDAC760];
    v231[1] = 3221225472;
    v231[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke;
    v231[3] = &unk_25020F1B8;
    v231[4] = self;
    -[UIAccessibilityFrameRecalculatingElement setCalculateFrame:](v8, "setCalculateFrame:", v231);
    objc_msgSend(v4, "addObject:", v8);
    v232 = 0;
    objc_opt_class();
    -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelStatus"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v232)
      goto LABEL_69;
    v232 = 0;
    objc_opt_class();
    -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelStatusTitle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v232)
      goto LABEL_69;
    objc_msgSend(v18, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      v21 = -[UIAccessibilityFrameRecalculatingElement initWithAccessibilityContainer:]([UIAccessibilityFrameRecalculatingElement alloc], "initWithAccessibilityContainer:", self);
      -[UIAccessibilityFrameRecalculatingElement setAccessibilityTraits:](v21, "setAccessibilityTraits:", v202);
      -[FUFlightInfoViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("labelStatusTitle, labelStatus"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAccessibilityFrameRecalculatingElement setAccessibilityLabel:](v21, "setAccessibilityLabel:", v22);

      v228[0] = MEMORY[0x24BDAC760];
      v228[1] = 3221225472;
      v228[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_2;
      v228[3] = &unk_25020F1E0;
      v229 = v16;
      v230 = v18;
      -[UIAccessibilityFrameRecalculatingElement setCalculateFrame:](v21, "setCalculateFrame:", v228);
      objc_msgSend(v4, "addObject:", v21);

    }
    v199 = -[UIAccessibilityFrameRecalculatingElement initWithAccessibilityContainer:]([UIAccessibilityFrameRecalculatingElement alloc], "initWithAccessibilityContainer:", self);
    v196 = *MEMORY[0x24BDF73B0];
    -[UIAccessibilityFrameRecalculatingElement setAccessibilityTraits:](v199, "setAccessibilityTraits:");
    v232 = 0;
    objc_opt_class();
    -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelDepartureCity"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v232)
      goto LABEL_69;
    v192 = v18;
    v193 = v16;
    v232 = 0;
    objc_opt_class();
    -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelDepartureCode"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v232)
      goto LABEL_69;
    v232 = 0;
    objc_opt_class();
    -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelDepartureInfo1"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v232)
      goto LABEL_69;
    v190 = v8;
    v191 = v6;
    v232 = 0;
    objc_opt_class();
    -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelDepartureInfo2"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v232)
      goto LABEL_69;
    v223[0] = MEMORY[0x24BDAC760];
    v223[1] = 3221225472;
    v223[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_3;
    v223[3] = &unk_25020F208;
    v31 = v24;
    v224 = v31;
    v32 = v26;
    v225 = v32;
    v33 = v28;
    v226 = v33;
    v34 = v30;
    v227 = v34;
    -[UIAccessibilityFrameRecalculatingElement setCalculateFrame:](v199, "setCalculateFrame:", v223);
    v200 = v4;
    v35 = v201;
    v187 = v33;
    v188 = v32;
    v186 = v34;
    if (!v201)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 4, v31, v32, v33, v34);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      MEMORY[0x23490ED74]();
      v41 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      v189 = v31;

      -[UIAccessibilityFrameRecalculatingElement setAccessibilityLabel:](v199, "setAccessibilityLabel:", v41);
      accessibilityLocalizedString(CFSTR("flight.departure.location.hint"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAccessibilityFrameRecalculatingElement setAccessibilityHint:](v199, "setAccessibilityHint:", v57);

      objc_msgSend(v4, "addObject:", v199);
      v232 = 0;
      objc_opt_class();
      -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("flightButton"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v232)
        goto LABEL_69;
      accessibilityLocalizedString(CFSTR("flight.overview.label"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setAccessibilityLabel:", v60);

      accessibilityLocalizedString(CFSTR("flight.overview.hint"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setAccessibilityHint:", v61);

      v185 = v59;
      objc_msgSend(v4, "axSafelyAddObject:", v59);
      v198 = -[UIAccessibilityFrameRecalculatingElement initWithAccessibilityContainer:]([UIAccessibilityFrameRecalculatingElement alloc], "initWithAccessibilityContainer:", self);
      -[UIAccessibilityFrameRecalculatingElement setAccessibilityTraits:](v198, "setAccessibilityTraits:", v196);
      v232 = 0;
      objc_opt_class();
      -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelArrivalCity"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (v232)
        goto LABEL_69;
      v184 = (void *)v41;
      v232 = 0;
      objc_opt_class();
      -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelArrivalCode"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (v232)
        goto LABEL_69;
      v232 = 0;
      objc_opt_class();
      -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelArrivalInfo1"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (v232)
        goto LABEL_69;
      v232 = 0;
      objc_opt_class();
      -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelArrivalInfo2"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (v232)
        goto LABEL_69;
      v218[0] = MEMORY[0x24BDAC760];
      v218[1] = 3221225472;
      v218[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_4;
      v218[3] = &unk_25020F208;
      v70 = v63;
      v219 = v70;
      v71 = v65;
      v220 = v71;
      v72 = v67;
      v221 = v72;
      v73 = v69;
      v222 = v73;
      -[UIAccessibilityFrameRecalculatingElement setCalculateFrame:](v198, "setCalculateFrame:", v218);
      v182 = v71;
      v183 = v70;
      v180 = v73;
      v181 = v72;
      if (!v35)
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 4, v70, v71, v72, v73);
        v79 = (id)objc_claimAutoreleasedReturnValue();
        MEMORY[0x23490ED74]();
        v80 = objc_claimAutoreleasedReturnValue();
        v78 = 0x25020E000;
        goto LABEL_45;
      }
      objc_msgSend(v35, "arrival");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "airport");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "name");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v76;
      v78 = 0x25020E000uLL;
      if (v76)
      {
        v79 = v76;
      }
      else
      {
        objc_msgSend(v35, "arrival");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "airport");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "IATACode");
        v79 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v35, "arrival");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "terminal");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "length");

      objc_msgSend(v35, "arrival");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "gate");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v87, "length");

      v89 = (void *)MEMORY[0x24BDD17C8];
      if (v85)
      {
        if (v88)
        {
          accessibilityLocalizedString(CFSTR("flight.arrival.location.label"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "arrival");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "gate");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "arrival");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "terminal");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "stringWithFormat:", v90, v92, v94, v79);
          v80 = objc_claimAutoreleasedReturnValue();

          v4 = v200;
LABEL_43:

LABEL_44:
LABEL_45:

          -[UIAccessibilityFrameRecalculatingElement setAccessibilityLabel:](v198, "setAccessibilityLabel:", v80);
          accessibilityLocalizedString(CFSTR("flight.arrival.location.hint"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIAccessibilityFrameRecalculatingElement setAccessibilityHint:](v198, "setAccessibilityHint:", v96);

          objc_msgSend(v4, "addObject:", v198);
          v97 = (void *)objc_msgSend(objc_alloc(*(Class *)(v78 + 3872)), "initWithAccessibilityContainer:", self);
          objc_msgSend(v97, "setAccessibilityTraits:", v202);
          v232 = 0;
          objc_opt_class();
          -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelDepartureTitle"));
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v232)
          {
            v232 = 0;
            objc_opt_class();
            -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelDepartureDate"));
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAccessibilityCastAsClass();
            v101 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v232)
            {
              v179 = (void *)v80;
              v232 = 0;
              objc_opt_class();
              v197 = self;
              -[FUFlightInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelDepartureDelay"));
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              __UIAccessibilityCastAsClass();
              v103 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v232)
              {
                v214[0] = MEMORY[0x24BDAC760];
                v214[1] = 3221225472;
                v214[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_5;
                v214[3] = &unk_25020F230;
                v104 = v99;
                v215 = v104;
                v177 = v101;
                v216 = v177;
                v105 = v103;
                v217 = v105;
                v195 = v97;
                objc_msgSend(v97, "setCalculateFrame:", v214);
                objc_msgSend(v201, "departure");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "time");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "date");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v201, "departure");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "airport");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "timeZone");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                AXDateStringForFormatWithTimeZone();
                v112 = objc_claimAutoreleasedReturnValue();

                v113 = objc_msgSend(v201, "status");
                v114 = (void *)MEMORY[0x24BDD17C8];
                if (v113 == 6)
                {
                  accessibilityLocalizedString(CFSTR("flight.departure.schedule.cancel.label"));
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v114, "stringWithFormat:", v115, v112);
                  v116 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  accessibilityLocalizedString(CFSTR("flight.departure.schedule.label"));
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v104, "text");
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v114, "stringWithFormat:", v115, v117, v112);
                  v118 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v105, "text");
                  v166 = (void *)objc_claimAutoreleasedReturnValue();
                  __UIAXStringForVariables();
                  v116 = objc_claimAutoreleasedReturnValue();

                }
                v175 = (void *)v112;
                v176 = v105;
                v178 = v104;

                v174 = (void *)v116;
                objc_msgSend(v195, "setAccessibilityLabel:", v116);
                objc_msgSend(v200, "addObject:", v195);
                v119 = -[UIAccessibilityFrameRecalculatingElement initWithAccessibilityContainer:]([UIAccessibilityFrameRecalculatingElement alloc], "initWithAccessibilityContainer:", v197);
                -[UIAccessibilityFrameRecalculatingElement setAccessibilityTraits:](v119, "setAccessibilityTraits:", v202);
                v232 = 0;
                objc_opt_class();
                -[FUFlightInfoViewAccessibility safeValueForKey:](v197, "safeValueForKey:", CFSTR("labelArrivalTitle"));
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                __UIAccessibilityCastAsClass();
                v121 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v232)
                {
                  v232 = 0;
                  objc_opt_class();
                  -[FUFlightInfoViewAccessibility safeValueForKey:](v197, "safeValueForKey:", CFSTR("labelArrivalDate"));
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                  __UIAccessibilityCastAsClass();
                  v123 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v232)
                  {
                    v232 = 0;
                    objc_opt_class();
                    -[FUFlightInfoViewAccessibility safeValueForKey:](v197, "safeValueForKey:", CFSTR("labelArrivalDelay"));
                    v124 = (void *)objc_claimAutoreleasedReturnValue();
                    __UIAccessibilityCastAsClass();
                    v125 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v232)
                    {
                      v210[0] = MEMORY[0x24BDAC760];
                      v210[1] = 3221225472;
                      v210[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_6;
                      v210[3] = &unk_25020F230;
                      v126 = v121;
                      v211 = v126;
                      v172 = v123;
                      v212 = v172;
                      v127 = v125;
                      v213 = v127;
                      v194 = v119;
                      -[UIAccessibilityFrameRecalculatingElement setCalculateFrame:](v119, "setCalculateFrame:", v210);
                      objc_msgSend(v201, "arrival");
                      v128 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v128, "time");
                      v129 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v129, "date");
                      v130 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v201, "arrival");
                      v131 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v131, "airport");
                      v132 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v132, "timeZone");
                      v133 = (void *)objc_claimAutoreleasedReturnValue();
                      AXDateStringForFormatWithTimeZone();
                      v134 = (void *)objc_claimAutoreleasedReturnValue();

                      v135 = objc_msgSend(v201, "status");
                      v136 = (void *)MEMORY[0x24BDD17C8];
                      v173 = v126;
                      if (v135 == 6)
                      {
                        accessibilityLocalizedString(CFSTR("flight.arrival.schedule.cancel.label"));
                        v137 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v136, "stringWithFormat:", v137, v134);
                        v138 = objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        accessibilityLocalizedString(CFSTR("flight.arrival.schedule.label"));
                        v137 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v126, "text");
                        v139 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v136, "stringWithFormat:", v137, v139, v134);
                        v140 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v127, "text");
                        v167 = (void *)objc_claimAutoreleasedReturnValue();
                        __UIAXStringForVariables();
                        v138 = objc_claimAutoreleasedReturnValue();

                      }
                      v3 = v200;
                      v171 = v127;

                      v170 = (void *)v138;
                      -[UIAccessibilityFrameRecalculatingElement setAccessibilityLabel:](v194, "setAccessibilityLabel:", v138);
                      objc_msgSend(v200, "addObject:", v194);
                      v141 = -[UIAccessibilityFrameRecalculatingElement initWithAccessibilityContainer:]([UIAccessibilityFrameRecalculatingElement alloc], "initWithAccessibilityContainer:", v197);
                      -[UIAccessibilityFrameRecalculatingElement setAccessibilityTraits:](v141, "setAccessibilityTraits:", v202);
                      v232 = 0;
                      objc_opt_class();
                      -[FUFlightInfoViewAccessibility safeValueForKey:](v197, "safeValueForKey:", CFSTR("labelDurationTitle"));
                      v142 = (void *)objc_claimAutoreleasedReturnValue();
                      __UIAccessibilityCastAsClass();
                      v143 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v232)
                      {
                        v232 = 0;
                        objc_opt_class();
                        -[FUFlightInfoViewAccessibility safeValueForKey:](v197, "safeValueForKey:", CFSTR("labelDurationValue"));
                        v144 = (void *)objc_claimAutoreleasedReturnValue();
                        __UIAccessibilityCastAsClass();
                        v145 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v232)
                        {
                          v232 = 0;
                          objc_opt_class();
                          -[FUFlightInfoViewAccessibility safeValueForKey:](v197, "safeValueForKey:", CFSTR("labelDurationComplete"));
                          v146 = (void *)objc_claimAutoreleasedReturnValue();
                          __UIAccessibilityCastAsClass();
                          v147 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v232)
                          {
                            v206[0] = MEMORY[0x24BDAC760];
                            v206[1] = 3221225472;
                            v206[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_7;
                            v206[3] = &unk_25020F230;
                            v169 = v143;
                            v207 = v169;
                            v168 = v145;
                            v208 = v168;
                            v148 = v147;
                            v209 = v148;
                            -[UIAccessibilityFrameRecalculatingElement setCalculateFrame:](v141, "setCalculateFrame:", v206);
                            objc_msgSend(v148, "text");
                            v149 = (void *)objc_claimAutoreleasedReturnValue();
                            v150 = v149;
                            if (v149)
                            {
                              v151 = v149;
                              v152 = v197;
                            }
                            else
                            {
                              v153 = (void *)MEMORY[0x24BDD17C8];
                              accessibilityLocalizedString(CFSTR("flight.duration.label"));
                              v154 = (void *)objc_claimAutoreleasedReturnValue();
                              v152 = v197;
                              -[FUFlightInfoViewAccessibility safeValueForKey:](v197, "safeValueForKey:", CFSTR("leg"));
                              v155 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v155, "safeTimeIntervalForKey:", CFSTR("duration"));
                              AXDurationStringForDuration();
                              v156 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v153, "stringWithFormat:", v154, v156);
                              v151 = (id)objc_claimAutoreleasedReturnValue();

                              v3 = v200;
                            }

                            -[UIAccessibilityFrameRecalculatingElement setAccessibilityLabel:](v141, "setAccessibilityLabel:", v151);
                            objc_msgSend(v3, "addObject:", v141);
                            v157 = -[UIAccessibilityFrameRecalculatingElement initWithAccessibilityContainer:]([UIAccessibilityFrameRecalculatingElement alloc], "initWithAccessibilityContainer:", v152);
                            -[UIAccessibilityFrameRecalculatingElement setAccessibilityTraits:](v157, "setAccessibilityTraits:", v202);
                            v232 = 0;
                            objc_opt_class();
                            -[FUFlightInfoViewAccessibility safeValueForKey:](v152, "safeValueForKey:", CFSTR("labelBaggageClaimTitle"));
                            v158 = (void *)objc_claimAutoreleasedReturnValue();
                            __UIAccessibilityCastAsClass();
                            v159 = (void *)objc_claimAutoreleasedReturnValue();

                            if (!v232)
                            {
                              v232 = 0;
                              objc_opt_class();
                              -[FUFlightInfoViewAccessibility safeValueForKey:](v152, "safeValueForKey:", CFSTR("labelBaggageClaimValue"));
                              v160 = (void *)objc_claimAutoreleasedReturnValue();
                              __UIAccessibilityCastAsClass();
                              v161 = (void *)objc_claimAutoreleasedReturnValue();

                              if (!v232)
                              {
                                v203[0] = MEMORY[0x24BDAC760];
                                v203[1] = 3221225472;
                                v203[2] = __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_8;
                                v203[3] = &unk_25020F1E0;
                                v204 = v159;
                                v205 = v161;
                                v162 = v161;
                                v163 = v159;
                                -[UIAccessibilityFrameRecalculatingElement setCalculateFrame:](v157, "setCalculateFrame:", v203);
                                __UIAXStringForVariables();
                                v164 = (void *)objc_claimAutoreleasedReturnValue();
                                -[UIAccessibilityFrameRecalculatingElement setAccessibilityLabel:](v157, "setAccessibilityLabel:", v164, v162, CFSTR("__AXStringForVariablesSentinel"));

                                objc_msgSend(v3, "addObject:", v157);
                                -[FUFlightInfoViewAccessibility _accessibilitySetRetainedValue:forKey:](v152, "_accessibilitySetRetainedValue:forKey:", v3, *MEMORY[0x24BEBB308]);

                                return v3;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_69:
          abort();
        }
        accessibilityLocalizedString(CFSTR("flight.arrival.location.label.nogate"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "arrival");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "terminal");
        v95 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v88)
        {
          accessibilityLocalizedString(CFSTR("flight.arrival.location.label.noterminal"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "stringWithFormat:", v90, v79);
          v80 = objc_claimAutoreleasedReturnValue();
          goto LABEL_44;
        }
        accessibilityLocalizedString(CFSTR("flight.arrival.location.label.noterminal.gate"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "arrival");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "gate");
        v95 = objc_claimAutoreleasedReturnValue();
      }
      v92 = (void *)v95;
      objc_msgSend(v89, "stringWithFormat:", v90, v95, v79);
      v80 = objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    objc_msgSend(v201, "departure");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "airport");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      v40 = v38;
    }
    else
    {
      objc_msgSend(v201, "departure");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "airport");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "IATACode");
      v40 = (id)objc_claimAutoreleasedReturnValue();

      v4 = v200;
    }

    objc_msgSend(v201, "departure");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "terminal");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "length");

    objc_msgSend(v201, "departure");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "gate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "length");

    v50 = (void *)MEMORY[0x24BDD17C8];
    if (v46)
    {
      if (v49)
      {
        accessibilityLocalizedString(CFSTR("flight.departure.location.label"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v201, "departure");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "gate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v201, "departure");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "terminal");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "stringWithFormat:", v51, v53, v55, v40);
        v41 = objc_claimAutoreleasedReturnValue();

        v35 = v201;
        v4 = v200;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      accessibilityLocalizedString(CFSTR("flight.departure.location.label.nogate"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "departure");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "terminal");
      v56 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v49)
      {
        accessibilityLocalizedString(CFSTR("flight.departure.location.label.noterminal"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "stringWithFormat:", v51, v40);
        v41 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      accessibilityLocalizedString(CFSTR("flight.departure.location.label.noterminal.gate"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "departure");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "gate");
      v56 = objc_claimAutoreleasedReturnValue();
    }
    v53 = (void *)v56;
    objc_msgSend(v50, "stringWithFormat:", v51, v56, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  return v3;
}

double __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("labelAirlineName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("labelFlightCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityFrame");
  v16 = UnionExcludingEmptyRects(v4, v6, v8, v10, v12, v13, v14, v15);

  return v16;
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "accessibilityFrame");
  return UnionExcludingEmptyRects(v3, v5, v7, v9, v10, v11, v12, v13);
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_3(id *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;

  objc_msgSend(a1[4], "accessibilityFrame");
  v37 = v3;
  v38 = v2;
  v35 = v5;
  v36 = v4;
  objc_msgSend(a1[5], "accessibilityFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(a1[6], "accessibilityFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(a1[7], "accessibilityFrame");
  v26 = UnionExcludingEmptyRects(v15, v17, v19, v21, v22, v23, v24, v25);
  v30 = UnionExcludingEmptyRects(v7, v9, v11, v13, v26, v27, v28, v29);
  return UnionExcludingEmptyRects(v38, v37, v36, v35, v30, v31, v32, v33);
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_4(id *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;

  objc_msgSend(a1[4], "accessibilityFrame");
  v37 = v3;
  v38 = v2;
  v35 = v5;
  v36 = v4;
  objc_msgSend(a1[5], "accessibilityFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(a1[6], "accessibilityFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(a1[7], "accessibilityFrame");
  v26 = UnionExcludingEmptyRects(v15, v17, v19, v21, v22, v23, v24, v25);
  v30 = UnionExcludingEmptyRects(v7, v9, v11, v13, v26, v27, v28, v29);
  return UnionExcludingEmptyRects(v38, v37, v36, v35, v30, v31, v32, v33);
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_5(id *a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;

  objc_msgSend(a1[4], "accessibilityFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1[5], "accessibilityFrame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(a1[6], "accessibilityFrame");
  v22 = UnionExcludingEmptyRects(v11, v13, v15, v17, v18, v19, v20, v21);
  return UnionExcludingEmptyRects(v3, v5, v7, v9, v22, v23, v24, v25);
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_6(id *a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;

  objc_msgSend(a1[4], "accessibilityFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1[5], "accessibilityFrame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(a1[6], "accessibilityFrame");
  v22 = UnionExcludingEmptyRects(v11, v13, v15, v17, v18, v19, v20, v21);
  return UnionExcludingEmptyRects(v3, v5, v7, v9, v22, v23, v24, v25);
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_7(id *a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;

  objc_msgSend(a1[4], "accessibilityFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1[5], "accessibilityFrame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(a1[6], "accessibilityFrame");
  v22 = UnionExcludingEmptyRects(v11, v13, v15, v17, v18, v19, v20, v21);
  return UnionExcludingEmptyRects(v3, v5, v7, v9, v22, v23, v24, v25);
}

CGFloat __54__FUFlightInfoViewAccessibility_accessibilityElements__block_invoke_8(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "accessibilityFrame");
  return UnionExcludingEmptyRects(v3, v5, v7, v9, v10, v11, v12, v13);
}

@end
