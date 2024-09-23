@implementation CalRecurrenceRuleDescriptionGenerator

+ (id)localizedOfMonthStringForMonth:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "intValue");

  if ((v6 - 1) > 0xB)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", off_1E2A85250[v6 - 1], &stru_1E2A86598, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)humanReadableDescriptionWithStartDate:(id)a3 ofRecurrenceRuleICSString:(id)a4 isConcise:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  _BOOL4 v33;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  int v46;
  int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  int v51;
  int v52;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  const __CFString *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  uint64_t v94;
  const __CFString *v95;
  void *v96;
  uint64_t v97;
  unint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  BOOL v102;
  void *v103;
  const __CFString *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  const __CFString *v109;
  const __CFString *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  const __CFString *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  const __CFString *v118;
  const __CFString *v119;
  const __CFString *v120;
  void *v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  void *v125;
  void *v126;
  uint64_t v127;
  int v128;
  int v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  const __CFString *v137;
  void *v138;
  const __CFString *v139;
  const __CFString *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  const __CFString *v145;
  void *v146;
  void *v147;
  const __CFString *v148;
  const __CFString *v149;
  void *v150;
  const __CFString *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  id v164;
  id v165;
  _BOOL4 v166;
  _BOOL4 v167;
  id v168;
  id v169;
  uint64_t v170;
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
  id v183;
  void *v184;
  void *v185;
  id v186;
  unint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v183 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDB850], "recurrenceRuleFromICSString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 536, v7);
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "interval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = objc_msgSend(v11, "integerValue");

  v12 = objc_msgSend(v9, "freq");
  objc_msgSend(v9, "byday");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = v9;
  objc_msgSend(v9, "bymonth");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  if (!humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableWeekDayArray)
  {
    objc_msgSend(v183, "standaloneWeekdaySymbols");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    v15 = (void *)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableWeekDayArray;
    humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableWeekDayArray = v14;

    if (objc_msgSend((id)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableWeekDayArray, "count") != 7)
    {
      NSLog(CFSTR("-[NSDateFormatter weekdaySymbols] invalid, reverting to US dates"));
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("Sunday"), CFSTR("Monday"), CFSTR("Tuesday"), CFSTR("Wednesday"), CFSTR("Thursday"), CFSTR("Friday"), CFSTR("Saturday"), 0);
      v17 = (void *)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableWeekDayArray;
      humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableWeekDayArray = v16;

    }
  }
  if (!humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray)
  {
    objc_msgSend(v183, "standaloneMonthSymbols");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    v20 = (void *)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray;
    humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray = v19;

    if (objc_msgSend((id)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray, "count") != 12)
    {
      NSLog(CFSTR("-[NSDateFormatter monthSymbols] invalid, reverting to US dates"));
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("January"), CFSTR("February"), CFSTR("March"), CFSTR("April"), CFSTR("May"), CFSTR("June"), CFSTR("July"), CFSTR("August"), CFSTR("September"), CFSTR("October"), CFSTR("November"), CFSTR("December"), 0);
      v22 = (void *)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray;
      humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray = v21;

    }
  }
  switch(v12)
  {
    case 4:
      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = v170;
      if (v170 == 1)
      {
        if (v5)
          v25 = CFSTR("daily");
        else
          v25 = CFSTR("Event will occur every day.");
        goto LABEL_115;
      }
      if (v5)
        v70 = CFSTR("every %ld days");
      else
        v70 = CFSTR("Event will occur every %ld days.");
      goto LABEL_117;
    case 5:
      v26 = v188;
      if (!v188
        || objc_msgSend(v188, "count") == 1
        && (objc_msgSend(v188, "objectAtIndexedSubscript:", 0),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v27, "weekday"),
            v29 = objc_msgSend(v179, "weekday"),
            v27,
            v26 = v188,
            v28 == v29))
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = v170;
        if (v170 == 1)
        {
          if (v5)
            v25 = CFSTR("weekly");
          else
            v25 = CFSTR("Event will occur every week.");
LABEL_115:
          v105 = v180;
          objc_msgSend(v180, "localizedStringForKey:value:table:", v25, &stru_1E2A86598, 0);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v5)
            v70 = CFSTR("every %ld weeks");
          else
            v70 = CFSTR("Event will occur every %ld weeks.");
