@implementation ICSEvent(SGCalendarAttachmentDissector)

- (id)attendeeEmailAddresses
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attendee");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sgMapAndFilter();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)method
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "firstValueOfPropertyForName:", *MEMORY[0x1E0DDBAE8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "longValue");

  return v2;
}

- (id)enrichmentWithParentEntity:()SGCalendarAttachmentDissector withCalendar:
{
  char v5;

  v5 = 0;
  objc_msgSend(a1, "enrichmentWithParentEntity:withCalendar:withCorrectnessFlag:", a3, a4, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SGPipelineEnrichment)enrichmentWithParentEntity:()SGCalendarAttachmentDissector withCalendar:withCorrectnessFlag:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  SGPipelineEnrichment *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  SGPipelineEnrichment *v31;
  void *v32;
  SGPipelineEnrichment *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t *v47;
  _QWORD *v48;
  void *v49;
  void *v50;
  _QWORD *v51;
  void *v52;
  int v53;
  uint64_t *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  char v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  SGStorageLocation *v92;
  void *v93;
  SGStorageLocation *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  int v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  SGPipelineEnrichment *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "dtstart");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "dtstart");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "validatedCompleteDateTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(a1, "dtend");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13
    && (v14 = (void *)v13,
        objc_msgSend(a1, "dtend"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "validatedCompleteDateTime"),
        v16 = (id)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v16))
  {
    v17 = 0;
  }
  else
  {
    v16 = v12;
    v17 = 1;
  }
  v18 = 0;
  if (v12)
  {
    if (v16)
    {
      objc_msgSend(v12, "components");
      v18 = (SGPipelineEnrichment *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v16, "components");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v105 = v17;
          objc_msgSend(a1, "uid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          v115 = v9;
          v109 = v8;
          if (v20)
          {
            v22 = v20;
          }
          else
          {
            v23 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(a1, "dtstart");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "value");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "summary");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("%@;%@"), v25, v26);
            SGSha256ForString(v27, 0);
            v28 = objc_claimAutoreleasedReturnValue();

            v9 = v115;
            v8 = v109;
            v22 = (id)v28;
          }

          objc_msgSend(v8, "duplicateKey");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDuplicateKey duplicateKeyForPseudoEventWithGroupId:parentKey:](SGDuplicateKey, "duplicateKeyForPseudoEventWithGroupId:parentKey:", v22, v29);
          v30 = objc_claimAutoreleasedReturnValue();

          v31 = [SGPipelineEnrichment alloc];
          objc_msgSend(a1, "summary");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = (void *)v30;
          v33 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:](v31, "initWithDuplicateKey:title:parent:", v30, v32, v8);

          objc_msgSend(a1, "description");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity setContent:](v33, "setContent:", v34);

          objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 32, 0, 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity setExtractionInfo:](v33, "setExtractionInfo:", v35);

          objc_msgSend(MEMORY[0x1E0D197F0], "fromCalendarAttachment");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity addTag:](v33, "addTag:", v36);

          objc_msgSend(a1, "url");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            v38 = (void *)MEMORY[0x1E0D197F0];
            objc_msgSend(a1, "url");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "url:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v33, "addTag:", v40);

          }
          v111 = v33;
          objc_msgSend(v12, "components");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "components");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "firstValueOfPropertyForName:", *MEMORY[0x1E0DDBB98]);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = v22;
          if (v42)
          {
            v43 = 1;
          }
          else
          {
            objc_msgSend(a1, "firstValueOfPropertyForName:", *MEMORY[0x1E0DDBBA0]);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (v44)
            {
              v43 = 1;
            }
            else
            {
              objc_msgSend(v9, "x_wr_timezone");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v45 != 0;

            }
          }

          objc_msgSend(v12, "tzid");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = (uint64_t *)MEMORY[0x1E0D19C60];
          v48 = (_QWORD *)MEMORY[0x1E0D19C50];
          if (v46 || v43)
          {
            objc_msgSend(v12, "systemTimeZoneWithCalendar:withEvent:withCorrectnessFlag:", v115, a1, a5);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "setTimeZone:", v49);

            objc_msgSend(v112, "timeZone");
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            if (v50)
              v51 = (_QWORD *)MEMORY[0x1E0D19C68];
            else
              v51 = (_QWORD *)MEMORY[0x1E0D19C58];
            objc_msgSend(MEMORY[0x1E0D19968], "recordWithTimezoneValue:datetimeType:", *v51, *v48);
            v47 = (uint64_t *)MEMORY[0x1E0D19C60];
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D19968], "recordWithTimezoneValue:datetimeType:", *MEMORY[0x1E0D19C60], *MEMORY[0x1E0D19C50]);
          }
          objc_msgSend(v16, "tzid");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52)
            v53 = 1;
          else
            v53 = v43;

          v54 = (uint64_t *)MEMORY[0x1E0D19C48];
          v9 = v115;
          if (v53 == 1)
          {
            objc_msgSend(v16, "systemTimeZoneWithCalendar:withEvent:withCorrectnessFlag:", v115, a1, a5);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setTimeZone:", v55);

            objc_msgSend(v41, "timeZone");
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            v57 = (void *)MEMORY[0x1E0D19968];
            v58 = *v54;
            if (v56)
              v59 = (uint64_t *)MEMORY[0x1E0D19C68];
            else
              v59 = (uint64_t *)MEMORY[0x1E0D19C58];
            v60 = *v59;
          }
          else
          {
            v57 = (void *)MEMORY[0x1E0D19968];
            v60 = *v47;
            v58 = *MEMORY[0x1E0D19C48];
          }
          objc_msgSend(v57, "recordWithTimezoneValue:datetimeType:", v60, v58);
          v8 = v109;
          v61 = v112;
          objc_msgSend(v112, "timeZone");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v62)
          {
            objc_msgSend(v12, "tzid");
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v63)
              goto LABEL_44;
            objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "setTimeZone:", v62);
          }

