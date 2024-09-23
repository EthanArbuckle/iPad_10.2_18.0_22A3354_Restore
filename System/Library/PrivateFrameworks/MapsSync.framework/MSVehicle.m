@implementation MSVehicle

- (MSVehicle)initWithColorHex:(id)a3 currentVehicleState:(id)a4 dateOfVehicleIngestion:(id)a5 displayName:(id)a6 headUnitBluetoothIdentifier:(id)a7 headUnitMacAddress:(id)a8 iapIdentifier:(id)a9 lastStateUpdateDate:(id)a10 licensePlate:(id)a11 lprPowerType:(id)a12 lprVehicleType:(id)a13 manufacturer:(id)a14 model:(id)a15 pairedAppIdentifier:(id)a16 positionIndex:(int64_t)a17 powerByConnector:(id)a18 preferredChargingNetworks:(id)a19 siriIntentsIdentifier:(id)a20 supportedConnectors:(id)a21 vehicleIdentifier:(id)a22 vehicleType:(id)a23 year:(id)a24
{
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  unint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  void *v97;
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  id v120;
  id v121;
  uint64_t v122;
  unint64_t v123;
  MSVehicle *v124;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  id v136;
  id v137;
  void *v138;
  id v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  unint64_t v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  MSVehicle *v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  uint64_t v160;
  uint64_t v161;

  v152 = a5;
  v153 = a6;
  v150 = self;
  v151 = a4;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v28 = MEMORY[0x1E0C80A78](v27);
  v160 = (uint64_t)&v129 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v28);
  v161 = (uint64_t)&v129 - v30;
  v154 = a7;
  v155 = a8;
  if (a3)
  {
    v31 = sub_1A423C14C();
    v148 = v32;
    v149 = v31;
  }
  else
  {
    v148 = 0;
    v149 = 0;
  }
  v158 = a23;
  v159 = a24;
  v156 = a20;
  v157 = a22;
  v147 = a21;
  v144 = a15;
  v145 = a16;
  v143 = a14;
  v141 = a19;
  v142 = a13;
  v140 = a12;
  v138 = a11;
  v136 = a10;
  v134 = a9;
  if (v151)
  {
    v137 = a18;
    v139 = v151;
    v33 = v152;
    v34 = v153;
    v35 = v154;
    v36 = v155;
    v37 = a9;
    v38 = a10;
    v39 = a11;
    v40 = a12;
    v41 = a13;
    v42 = a14;
    v43 = a15;
    v44 = a16;
    v45 = v137;
    v46 = v137;
    v47 = v141;
    v48 = v141;
    v49 = v156;
    v50 = a21;
    v51 = v157;
    v52 = v158;
    v53 = v159;
    v151 = (id)sub_1A423BF54();
    v146 = v54;

    v55 = v152;
    if (v152)
    {
LABEL_6:
      v56 = v161;
      sub_1A423BF84();

      v57 = sub_1A423BF9C();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v56, 0, 1, v57);
      goto LABEL_9;
    }
  }
  else
  {
    v58 = v152;
    v59 = v153;
    v60 = v154;
    v61 = v155;
    v62 = a9;
    v63 = a10;
    v64 = a11;
    v65 = a12;
    v66 = a13;
    v67 = a14;
    v68 = a15;
    v69 = a16;
    v45 = a18;
    v70 = a18;
    v47 = v141;
    v71 = v141;
    v72 = v156;
    v73 = a21;
    v74 = v157;
    v75 = v158;
    v76 = v159;
    v151 = 0;
    v146 = 0xF000000000000000;
    v55 = v152;
    if (v152)
      goto LABEL_6;
  }
  v77 = sub_1A423BF9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 56))(v161, 1, 1, v77);
LABEL_9:
  v78 = v47;
  v80 = v142;
  v79 = v143;
  v81 = v140;
  v82 = v138;
  v83 = v153;
  v84 = v154;
  v85 = v45;
  v86 = v136;
  if (v153)
  {
    v152 = (id)sub_1A423C14C();
    v141 = v87;

    v88 = v155;
    if (v84)
      goto LABEL_11;
LABEL_14:
    v153 = 0;
    v139 = 0;
    if (v88)
      goto LABEL_12;
    goto LABEL_15;
  }
  v152 = 0;
  v141 = 0;
  v88 = v155;
  if (!v154)
    goto LABEL_14;