LABEL_117:
          v105 = v180;
          v107 = v24;
          objc_msgSend(v180, "localizedStringForKey:value:table:", v70, &stru_1E2A86598, 0);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v159 = v107;
        }
        v108 = v23;
        v74 = v105;
        objc_msgSend(v108, "localizedStringWithFormat:", v106, v159);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_253;
      }
      if (v170 != 1)
      {
        v71 = (void *)MEMORY[0x1E0CB3940];
        if (v5)
          v92 = CFSTR("every %ld weeks on %@");
        else
          v92 = CFSTR("Event will occur every %ld weeks on %@.");
        goto LABEL_251;
      }
      switch(objc_msgSend((id)objc_opt_class(), "daysTypeForDayArray:", v26))
      {
        case 0:
        case 3:
          v71 = (void *)MEMORY[0x1E0CB3940];
          if (v5)
            v72 = CFSTR("every week on %@");
          else
            v72 = CFSTR("Event will occur every week on %@.");
          goto LABEL_179;
        case 1:
          if (v5)
            v140 = CFSTR("every day");
          else
            v140 = CFSTR("Event will occur every day.");
          break;
        case 2:
          if (v5)
            v140 = CFSTR("every weekday");
          else
            v140 = CFSTR("Event will occur every weekday.");
          break;
        default:
          goto LABEL_79;
      }
      v74 = v180;
      objc_msgSend(v180, "localizedStringForKey:value:table:", v140, &stru_1E2A86598, 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_254;
    case 6:
      if (objc_msgSend(v182, "count"))
      {
        if (objc_msgSend(v182, "count"))
        {
LABEL_19:
          v166 = v5;
          v30 = v182;
          if (objc_msgSend(v30, "count") == 1)
          {
            objc_msgSend(v30, "objectAtIndex:", 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "integerValue");
            v33 = v32 == objc_msgSend(v179, "month");

          }
          else
          {
            v33 = 0;
          }
          if (!objc_msgSend(v188, "count") && (!objc_msgSend(v30, "count") || v33))
          {
            v35 = (void *)MEMORY[0x1E0CB3940];
            if (v170 < 2)
            {
              if (v166)
                v110 = CFSTR("yearly");
              else
                v110 = CFSTR("Event will occur every year.");
              v121 = v180;
              objc_msgSend(v180, "localizedStringForKey:value:table:", v110, &stru_1E2A86598, 0);
              v122 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v166)
                v36 = CFSTR("every %ld years");
              else
                v36 = CFSTR("Event will occur every %ld years.");
              v121 = v180;
              objc_msgSend(v180, "localizedStringForKey:value:table:", v36, &stru_1E2A86598, 0);
              v122 = objc_claimAutoreleasedReturnValue();
              v159 = v170;
            }
            v138 = v35;
            v74 = v121;
            v191 = (void *)v122;
            objc_msgSend(v138, "localizedStringWithFormat:", v159);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_248;
          }
          v168 = v8;
          v164 = v7;
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v30, "count");
          if (v37)
          {
            v38 = v37;
            v39 = 0;
            v186 = v30;
            while (1)
            {
              objc_msgSend(v30, "objectAtIndex:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v40;
              if (v39)
                break;
              if (objc_msgSend(v40, "integerValue") < 1 || objc_msgSend(v41, "integerValue") >= 13)
              {
                objc_msgSend(v191, "appendString:", CFSTR("???"));
              }
              else
              {
                objc_msgSend((id)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray, "objectAtIndex:", objc_msgSend(v41, "integerValue") - 1);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v191, "appendString:", v48);

              }
LABEL_65:

              if (v38 == ++v39)
                goto LABEL_66;
            }
            v42 = v39 + 1;
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43;
            if (v39 + 1 >= v38)
            {
              if (v38 == 2)
              {
                objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR(" and %@"), &stru_1E2A86598, 0);
                v45 = objc_claimAutoreleasedReturnValue();
                v47 = 0;
                v46 = 1;
                v173 = v44;
                v174 = (void *)v45;
              }
              else
              {
                objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Recurrence rule last item format.  The last part of a list: X, Y and Z. Here %@ is 'Z'"), CFSTR(", and %@"), 0);
                v45 = objc_claimAutoreleasedReturnValue();
                v46 = 0;
                v47 = 1;
                v171 = v44;
                v172 = (void *)v45;
              }
            }
            else
            {
              objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR(", %@"), &stru_1E2A86598, 0);
              v45 = objc_claimAutoreleasedReturnValue();
              v46 = 0;
              v47 = 0;
              v184 = v44;
              v185 = (void *)v45;
            }
            if (objc_msgSend(v41, "integerValue") < 1 || objc_msgSend(v41, "integerValue") >= 13)
            {
              objc_msgSend(v191, "appendFormat:", v45, CFSTR("???"));
              if (!v47)
                goto LABEL_48;
            }
            else
            {
              objc_msgSend((id)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray, "objectAtIndex:", objc_msgSend(v41, "integerValue") - 1);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v191, "appendFormat:", v45, v49);

              if (!v47)
              {
LABEL_48:
                if (v46)
                {

                }
                if (v42 >= v38)
                {
                  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = v53;
                  if (v38 == 2)
                  {
                    objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR(" and %@"), &stru_1E2A86598, 0);
                    v50 = objc_claimAutoreleasedReturnValue();
                    v52 = 0;
                    v51 = 1;
                    v177 = v54;
                    v178 = (void *)v50;
                  }
                  else
                  {
                    objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("Recurrence rule last item format.  The last part of a list: X, Y and Z. Here %@ is 'Z'"), CFSTR(", and %@"), 0);
                    v50 = objc_claimAutoreleasedReturnValue();
                    v51 = 0;
                    v52 = 1;
                    v175 = v54;
                    v176 = (void *)v50;
                  }
                }
                else
                {

                  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                  v7 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR(", %@"), &stru_1E2A86598, 0);
                  v50 = objc_claimAutoreleasedReturnValue();
                  v51 = 0;
                  v52 = 0;
                  v8 = (id)v50;
                }
                if (objc_msgSend(v41, "integerValue") < 1 || objc_msgSend(v41, "integerValue") >= 13)
                {
                  objc_msgSend(v189, "appendFormat:", v50, CFSTR("???"));
                  if (!v52)
                  {
LABEL_61:
                    if (v51)
                    {

                    }
                    v30 = v186;
                    if (v42 < v38)
                    {

                    }
                    goto LABEL_65;
                  }
                }
                else
                {
                  objc_msgSend((id)humanReadableDescriptionWithStartDate_ofRecurrenceRuleICSString_isConcise__readableMonthArray, "objectAtIndex:", objc_msgSend(v41, "integerValue") - 1);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v189, "appendFormat:", v50, v55);

                  if (!v52)
                    goto LABEL_61;
                }

                goto LABEL_61;
              }
            }

            goto LABEL_48;
          }