LABEL_44:
          objc_msgSend(v41, "timeZone");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v64)
          {
            objc_msgSend(v16, "tzid");
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v65)
              goto LABEL_48;
            objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setTimeZone:", v64);
          }

LABEL_48:
          objc_msgSend(v12, "tzid");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v66)
          {
            if ((objc_msgSend(v12, "hasFloatingTimeZone") & 1) != 0)
              goto LABEL_52;
            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "setTimeZone:", v67);

            convertDateComponentsToLocalTimeZone(v112);
            v68 = objc_claimAutoreleasedReturnValue();
            v66 = v112;
            v61 = (void *)v68;
          }

LABEL_52:
          objc_msgSend(v16, "tzid");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v69)
          {
            if ((objc_msgSend(v16, "hasFloatingTimeZone") & 1) != 0)
            {
LABEL_56:
              v18 = 0;
              if (!v61 || !v41)
                goto LABEL_91;
              if (!v105)
                goto LABEL_79;
              objc_msgSend(a1, "duration");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "timeInterval");
              if (v73 == 0.0)
              {

              }
              else if (v72)
              {
                goto LABEL_68;
              }
              objc_msgSend(a1, "dtend");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              if (v74)
              {
                v75 = v74;
                v76 = objc_msgSend(v74, "hasTimeComponent");

                if ((v76 & 1) != 0)
                  goto LABEL_79;
              }
              else
              {
                objc_msgSend(a1, "dtstart");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = objc_msgSend(v77, "hasTimeComponent");

                if ((v78 & 1) != 0)
                  goto LABEL_79;
              }
              v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB828]), "initWithWeeks:days:hours:minutes:seconds:", 0, 1, 0, 0, 0);
              if (!v72)
                goto LABEL_79;