LABEL_11:
  v153 = (id)sub_1A423C14C();
  v139 = v89;

  if (v88)
  {
LABEL_12:
    v154 = (id)sub_1A423C14C();
    v137 = v90;

    goto LABEL_16;
  }
LABEL_15:
  v154 = 0;
  v137 = 0;
LABEL_16:
  v91 = v134;
  if (v134)
  {
    v155 = (id)sub_1A423C14C();
    v135 = v92;

    if (v86)
    {
LABEL_18:
      v93 = v160;
      sub_1A423BF84();

      v94 = sub_1A423BF9C();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v94 - 8) + 56))(v93, 0, 1, v94);
      goto LABEL_21;
    }
  }
  else
  {
    v155 = 0;
    v135 = 0;
    if (v86)
      goto LABEL_18;
  }
  v95 = sub_1A423BF9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v95 - 8) + 56))(v160, 1, 1, v95);
LABEL_21:
  v96 = v156;
  v97 = v78;
  if (v82)
  {
    v156 = (id)sub_1A423C14C();
    v136 = v98;

    if (v81)
      goto LABEL_23;
  }
  else
  {
    v156 = 0;
    v136 = 0;
    if (v81)
    {
LABEL_23:
      v138 = (void *)sub_1A423C14C();
      v134 = v99;

      if (v80)
        goto LABEL_24;
      goto LABEL_33;
    }
  }
  v138 = 0;
  v134 = 0;
  if (v80)
  {
LABEL_24:
    v140 = (void *)sub_1A423C14C();
    v133 = v100;

    if (v79)
      goto LABEL_25;
    goto LABEL_34;
  }
LABEL_33:
  v140 = 0;
  v133 = 0;
  if (v79)
  {
LABEL_25:
    v142 = (void *)sub_1A423C14C();
    v132 = v101;

    v102 = v144;
    if (v144)
      goto LABEL_26;
    goto LABEL_35;
  }
LABEL_34:
  v142 = 0;
  v132 = 0;
  v102 = v144;
  if (v144)
  {
LABEL_26:
    v143 = (void *)sub_1A423C14C();
    v131 = v103;

    v104 = v145;
    if (v145)
      goto LABEL_27;
    goto LABEL_36;
  }
LABEL_35:
  v143 = 0;
  v131 = 0;
  v104 = v145;
  if (v145)
  {
LABEL_27:
    v144 = (void *)sub_1A423C14C();
    v130 = v105;

    if (v85)
      goto LABEL_28;
    goto LABEL_37;
  }
LABEL_36:
  v144 = 0;
  v130 = 0;
  if (v85)
  {
LABEL_28:
    v106 = sub_1A423BF54();
    v108 = v107;

    if (v97)
      goto LABEL_29;
LABEL_38:
    v109 = 0;
    v111 = 0xF000000000000000;
    if (v96)
      goto LABEL_30;
    goto LABEL_39;
  }
LABEL_37:
  v106 = 0;
  v108 = 0xF000000000000000;
  if (!v97)
    goto LABEL_38;
LABEL_29:
  v109 = sub_1A423BF54();
  v111 = v110;

  if (v96)
  {
LABEL_30:
    v112 = sub_1A423C14C();
    v114 = v113;

    goto LABEL_40;
  }
LABEL_39:
  v112 = 0;
  v114 = 0;
LABEL_40:
  v115 = v157;
  if (v157)
  {
    v116 = sub_1A423C14C();
    v118 = v117;

  }
  else
  {
    v116 = 0;
    v118 = 0;
  }
  v128 = v116;
  v126 = v112;
  v127 = v114;
  v119 = v147;
  v120 = v159;
  v121 = v158;
  v122 = (uint64_t)v151;
  v123 = v146;
  v124 = (MSVehicle *)sub_1A41C9334(v149, v148, (uint64_t)v151, v146, v161, (uint64_t)v152, (uint64_t)v141, (uint64_t)v153, (uint64_t)v139, (uint64_t)v154, (uint64_t)v137, (uint64_t)v155, v135, v160, (uint64_t)v156, (uint64_t)v136, (uint64_t)v138, (uint64_t)v134, (uint64_t)v140,
                        v133,
                        (uint64_t)v142,
                        v132,
                        (uint64_t)v143,
                        v131,
                        (uint64_t)v144,
                        v130,
                        a17,
                        v106,
                        v108,
                        v109,
                        v111,
                        v126,
                        v127,
                        (uint64_t)v147,
                        v128,
                        v118,
                        (uint64_t)v158,
                        (uint64_t)v159);

  sub_1A40D7778(v109, v111);
  sub_1A40D7778(v106, v108);
  sub_1A40D7778(v122, v123);
  return v124;
}