LABEL_66:
          objc_msgSend(MEMORY[0x1E0CB3940], "string");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v30, "count"))
          {
            v57 = (void *)objc_opt_class();
            objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "localizedOfMonthStringForMonth:", v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v59, CFSTR("%@"), 0, v189);
            v60 = objc_claimAutoreleasedReturnValue();

            v56 = (void *)v60;
          }
          objc_msgSend(v181, "bysetpos");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "count");

          if (v62)
          {
            v63 = (void *)objc_opt_class();
            objc_msgSend(v181, "bysetpos");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "objectAtIndex:", 0);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "_weekDayPositionAsString:", objc_msgSend(v65, "integerValue"));
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            v67 = objc_msgSend(v30, "count");
            v68 = (void *)MEMORY[0x1E0CB3940];
            if (v67)
            {
              v8 = v168;
              if (v170 != 1)
              {
                if (v166)
                  v93 = CFSTR("every %ld years on the %@ %@ %@");
                else
                  v93 = CFSTR("every n years on a specific day of months");
                objc_msgSend(v180, "localizedStringForKey:value:table:", v93, &stru_1E2A86598, 0);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)objc_opt_class(), "_orDaysOfWeekString:", v188);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "localizedStringWithFormat:", v111, v170, v66, v113, v56);
                goto LABEL_144;
              }
              if (v166)
                v69 = CFSTR("every year on the %@ %@ %@");
              else
                v69 = CFSTR("Event will occur every year on the %@ %@ %@.");
              objc_msgSend(v180, "localizedStringForKey:value:table:", v69, &stru_1E2A86598, 0);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "_orDaysOfWeekString:", v188);
              v112 = objc_claimAutoreleasedReturnValue();
              v113 = (void *)v112;
              v162 = v56;
            }
            else
            {
              v8 = v168;
              if (v170 != 1)
              {
                if (v166)
                  v109 = CFSTR("every n years on a specific day of the year concise");
                else
                  v109 = CFSTR("every n years on a specific day of the year");
                objc_msgSend(v180, "localizedStringForKey:value:table:", v109, &stru_1E2A86598, 0);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)objc_opt_class(), "_orDaysOfWeekString:", v188);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "localizedStringWithFormat:", v111, v170, v66, v113, v163);
                goto LABEL_144;
              }
              if (v166)
              {
                v90 = CFSTR("every year on a specific day of the year concise");
                v91 = CFSTR("every year on the %@ %@");
              }
              else
              {
                v90 = CFSTR("every year on a specific day of the year");
                v91 = CFSTR("Event will occur every year on the %@ %@.");
              }
              objc_msgSend(v180, "localizedStringForKey:value:table:", v90, v91, 0);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "_orDaysOfWeekString:", v188);
              v112 = objc_claimAutoreleasedReturnValue();
              v113 = (void *)v112;
            }
            objc_msgSend(v68, "localizedStringWithFormat:", v111, v66, v112, v162, v163);
LABEL_144:
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v164;
LABEL_247:

            v74 = v180;
LABEL_248:

            goto LABEL_254;
          }
          objc_msgSend(v188, "objectAtIndex:", 0);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "number");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "integerValue");

          if (v77)
          {
            v78 = objc_msgSend(v30, "count");
            v79 = (void *)MEMORY[0x1E0CB3940];
            v7 = v164;
            v8 = v168;
            if (v78)
            {
              if (v170 != 1)
              {
                if (v166)
                  v119 = CFSTR("every %ld years on the %@ %@");
                else
                  v119 = CFSTR("Event will occur every %ld years on the %@ %@.");
                objc_msgSend(v180, "localizedStringForKey:value:table:", v119, &stru_1E2A86598, 0);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v188);
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "localizedStringWithFormat:", v66, v170, v144, v56);
                goto LABEL_246;
              }
              if (v166)
                v80 = CFSTR("every year on the %@ %@");
              else
                v80 = CFSTR("Event will occur every year on the %@ %@.");
              objc_msgSend(v180, "localizedStringForKey:value:table:", v80, &stru_1E2A86598, 0);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v188);
              v143 = objc_claimAutoreleasedReturnValue();
              v144 = (void *)v143;
              v161 = v56;
              goto LABEL_242;
            }
            if (v170 == 1)
            {
              if (v166)
                v114 = CFSTR("every year on the %@");
              else
                v114 = CFSTR("Event will occur every year on the %@.");
              v152 = v180;
LABEL_241:
              objc_msgSend(v152, "localizedStringForKey:value:table:", v114, &stru_1E2A86598, 0);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v188);
              v143 = objc_claimAutoreleasedReturnValue();
              v144 = (void *)v143;
LABEL_242:
              objc_msgSend(v79, "localizedStringWithFormat:", v66, v143, v161, v162);