LABEL_68:
              v113 = v61;
              objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "dateFromComponents:", v41);
              v80 = objc_claimAutoreleasedReturnValue();
              if (!v80)
                goto LABEL_89;
              v81 = (void *)v80;
              objc_msgSend(v79, "dateByAddingUnit:value:toDate:options:", 16, 7 * objc_msgSend(v72, "weeks"), v80, 0);
              v82 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v82)
                goto LABEL_89;
              objc_msgSend(v79, "dateByAddingUnit:value:toDate:options:", 16, objc_msgSend(v72, "days"), v82, 0);
              v83 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v83)
                goto LABEL_89;
              objc_msgSend(v79, "dateByAddingUnit:value:toDate:options:", 32, objc_msgSend(v72, "hours"), v83, 0);
              v84 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v84
                || (objc_msgSend(v79, "dateByAddingUnit:value:toDate:options:", 64, objc_msgSend(v72, "minutes"), v84, 0), v85 = (void *)objc_claimAutoreleasedReturnValue(), v84, !v85)|| (objc_msgSend(v79, "dateByAddingUnit:value:toDate:options:", 128, objc_msgSend(v72, "seconds"), v85, 0), v86 = objc_claimAutoreleasedReturnValue(), v85, !v86))
              {
LABEL_89:

                v18 = 0;
                v61 = v113;
LABEL_90:

LABEL_91:
                goto LABEL_92;
              }
              v87 = (void *)v86;
              objc_msgSend(v41, "timeZone");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = (uint64_t)v88;
              if (!v88)
              {
                objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
                v89 = objc_claimAutoreleasedReturnValue();
              }
              v106 = (void *)v89;
              objc_msgSend(v79, "componentsInTimeZone:fromDate:", v89, v87);
              v110 = objc_claimAutoreleasedReturnValue();

              if (!v88)
              v41 = (void *)v110;
              v61 = v113;
LABEL_79:
              objc_msgSend(MEMORY[0x1E0D19940], "rangeWithGregorianStartComponents:endComponents:", v61, v41);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              if (v72)
              {
                v114 = v41;
                v90 = v61;
                -[SGEntity setTimeRange:](v111, "setTimeRange:", v72);
                objc_msgSend(a1, "location");
                v91 = (void *)objc_claimAutoreleasedReturnValue();

                if (v91)
                {
                  v92 = [SGStorageLocation alloc];
                  objc_msgSend(a1, "location");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  v94 = -[SGStorageLocation initWithType:label:address:airportCode:accuracy:quality:](v92, "initWithType:label:address:airportCode:accuracy:quality:", 0, v93, 0, 0, 0.0, 0.0);

                  -[SGEntity locations](v111, "locations");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "addObject:", v94);

                }
                objc_msgSend(a1, "dtstamp");
                v96 = objc_claimAutoreleasedReturnValue();
                if (v96)
                {
                  v97 = (void *)v96;
                  objc_msgSend(a1, "dtstamp");
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v98, "validatedCompleteDateTime");
                  v99 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v99)
                  {
                    v100 = objc_alloc(MEMORY[0x1E0C99D48]);
                    v101 = (void *)objc_msgSend(v100, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
                    objc_msgSend(v99, "components");
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v101, "dateFromComponents:", v102);
                    v103 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v103)
                    {
                      objc_msgSend(v103, "timeIntervalSince1970");
                      -[SGPipelineEnrichment setCreationTimestamp:](v111, "setCreationTimestamp:");
                    }

                  }
                }
                v18 = v111;
                v61 = v90;
                v41 = v114;
              }
              else
              {
                v18 = 0;
              }
              goto LABEL_90;
            }
            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setTimeZone:", v70);

            convertDateComponentsToLocalTimeZone(v41);
            v71 = objc_claimAutoreleasedReturnValue();
            v69 = v41;
            v41 = (void *)v71;
          }

          goto LABEL_56;
        }
        v18 = 0;
      }
    }
  }
LABEL_92:

  return v18;
}

@end