- (MSVehicle)initWithStore:(id)a3 colorHex:(id)a4 currentVehicleState:(id)a5 dateOfVehicleIngestion:(id)a6 displayName:(id)a7 headUnitBluetoothIdentifier:(id)a8 headUnitMacAddress:(id)a9 iapIdentifier:(id)a10 lastStateUpdateDate:(id)a11 licensePlate:(id)a12 lprPowerType:(id)a13 lprVehicleType:(id)a14 manufacturer:(id)a15 model:(id)a16 pairedAppIdentifier:(id)a17 positionIndex:(int64_t)a18 powerByConnector:(id)a19 preferredChargingNetworks:(id)a20 siriIntentsIdentifier:(id)a21 supportedConnectors:(id)a22 vehicleIdentifier:(id)a23 vehicleType:(id)a24 year:(id)a25
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  unint64_t v106;
  unint64_t v107;
  id v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  void *v128;
  id v129;
  uint64_t v130;
  id v131;
  void *v132;
  void *v133;
  id v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  unint64_t v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  MSVehicle *v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  uint64_t v153;
  unint64_t v154;

  v146 = a7;
  v135 = a6;
  v143 = self;
  v144 = a5;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v29 = MEMORY[0x1E0C80A78](v28);
  v153 = (uint64_t)&v120 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v29);
  v154 = (unint64_t)&v120 - v31;
  v147 = a8;
  if (a4)
  {
    v32 = sub_1A423C14C();
    v141 = v33;
    v142 = v32;
  }
  else
  {
    v141 = 0;
    v142 = 0;
  }
  v145 = a24;
  v150 = a23;
  v151 = a25;
  v152 = a22;
  v134 = a20;
  v148 = a19;
  v149 = a21;
  v140 = a3;
  v137 = a15;
  v138 = a16;
  v136 = a14;
  v133 = a13;
  v132 = a12;
  v129 = a11;
  v126 = a10;
  v128 = a9;
  if (v144)
  {
    v131 = v144;
    v34 = v135;
    v35 = v135;
    v36 = v146;
    v37 = v147;
    v38 = a9;
    v39 = a10;
    v40 = a11;
    v41 = a12;
    v42 = a13;
    v43 = a14;
    v44 = a15;
    v45 = a16;
    v46 = a17;
    v47 = a17;
    v48 = v148;
    v49 = v134;
    v50 = v134;
    v51 = v149;
    v52 = v152;
    v53 = v150;
    v54 = v145;
    v55 = v151;
    v144 = (id)sub_1A423BF54();
    v139 = v56;

    if (v34)
    {
LABEL_6:
      v57 = v154;
      sub_1A423BF84();

      v58 = sub_1A423BF9C();
      (*(void (**)(unint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v57, 0, 1, v58);
      goto LABEL_9;
    }
  }
  else
  {
    v34 = v135;
    v59 = v135;
    v60 = v146;
    v61 = v147;
    v62 = a9;
    v63 = a10;
    v64 = a11;
    v65 = a12;
    v66 = a13;
    v67 = a14;
    v68 = a15;
    v69 = a16;
    v46 = a17;
    v70 = a17;
    v71 = v148;
    v49 = v134;
    v72 = v134;
    v73 = v149;
    v74 = v152;
    v75 = v150;
    v76 = v145;
    v77 = v151;
    v144 = 0;
    v139 = 0xF000000000000000;
    if (v34)
      goto LABEL_6;
  }
  v78 = sub_1A423BF9C();
  (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 56))(v154, 1, 1, v78);
LABEL_9:
  v79 = v46;
  v81 = v136;
  v80 = v137;
  v82 = v133;
  v83 = v132;
  v84 = v129;
  v85 = v146;
  v86 = v147;
  v87 = v138;
  if (v146)
  {
    v88 = (void *)sub_1A423C14C();
    v134 = v89;
    v135 = v88;

  }
  else
  {
    v134 = 0;
    v135 = 0;
  }
  v90 = v128;
  if (v86)
  {
    v146 = (id)sub_1A423C14C();
    v131 = v91;

  }
  else
  {
    v146 = 0;
    v131 = 0;
  }
  v92 = v126;
  if (v90)
  {
    v147 = (id)sub_1A423C14C();
    v130 = v93;

    if (v92)
      goto LABEL_17;
LABEL_20:
    v128 = 0;
    v127 = 0;
    if (v84)
      goto LABEL_18;
    goto LABEL_21;
  }
  v147 = 0;
  v130 = 0;
  if (!v126)
    goto LABEL_20;
LABEL_17:
  v128 = (void *)sub_1A423C14C();
  v127 = v94;

  if (v84)
  {
LABEL_18:
    v95 = v153;
    sub_1A423BF84();

    v96 = sub_1A423BF9C();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v96 - 8) + 56))(v95, 0, 1, v96);
    goto LABEL_22;
  }