LABEL_246:
              v73 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_247;
            }
            if (v166)
              v139 = CFSTR("every %ld years on the %@");
            else
              v139 = CFSTR("Event will occur every %ld years on the %@.");
            v153 = v180;
            goto LABEL_245;
          }
          v7 = v164;
          v8 = v168;
          if (objc_msgSend(v188, "count"))
          {
            v94 = objc_msgSend(v30, "count");
            v79 = (void *)MEMORY[0x1E0CB3940];
            if (v94)
            {
              if (v170 != 1)
              {
                if (v166)
                  v149 = CFSTR("every %ld years on every %@ in %@");
                else
                  v149 = CFSTR("Event will occur every %ld years on every %@ in %@.");
                objc_msgSend(v180, "localizedStringForKey:value:table:", v149, &stru_1E2A86598, 0);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v188);
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "localizedStringWithFormat:", v66, v170, v144, v191);
                goto LABEL_246;
              }
              if (v166)
                v95 = CFSTR("every year on every %@ in %@");
              else
                v95 = CFSTR("Event will occur every year on every %@ in %@.");
              objc_msgSend(v180, "localizedStringForKey:value:table:", v95, &stru_1E2A86598, 0);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v188);
              v143 = objc_claimAutoreleasedReturnValue();
              v144 = (void *)v143;
              v161 = v191;
              goto LABEL_242;
            }
            if (v170 == 1)
            {
              if (v166)
                v114 = CFSTR("every year on every %@");
              else
                v114 = CFSTR("Event will occur every year on every %@.");
              v152 = v180;
              goto LABEL_241;
            }
            if (v166)
              v139 = CFSTR("every %ld years on every %@");
            else
              v139 = CFSTR("Event will occur every %ld years on every %@.");
            v153 = v180;
LABEL_245:
            objc_msgSend(v153, "localizedStringForKey:value:table:", v139, &stru_1E2A86598, 0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v188);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "localizedStringWithFormat:", v66, v170, v144, v162);
            goto LABEL_246;
          }
          if (v170 == 1)
          {
            if (v166)
            {
              objc_msgSend(v180, "localizedStringForKey:value:table:", CFSTR("every year in %@"), &stru_1E2A86598, 0);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v66, v191, v161);
LABEL_236:
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_247;
            }
            v150 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v180, "localizedStringForKey:value:table:", CFSTR("Event will occur every year in %@."), &stru_1E2A86598, 0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = v191;
          }
          else
          {
            v150 = (void *)MEMORY[0x1E0CB3940];
            if (v166)
              v151 = CFSTR("every %ld years in %@");
            else
              v151 = CFSTR("Event will occur every %ld years in %@.");
            objc_msgSend(v180, "localizedStringForKey:value:table:", v151, &stru_1E2A86598, 0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v161 = v191;
            v156 = (void *)v170;
          }
          objc_msgSend(v150, "localizedStringWithFormat:", v66, v156, v161);
          goto LABEL_236;
        }
LABEL_79:
        v73 = 0;
LABEL_80:
        v74 = v180;
        goto LABEL_254;
      }
      if (!objc_msgSend(v188, "count"))
      {
        objc_msgSend(v181, "bymonthday");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "count");
        v192 = v96;
        if (!v96)
          goto LABEL_111;
        v98 = v97;
        if (v97 != 1)
          goto LABEL_147;
        objc_msgSend(v96, "objectAtIndex:", 0);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v99, "integerValue");
        v96 = v7;
        v101 = objc_msgSend(v179, "day");

        v102 = v100 == v101;
        v7 = v96;
        if (v102)
        {
LABEL_111:
          v103 = (void *)MEMORY[0x1E0CB3940];
          if (v170 == 1)
          {
            v74 = v180;
            if (v5)
              v104 = CFSTR("monthly");
            else
              v104 = CFSTR("Event will occur every month.");
            objc_msgSend(v180, "localizedStringForKey:value:table:", v104, &stru_1E2A86598, 0);
            v154 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v74 = v180;
            if (v5)
              v145 = CFSTR("every %ld months");
            else
              v145 = CFSTR("Event will occur every %ld months.");
            objc_msgSend(v180, "localizedStringForKey:value:table:", v145, &stru_1E2A86598, 0);
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            v159 = v170;
          }
          objc_msgSend(v103, "localizedStringWithFormat:", v154, v159);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_147:
          v167 = v5;
          v165 = v7;
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          if (v98)
          {
            v123 = 0;
            v187 = v98;
            v169 = v8;
            do
            {
              if (v123)
              {
                v124 = v123 + 1;
                objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                v126 = v125;
                if (v123 + 1 >= v98)
                {
                  if (v98 == 2)
                  {
                    objc_msgSend(v125, "localizedStringForKey:value:table:", CFSTR(" and %@"), &stru_1E2A86598, 0);
                    v127 = objc_claimAutoreleasedReturnValue();
                    v129 = 0;
                    v128 = 1;
                    v130 = v96;
                    v131 = (void *)v5;
                    v184 = (void *)v127;
                    v185 = v126;
                  }
                  else
                  {
                    objc_msgSend(v125, "localizedStringForKey:value:table:", CFSTR("Recurrence rule last item format.  The last part of a list: X, Y and Z. Here %@ is 'Z'"), CFSTR(", and %@"), 0);
                    v127 = objc_claimAutoreleasedReturnValue();
                    v128 = 0;
                    v129 = 1;
                    v130 = v96;
                    v131 = (void *)v5;
                    v177 = (void *)v127;
                    v178 = v126;
                  }
                }
                else
                {
                  objc_msgSend(v125, "localizedStringForKey:value:table:", CFSTR(", %@"), &stru_1E2A86598, 0);
                  v127 = objc_claimAutoreleasedReturnValue();
                  v128 = 0;
                  v129 = 0;
                  v130 = v126;
                  v131 = (void *)v127;
                }
                v133 = (void *)objc_opt_class();
                objc_msgSend(v192, "objectAtIndex:", v123);
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v133, "_dayOfMonthAsString:", objc_msgSend(v134, "integerValue"));
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v190, "appendFormat:", v127, v135);

                if (v129)
                {

                }
                v8 = v169;
                if (v128)
                {

                }
                v96 = v130;
                v5 = (_BOOL8)v131;
                v98 = v187;
                if (v124 >= v187)
                  goto LABEL_162;
              }
              else
              {
                v132 = (void *)objc_opt_class();
                objc_msgSend(v192, "objectAtIndex:", 0);
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v132, "_dayOfMonthAsString:", objc_msgSend(v130, "integerValue"));
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v190, "appendString:", v131);
                v124 = 1;
              }

              v130 = v96;
              v131 = (void *)v5;
