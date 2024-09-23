@implementation BCSCalendarEventParser

+ (id)parseString:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  BCSCalendarEventData *v16;
  BCSCalendarEventData *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v5)
    +[BCSCalendarEventParser parseString:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = v4;
  if (objc_msgSend(v13, "_bcs_hasCaseInsensitivePrefix:", CFSTR("BEGIN:VEVENT")))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BEGIN:VCALENDAR\r\n%@\r\nEND:VCALENDAR"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    objc_msgSend(a1, "_validatedICSString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
      v16 = -[BCSCalendarEventData initWithICSString:]([BCSCalendarEventData alloc], "initWithICSString:", v15);
    else
      v16 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:]([BCSInvalidParsedData alloc], "initWithInvalidDataType:invalidContents:", 7, v13);
    v17 = v16;

    goto LABEL_13;
  }
  v14 = v13;
  if ((objc_msgSend(v13, "_bcs_hasCaseInsensitivePrefix:", CFSTR("BEGIN:VCALENDAR")) & 1) != 0)
    goto LABEL_6;
  v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v18)
    +[BCSCalendarEventParser parseString:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
  v17 = 0;
  v14 = v13;
LABEL_13:

  return v17;
}

+ (id)_validatedICSString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)getICSDocumentClass()), "initWithICSString:options:error:", v3, 0, 0);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(v6, "components", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v55;
LABEL_5:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v55 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v12);
          getICSEventClass();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
            if (v10)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v23)
          +[BCSCalendarEventParser _validatedICSString:].cold.4(v23, v24, v25, v26, v27, v28, v29, v30);
        v31 = v13;

        if (v31)
        {
          objc_msgSend(v7, "components");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "count");

          if (v33 == 1)
          {
            v34 = v3;
          }
          else
          {
            objc_msgSend(v7, "components");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "removeAllObjects");

            objc_msgSend(v7, "components");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "addObject:", v31);

            objc_msgSend(v7, "ICSStringWithOptions:", 0);
            v34 = (id)objc_claimAutoreleasedReturnValue();
          }
          v22 = v34;

          goto LABEL_27;
        }
      }
      else
      {
LABEL_11:

      }
      v35 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v35)
        +[BCSCalendarEventParser _validatedICSString:].cold.3(v35, v36, v37, v38, v39, v40, v41, v42);
    }
    else
    {
      v43 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v43)
        +[BCSCalendarEventParser _validatedICSString:].cold.2(v43, v44, v45, v46, v47, v48, v49, v50);
    }
    v22 = 0;
LABEL_27:

  }
  else
  {
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v14)
      +[BCSCalendarEventParser _validatedICSString:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    v22 = 0;
  }

  return v22;
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSCalendarEventParser: vCalendar/vEvent prefix not found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSCalendarEventParser: Begin parsing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_validatedICSString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSCalendarEventParser: ics string is not valid", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_validatedICSString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSCalendarEventParser: Cannot get calendar from ICSDocument", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_validatedICSString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSCalendarEventParser: Cannot find event from calendar", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_validatedICSString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSCalendarEventParser: Found event from payload", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