LABEL_21:
  v97 = sub_1A423BF9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v97 - 8) + 56))(v153, 1, 1, v97);
LABEL_22:
  v98 = v149;
  if (v83)
  {
    v149 = (id)sub_1A423C14C();
    v129 = v99;

    if (v82)
      goto LABEL_24;
  }
  else
  {
    v149 = 0;
    v129 = 0;
    if (v82)
    {
LABEL_24:
      v132 = (void *)sub_1A423C14C();
      v126 = v100;

      if (v81)
        goto LABEL_25;
      goto LABEL_34;
    }
  }
  v132 = 0;
  v126 = 0;
  if (v81)
  {
LABEL_25:
    v133 = (void *)sub_1A423C14C();
    v125 = v101;

    if (v80)
      goto LABEL_26;
    goto LABEL_35;
  }
LABEL_34:
  v133 = 0;
  v125 = 0;
  if (v80)
  {
LABEL_26:
    v136 = (void *)sub_1A423C14C();
    v124 = v102;

    if (v87)
      goto LABEL_27;
    goto LABEL_36;
  }
LABEL_35:
  v136 = 0;
  v124 = 0;
  if (v87)
  {
LABEL_27:
    v137 = (void *)sub_1A423C14C();
    v123 = v103;

    if (v79)
      goto LABEL_28;
    goto LABEL_37;
  }
LABEL_36:
  v137 = 0;
  v123 = 0;
  if (v79)
  {
LABEL_28:
    v138 = (void *)sub_1A423C14C();
    v122 = v104;

    v105 = v148;
    if (v148)
      goto LABEL_29;
    goto LABEL_38;
  }
LABEL_37:
  v138 = 0;
  v122 = 0;
  v105 = v148;
  if (v148)
  {
LABEL_29:
    v121 = sub_1A423BF54();
    v107 = v106;

    v108 = v145;
    if (v49)
      goto LABEL_30;
LABEL_39:
    v109 = 0;
    v111 = 0xF000000000000000;
    if (v98)
      goto LABEL_31;
    goto LABEL_40;
  }
LABEL_38:
  v121 = 0;
  v107 = 0xF000000000000000;
  v108 = v145;
  if (!v49)
    goto LABEL_39;
LABEL_30:
  v109 = sub_1A423BF54();
  v111 = v110;

  if (v98)
  {
LABEL_31:
    v112 = sub_1A423C14C();
    v114 = v113;

    goto LABEL_41;
  }
LABEL_40:
  v112 = 0;
  v114 = 0;
LABEL_41:
  v115 = v150;
  if (v150)
  {
    v116 = sub_1A423C14C();
    v118 = v117;

  }
  else
  {
    v116 = 0;
    v118 = 0;
  }
  return (MSVehicle *)Vehicle.init(store:colorHex:currentVehicleState:dateOfVehicleIngestion:displayName:headUnitBluetoothIdentifier:headUnitMacAddress:iapIdentifier:lastStateUpdateDate:licensePlate:lprPowerType:lprVehicleType:manufacturer:model:pairedAppIdentifier:positionIndex:powerByConnector:preferredChargingNetworks:siriIntentsIdentifier:supportedConnectors:vehicleIdentifier:vehicleType:year:)(v140, v142, v141, (uint64_t)v144, v139, v154, (uint64_t)v135, (uint64_t)v134, (uint64_t)v146, (uint64_t)v131, (uint64_t)v147, v130, (uint64_t)v128, v127, v153, (uint64_t)v149, (uint64_t)v129, (uint64_t)v132, (uint64_t)v126,
                        (uint64_t)v133,
                        v125,
                        (uint64_t)v136,
                        v124,
                        (uint64_t)v137,
                        v123,
                        (uint64_t)v138,
                        v122,
                        a18,
                        v121,
                        v107,
                        v109,
                        v111,
                        v112,
                        v114,
                        v152,
                        v116,
                        v118,
                        v108,
                        v151);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedVehicle();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSVehicle *v7;

  v6 = a3;
  v7 = self;
  sub_1A41C25DC(v6, a4);

}