LABEL_162:
              v5 = (_BOOL8)v131;
              v96 = v130;
              v123 = v124;
            }
            while (v124 != v98);
          }
          v136 = (void *)MEMORY[0x1E0CB3940];
          if (v170 == 1)
          {
            if (v167)
              v137 = CFSTR("every month on the %@");
            else
              v137 = CFSTR("Event will occur every month on the %@.");
            v74 = v180;
            objc_msgSend(v180, "localizedStringForKey:value:table:", v137, &stru_1E2A86598, 0);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v154 = v190;
            objc_msgSend(v136, "localizedStringWithFormat:", v155, v190, v161);
          }
          else
          {
            if (v167)
              v148 = CFSTR("every %ld months on the %@");
            else
              v148 = CFSTR("Event will occur every %ld months on the %@.");
            v74 = v180;
            objc_msgSend(v180, "localizedStringForKey:value:table:", v148, &stru_1E2A86598, 0);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v154 = v190;
            objc_msgSend(v136, "localizedStringWithFormat:", v155, v170, v190);
          }
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v165;
        }

        goto LABEL_254;
      }
      objc_msgSend(v181, "bysetpos");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "count");

      if (v82)
      {
        v83 = (void *)objc_opt_class();
        objc_msgSend(v181, "bysetpos");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "objectAtIndex:", 0);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "_weekDayPositionAsString:", objc_msgSend(v85, "integerValue"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        v87 = (void *)MEMORY[0x1E0CB3940];
        if (v170 == 1)
        {
          if (v5)
          {
            v88 = v7;
            v89 = CFSTR("every month on the %@ %@");
          }
          else
          {
            v88 = v7;
            v89 = CFSTR("Event will occur every month on the %@ %@.");
          }
          objc_msgSend(v180, "localizedStringForKey:value:table:", v89, &stru_1E2A86598, 0);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_orDaysOfWeekString:", v188);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "localizedStringWithFormat:", v146, v86, v147, v162);
        }
        else
        {
          if (v5)
          {
            v88 = v7;
            v120 = CFSTR("every %ld months on the %@ %@");
          }
          else
          {
            v88 = v7;
            v120 = CFSTR("Event will occur every %ld months on the %@ %@.");
          }
          objc_msgSend(v180, "localizedStringForKey:value:table:", v120, &stru_1E2A86598, 0);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_orDaysOfWeekString:", v188);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "localizedStringWithFormat:", v146, v170, v86, v147);
        }
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v88;
        goto LABEL_80;
      }
      objc_msgSend(v188, "objectAtIndex:", 0);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "number");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v116, "integerValue");

      v71 = (void *)MEMORY[0x1E0CB3940];
      if (v117)
      {
        if (v170 == 1)
        {
          if (v5)
          {
            v72 = CFSTR("every month on the %@-XX01");
            v118 = CFSTR("every month on the %@");
          }
          else
          {
            v72 = CFSTR("Event will occur every month on the %@-XX01.");
            v118 = CFSTR("Event will occur every month on the %@.");
          }
LABEL_180:
          v141 = v180;
          objc_msgSend(v180, "localizedStringForKey:value:table:", v72, v118, 0);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v188);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          v160 = v142;
          goto LABEL_252;
        }
        if (v5)
          v92 = CFSTR("every %ld months on the %@-XX01");
        else
          v92 = CFSTR("Event will occur every %ld months on the %@-XX01.");
      }
      else
      {
        if (v170 == 1)
        {
          if (v5)
            v72 = CFSTR("every month on %@");
          else
            v72 = CFSTR("Event will occur every month on %@.");
LABEL_179:
          v118 = &stru_1E2A86598;
          goto LABEL_180;
        }
        if (v5)
          v92 = CFSTR("every %ld months on %@");
        else
          v92 = CFSTR("Event will occur every %ld months on %@.");
      }
LABEL_251:
      v141 = v180;
      objc_msgSend(v180, "localizedStringForKey:value:table:", v92, &stru_1E2A86598, 0);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_andDaysOfWeekString:", v188);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = (void *)v170;
      v161 = v142;
LABEL_252:
      v157 = v71;
      v74 = v141;
      objc_msgSend(v157, "localizedStringWithFormat:", v106, v160, v161);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_253:
LABEL_254:

      return v73;
    case 7:
      goto LABEL_19;
    default:
      goto LABEL_79;
  }
}

+ (id)_andDaysOfWeekString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        ++v7;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v7 >= v6)
        {
          if (v6 == 2)
          {
            objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR(" and %@"), &stru_1E2A86598, 0);
            v11 = objc_claimAutoreleasedReturnValue();
            v13 = 0;
            v12 = 1;
            v19 = v10;
            v20 = (void *)v11;
          }
          else
          {
            objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Recurrence rule last item format.  The last part of a list: X, Y and Z. Here %@ is 'Z'"), CFSTR(", and %@"), 0);
            v11 = objc_claimAutoreleasedReturnValue();
            v12 = 0;
            v13 = 1;
            v17 = v10;
            v18 = (void *)v11;
          }
        }
        else
        {
          objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR(", %@"), &stru_1E2A86598, 0);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v13 = 0;
          v21 = v10;
          v22 = (void *)v11;
        }
        objc_msgSend((id)objc_opt_class(), "_numberedWeekDayString:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", v11, v15);

        if (v13)
        {

        }
        if (v12)
        {

        }
        if (v7 >= v6)
          goto LABEL_17;

        v14 = v21;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "_numberedWeekDayString:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v14);
        v7 = 1;
      }

LABEL_17:
    }
    while (v7 != v6);
  }

  return v4;
}

+ (id)_numberedWeekDayString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "weekday");
  objc_msgSend(v4, "number");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_daysOfWeek");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "_weekDayPositionAsString:", objc_msgSend(v7, "integerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@ %@"), &stru_1E2A86598, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v10, v9);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v9;
  }

  return v13;
}

+ (id)_daysOfWeek
{
  if (_daysOfWeek_onceToken != -1)
    dispatch_once(&_daysOfWeek_onceToken, &__block_literal_global_29);
  return (id)_daysOfWeek_sDaysOfWeek;
}

void __52__CalRecurrenceRuleDescriptionGenerator__daysOfWeek__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "standaloneWeekdaySymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  if (objc_msgSend(v1, "count") == 7)
  {
    objc_msgSend(v1, "insertObject:atIndex:", &stru_1E2A86598, 0);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v1);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSLog(CFSTR("-[NSDateFormatter weekdaySymbols] invalid, reverting to US dates"));
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &stru_1E2A86598, CFSTR("Sunday"), CFSTR("Monday"), CFSTR("Tuesday"), CFSTR("Wednesday"), CFSTR("Thursday"), CFSTR("Friday"), CFSTR("Saturday"), 0);
  }
  v3 = (void *)_daysOfWeek_sDaysOfWeek;
  _daysOfWeek_sDaysOfWeek = v2;

}