- (NSString)colorHex
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C3054);
}

- (void)setColorHex:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41C9938);
}

- (NSData)currentVehicleState
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A41C33D4);
}

- (void)setCurrentVehicleState:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A41C9B20);
}

- (NSDate)dateOfVehicleIngestion
{
  return (NSDate *)sub_1A4193E08(self, (uint64_t)a2, (void (*)(void))sub_1A41C3778);
}

- (void)setDateOfVehicleIngestion:(id)a3
{
  sub_1A411BCA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1A41C3B68);
}

- (NSString)displayName
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C3E28);
}

- (void)setDisplayName:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41C9D58);
}

- (NSString)headUnitBluetoothIdentifier
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C41A8);
}

- (void)setHeadUnitBluetoothIdentifier:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41C9F40);
}

- (NSString)headUnitMacAddress
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C4528);
}

- (void)setHeadUnitMacAddress:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41CA128);
}

- (NSString)iapIdentifier
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C48A8);
}

- (void)setIapIdentifier:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41CA310);
}

- (NSDate)lastStateUpdateDate
{
  return (NSDate *)sub_1A4193E08(self, (uint64_t)a2, (void (*)(void))sub_1A41C4C28);
}

- (void)setLastStateUpdateDate:(id)a3
{
  sub_1A411BCA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1A41C5018);
}

- (NSString)licensePlate
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C5648);
}

- (void)setLicensePlate:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41CA590);
}

- (NSString)lprPowerType
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C59C8);
}

- (void)setLprPowerType:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41CA778);
}

- (NSString)lprVehicleType
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C5D48);
}

- (void)setLprVehicleType:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41CA960);
}

- (NSString)manufacturer
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C60C8);
}

- (void)setManufacturer:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41CAB48);
}

- (NSString)model
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C6448);
}

- (void)setModel:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41CAD30);
}

- (NSString)pairedAppIdentifier
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C67C8);
}

- (void)setPairedAppIdentifier:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41CAF18);
}

- (int64_t)positionIndex
{
  void *v2;
  MSVehicle *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSVehicle__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  MSVehicle *v4;

  v4 = self;
  sub_1A41C6C38(a3);

}

- (NSData)powerByConnector
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A41C6EB0);
}

- (void)setPowerByConnector:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A41CB13C);
}

- (NSData)preferredChargingNetworks
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A41C7254);
}

- (void)setPreferredChargingNetworks:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A41CB330);
}

- (NSString)siriIntentsIdentifier
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C77D0);
}

- (void)setSiriIntentsIdentifier:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41CB524);
}

- (NSNumber)supportedConnectors
{
  MSVehicle *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A41C7B74();

  return (NSNumber *)v3;
}

- (void)setSupportedConnectors:(id)a3
{
  MSVehicle *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A41CB70C(a3);

}

- (NSString)vehicleIdentifier
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41C7F14);
}

- (void)setVehicleIdentifier:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41CB8E0);
}

- (NSNumber)vehicleType
{
  MSVehicle *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A41C8488();

  return (NSNumber *)v3;
}

- (void)setVehicleType:(id)a3
{
  MSVehicle *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A41CBAC8(a3);

}

- (NSNumber)year
{
  MSVehicle *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A41C884C();

  return (NSNumber *)v3;
}

- (void)setYear:(id)a3
{
  MSVehicle *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A41CBC9C(a3);

}

- (MSVehicle)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  v8 = a3;
  return (MSVehicle *)sub_1A41C8D94(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSVehicle__currentVehicleState), *(_QWORD *)&self->super._store[OBJC_IVAR___MSVehicle__currentVehicleState]);
  sub_1A40F1680((uint64_t)self + OBJC_IVAR___MSVehicle__dateOfVehicleIngestion);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A40F1680((uint64_t)self + OBJC_IVAR___MSVehicle__lastStateUpdateDate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSVehicle__powerByConnector), *(_QWORD *)&self->super._store[OBJC_IVAR___MSVehicle__powerByConnector]);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSVehicle__preferredChargingNetworks), *(_QWORD *)&self->super._store[OBJC_IVAR___MSVehicle__preferredChargingNetworks]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