+ (id)_dayOfMonthAsString:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = &stru_1E2A86598;
  switch(a3)
  {
    case -1:
      v7 = CFSTR("last day");
      v8 = &stru_1E2A86598;
      goto LABEL_34;
    case 1:
      v7 = CFSTR("1st-XX01");
      v8 = CFSTR("1st");
      goto LABEL_34;
    case 2:
      v7 = CFSTR("2nd-XX01");
      v8 = CFSTR("2nd");
      goto LABEL_34;
    case 3:
      v7 = CFSTR("3rd-XX01");
      v8 = CFSTR("3rd");
      goto LABEL_34;
    case 4:
      v7 = CFSTR("4th-XX01");
      v8 = CFSTR("4th");
      goto LABEL_34;
    case 5:
      v7 = CFSTR("5th-XX01");
      v8 = CFSTR("5th");
      goto LABEL_34;
    case 6:
      v7 = CFSTR("6th-XX01");
      v8 = CFSTR("6th");
      goto LABEL_34;
    case 7:
      v7 = CFSTR("7th-XX01");
      v8 = CFSTR("7th");
      goto LABEL_34;
    case 8:
      v7 = CFSTR("8th-XX01");
      v8 = CFSTR("8th");
      goto LABEL_34;
    case 9:
      v7 = CFSTR("9th-XX01");
      v8 = CFSTR("9th");
      goto LABEL_34;
    case 10:
      v7 = CFSTR("10th-XX01");
      v8 = CFSTR("10th");
      goto LABEL_34;
    case 11:
      v7 = CFSTR("11th-XX01");
      v8 = CFSTR("11th");
      goto LABEL_34;
    case 12:
      v7 = CFSTR("12th-XX01");
      v8 = CFSTR("12th");
      goto LABEL_34;
    case 13:
      v7 = CFSTR("13th-XX01");
      v8 = CFSTR("13th");
      goto LABEL_34;
    case 14:
      v7 = CFSTR("14th-XX01");
      v8 = CFSTR("14th");
      goto LABEL_34;
    case 15:
      v7 = CFSTR("15th-XX01");
      v8 = CFSTR("15th");
      goto LABEL_34;
    case 16:
      v7 = CFSTR("16th-XX01");
      v8 = CFSTR("16th");
      goto LABEL_34;
    case 17:
      v7 = CFSTR("17th-XX01");
      v8 = CFSTR("17th");
      goto LABEL_34;
    case 18:
      v7 = CFSTR("18th-XX01");
      v8 = CFSTR("18th");
      goto LABEL_34;
    case 19:
      v7 = CFSTR("19th-XX01");
      v8 = CFSTR("19th");
      goto LABEL_34;
    case 20:
      v7 = CFSTR("20th-XX01");
      v8 = CFSTR("20th");
      goto LABEL_34;
    case 21:
      v7 = CFSTR("21st-XX01");
      v8 = CFSTR("21st");
      goto LABEL_34;
    case 22:
      v7 = CFSTR("22nd-XX01");
      v8 = CFSTR("22nd");
      goto LABEL_34;
    case 23:
      v7 = CFSTR("23rd-XX01");
      v8 = CFSTR("23rd");
      goto LABEL_34;
    case 24:
      v7 = CFSTR("24th-XX01");
      v8 = CFSTR("24th");
      goto LABEL_34;
    case 25:
      v7 = CFSTR("25th-XX01");
      v8 = CFSTR("25th");
      goto LABEL_34;
    case 26:
      v7 = CFSTR("26th-XX01");
      v8 = CFSTR("26th");
      goto LABEL_34;
    case 27:
      v7 = CFSTR("27th-XX01");
      v8 = CFSTR("27th");
      goto LABEL_34;
    case 28:
      v7 = CFSTR("28th-XX01");
      v8 = CFSTR("28th");
      goto LABEL_34;
    case 29:
      v7 = CFSTR("29th-XX01");
      v8 = CFSTR("29th");
      goto LABEL_34;
    case 30:
      v7 = CFSTR("30th-XX01");
      v8 = CFSTR("30th");
      goto LABEL_34;
    case 31:
      v7 = CFSTR("31st-XX01");
      v8 = CFSTR("31st");
LABEL_34:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v7, v8, CFSTR("RecurrenceRule"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v6;
}

+ (id)_weekDayPositionAsString:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = &stru_1E2A86598;
  switch(a3)
  {
    case -2:
      v7 = CFSTR("next to last");
      goto LABEL_4;
    case -1:
      v7 = CFSTR("last");
LABEL_4:
      v8 = &stru_1E2A86598;
      goto LABEL_58;
    case 1:
      v7 = CFSTR("1st-XX02");
      v8 = CFSTR("1st");
      goto LABEL_58;
    case 2:
      v7 = CFSTR("2nd-XX02");
      v8 = CFSTR("2nd");
      goto LABEL_58;
    case 3:
      v7 = CFSTR("3rd-XX02");
      v8 = CFSTR("3rd");
      goto LABEL_58;
    case 4:
      v7 = CFSTR("4th-XX02");
      v8 = CFSTR("4th");
      goto LABEL_58;
    case 5:
      v7 = CFSTR("5th-XX02");
      v8 = CFSTR("5th");
      goto LABEL_58;
    case 6:
      v7 = CFSTR("6th-XX02");
      v8 = CFSTR("6th");
      goto LABEL_58;
    case 7:
      v7 = CFSTR("7th-XX02");
      v8 = CFSTR("7th");
      goto LABEL_58;
    case 8:
      v7 = CFSTR("8th-XX02");
      v8 = CFSTR("8th");
      goto LABEL_58;
    case 9:
      v7 = CFSTR("9th-XX02");
      v8 = CFSTR("9th");
      goto LABEL_58;
    case 10:
      v7 = CFSTR("10th-XX02");
      v8 = CFSTR("10th");
      goto LABEL_58;
    case 11:
      v7 = CFSTR("11th-XX02");
      v8 = CFSTR("11th");
      goto LABEL_58;
    case 12:
      v7 = CFSTR("12th-XX02");
      v8 = CFSTR("12th");
      goto LABEL_58;
    case 13:
      v7 = CFSTR("13th-XX02");
      v8 = CFSTR("13th");
      goto LABEL_58;
    case 14:
      v7 = CFSTR("14th-XX02");
      v8 = CFSTR("14th");
      goto LABEL_58;
    case 15:
      v7 = CFSTR("15th-XX02");
      v8 = CFSTR("15th");
      goto LABEL_58;
    case 16:
      v7 = CFSTR("16th-XX02");
      v8 = CFSTR("16th");
      goto LABEL_58;
    case 17:
      v7 = CFSTR("17th-XX02");
      v8 = CFSTR("17th");
      goto LABEL_58;
    case 18:
      v7 = CFSTR("18th-XX02");
      v8 = CFSTR("18th");
      goto LABEL_58;
    case 19:
      v7 = CFSTR("19th-XX02");
      v8 = CFSTR("19th");
      goto LABEL_58;
    case 20:
      v7 = CFSTR("20th-XX02");
      v8 = CFSTR("20th");
      goto LABEL_58;
    case 21:
      v7 = CFSTR("21st-XX02");
      v8 = CFSTR("21st");
      goto LABEL_58;
    case 22:
      v7 = CFSTR("22nd-XX02");
      v8 = CFSTR("22nd");
      goto LABEL_58;
    case 23:
      v7 = CFSTR("23rd-XX02");
      v8 = CFSTR("23rd");
      goto LABEL_58;
    case 24:
      v7 = CFSTR("24th-XX02");
      v8 = CFSTR("24th");
      goto LABEL_58;
    case 25:
      v7 = CFSTR("25th-XX02");
      v8 = CFSTR("25th");
      goto LABEL_58;
    case 26:
      v7 = CFSTR("26th-XX02");
      v8 = CFSTR("26th");
      goto LABEL_58;
    case 27:
      v7 = CFSTR("27th-XX02");
      v8 = CFSTR("27th");
      goto LABEL_58;
    case 28:
      v7 = CFSTR("28th-XX02");
      v8 = CFSTR("28th");
      goto LABEL_58;
    case 29:
      v7 = CFSTR("29th-XX02");
      v8 = CFSTR("29th");
      goto LABEL_58;
    case 30:
      v7 = CFSTR("30th-XX02");
      v8 = CFSTR("30th");
      goto LABEL_58;
    case 31:
      v7 = CFSTR("31st-XX02");
      v8 = CFSTR("31st");
      goto LABEL_58;
    case 32:
      v7 = CFSTR("32nd-XX02");
      v8 = CFSTR("32nd");
      goto LABEL_58;
    case 33:
      v7 = CFSTR("33rd-XX02");
      v8 = CFSTR("33rd");
      goto LABEL_58;
    case 34:
      v7 = CFSTR("34th-XX02");
      v8 = CFSTR("34th");
      goto LABEL_58;
    case 35:
      v7 = CFSTR("35th-XX02");
      v8 = CFSTR("35th");
      goto LABEL_58;
    case 36:
      v7 = CFSTR("36th-XX02");
      v8 = CFSTR("36th");
      goto LABEL_58;
    case 37:
      v7 = CFSTR("37th-XX02");
      v8 = CFSTR("37th");
      goto LABEL_58;
    case 38:
      v7 = CFSTR("38th-XX02");
      v8 = CFSTR("38th");
      goto LABEL_58;
    case 39:
      v7 = CFSTR("39th-XX02");
      v8 = CFSTR("39th");
      goto LABEL_58;
    case 40:
      v7 = CFSTR("40th-XX02");
      v8 = CFSTR("40th");
      goto LABEL_58;
    case 41:
      v7 = CFSTR("41st-XX02");
      v8 = CFSTR("41st");
      goto LABEL_58;
    case 42:
      v7 = CFSTR("42nd-XX02");
      v8 = CFSTR("42nd");
      goto LABEL_58;
    case 43:
      v7 = CFSTR("43rd-XX02");
      v8 = CFSTR("43rd");
      goto LABEL_58;
    case 44:
      v7 = CFSTR("44th-XX02");
      v8 = CFSTR("44th");
      goto LABEL_58;
    case 45:
      v7 = CFSTR("45th-XX02");
      v8 = CFSTR("45th");
      goto LABEL_58;
    case 46:
      v7 = CFSTR("46th-XX02");
      v8 = CFSTR("46th");
      goto LABEL_58;
    case 47:
      v7 = CFSTR("47th-XX02");
      v8 = CFSTR("47th");
      goto LABEL_58;
    case 48:
      v7 = CFSTR("48th-XX02");
      v8 = CFSTR("48th");
      goto LABEL_58;
    case 49:
      v7 = CFSTR("49th-XX02");
      v8 = CFSTR("49th");
      goto LABEL_58;
    case 50:
      v7 = CFSTR("50th-XX02");
      v8 = CFSTR("50th");
      goto LABEL_58;
    case 51:
      v7 = CFSTR("51st-XX02");
      v8 = CFSTR("51st");
      goto LABEL_58;
    case 52:
      v7 = CFSTR("52nd-XX02");
      v8 = CFSTR("52nd");
      goto LABEL_58;
    case 53:
      v7 = CFSTR("53rd-XX02");
      v8 = CFSTR("53rd");
LABEL_58:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v7, v8, CFSTR("RecurrenceRule"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v6;
}

+ (id)_orDaysOfWeekString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_customDayCombinationDescription:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "count");
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = v8 - 1;
      do
      {
        objc_msgSend(v3, "objectAtIndex:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (v11 == v10)
          {
            if (v9 == 2)
              v13 = CFSTR(" or %@");
            else
              v13 = CFSTR(", or %@");
            v15 = &stru_1E2A86598;
          }
          else
          {
            v13 = CFSTR(", %@-XX02");
            v15 = CFSTR(", %@");
          }
          objc_msgSend(v4, "localizedStringForKey:value:table:", v13, v15, CFSTR("RecurrenceRule"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_numberedWeekDayString:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", v14, v16);

        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "_numberedWeekDayString:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:", v14);
        }

        ++v10;
      }
      while (v9 != v10);
      v6 = 0;
    }
  }

  return v7;
}

+ (id)_customDayCombinationDescription:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "daysTypeForDayArray:", v4);

  if (v6 == 3)
  {
    v7 = CFSTR("weekend day");
LABEL_7:
    v8 = &stru_1E2A86598;
    v10 = v5;
    v9 = 0;
    goto LABEL_8;
  }
  if (v6 == 2)
  {
    v7 = CFSTR("weekday");
    goto LABEL_7;
  }
  if (v6 != 1)
  {
    v11 = 0;
    goto LABEL_10;
  }
  v7 = CFSTR("day-XX02");
  v8 = CFSTR("day");
  v9 = CFSTR("RecurrenceRule");
  v10 = v5;
LABEL_8:
  objc_msgSend(v10, "localizedStringForKey:value:table:", v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

+ (int64_t)daysTypeForDayArray:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 != 2)
  {
    if (v4 == 7)
    {
      v5 = 1;
      v17 = 1;
      while (1)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v18 = v3;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (!v19)
          break;
        v20 = v19;
        v21 = *(_QWORD *)v29;
LABEL_25:
        v22 = 0;
        while (1)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v22), "weekday") == v17)
            break;
          if (v20 == ++v22)
          {
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
            if (v20)
              goto LABEL_25;
            goto LABEL_35;
          }
        }

        v12 = v17++ >= 7;
        if (v12)
          goto LABEL_37;
      }
    }
    else
    {
      if (v4 != 5)
      {
LABEL_36:
        v5 = 0;
        goto LABEL_37;
      }
      v5 = 2;
      v6 = 2;
      while (1)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v7 = v3;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (!v8)
          break;
        v9 = v8;
        v10 = *(_QWORD *)v25;
LABEL_7:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "weekday") == v6)
            break;
          if (v9 == ++v11)
          {
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v9)
              goto LABEL_7;
            goto LABEL_35;
          }
        }

        v12 = v6++ >= 6;
        if (v12)
          goto LABEL_37;
      }
    }
LABEL_35:

    goto LABEL_36;
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "weekday");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "weekday");

  if ((v14 != 7 || v16 != 1) && (v14 != 1 || v16 != 7))
    goto LABEL_36;
  v5 = 3;
LABEL_37:

  return v5;
}

@end
