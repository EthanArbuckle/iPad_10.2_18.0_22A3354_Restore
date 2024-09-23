void sub_22665C3B8(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  id AceEventFromEKEvent_0;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  char *v50;
  char *v51;
  NSObject *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  id obj;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  if (!v8)
  {
    v66 = *(_QWORD *)(a1 + 48);
    objc_msgSend_dictionary(a3, v5, v6, v7);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v66 + 16))(v66, v67);

    goto LABEL_32;
  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = a1 + 32;
  objc_msgSend_identifiers(*(void **)(a1 + 32), v5, v6, v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v73, (uint64_t)v83, 16);
  v14 = a1;
  if (!v10)
    goto LABEL_26;
  v15 = v10;
  v16 = *(_QWORD *)v74;
  v68 = 136315650;
  v69 = v8;
  v70 = v14;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v74 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v17);
      objc_msgSend_timeZoneId(v18, v11, v12, v13, v68);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v19)
        v20 = (uint64_t)CFTimeZoneCreateWithName(0, v19, 1u);
      else
        v20 = CalCopyTimeZone();
      v21 = (void *)v20;
      if (v20)
      {
        sub_22665D4E4();
        v22 = (void *)qword_25586B420;
        if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
        {
          v35 = v22;
          v36 = (void *)objc_opt_class();
          v37 = v36;
          objc_msgSend_identifier(v18, v38, v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v78 = (const char *)v36;
          v8 = v69;
          v79 = 2112;
          v80 = v41;
          _os_log_debug_impl(&dword_22665B000, v35, OS_LOG_TYPE_DEBUG, "[%@] - Looking for event with identifier %@", buf, 0x16u);

          v14 = v70;
        }
        v23 = (void *)*MEMORY[0x24BE08FF0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_DEBUG))
        {
          v42 = v23;
          v43 = (void *)objc_opt_class();
          v44 = v43;
          objc_msgSend_identifier(v18, v45, v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v68;
          v78 = "-[CalAssistantEventRetrieve performWithCompletion:]_block_invoke";
          v79 = 2112;
          v80 = v43;
          v81 = 2112;
          v82 = v48;
          _os_log_debug_impl(&dword_22665B000, v42, OS_LOG_TYPE_DEBUG, "%s [%@] - Looking for event with identifier %@", buf, 0x20u);

          v8 = v69;
          v14 = v70;
        }
        objc_msgSend_identifier(v18, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__eventWithURI_checkValid_(v8, v28, (uint64_t)v27, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        sub_22665D4E4();
        v30 = (void *)qword_25586B420;
        if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
        {
          v49 = v30;
          v50 = (char *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v78 = v50;
          v79 = 2112;
          v80 = v29;
          v51 = v50;
          _os_log_debug_impl(&dword_22665B000, v49, OS_LOG_TYPE_DEBUG, "[%@] - Found event %@", buf, 0x16u);

          v14 = v70;
        }
        v31 = (void *)*MEMORY[0x24BE08FF0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_DEBUG))
        {
          v52 = v31;
          v53 = (void *)objc_opt_class();
          *(_DWORD *)buf = v68;
          v78 = "-[CalAssistantEventRetrieve performWithCompletion:]_block_invoke";
          v79 = 2112;
          v80 = v53;
          v81 = 2112;
          v82 = v29;
          v54 = v53;
          _os_log_debug_impl(&dword_22665B000, v52, OS_LOG_TYPE_DEBUG, "%s [%@] - Found event %@", buf, 0x20u);

          v14 = v70;
          if (v29)
          {
LABEL_19:
            AceEventFromEKEvent_0 = CreateAceEventFromEKEvent_0(v29, v21);
            objc_msgSend_addObject_(*(void **)(v14 + 40), v33, (uint64_t)AceEventFromEKEvent_0, v34);

          }
        }
        else if (v29)
        {
          goto LABEL_19;
        }
        CFRelease(v21);

      }
      ++v17;
    }
    while (v15 != v17);
    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v73, (uint64_t)v83, 16);
    v15 = v55;
  }
  while (v55);
LABEL_26:

  sub_22665D4E4();
  v56 = (void *)qword_25586B420;
  if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_DEBUG))
    sub_2266605F0(v71, v56, v14);
  v57 = (void *)*MEMORY[0x24BE08FF0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_DEBUG))
    sub_22666052C(v71, v57);
  v58 = objc_alloc_init(MEMORY[0x24BE81230]);
  objc_msgSend_setObjects_(v58, v59, *(_QWORD *)(v14 + 40), v60);
  v61 = *(_QWORD *)(v14 + 48);
  objc_msgSend_dictionary(v58, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v61 + 16))(v61, v65);

LABEL_32:
}

uint64_t sub_22665C8E4()
{
  return objc_opt_class();
}

uint64_t sub_22665C8F0()
{
  return objc_opt_class();
}

id sub_22665C8FC(id a1)
{
  return a1;
}

void sub_22665C910(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id sub_22665D464(id a1)
{
  return a1;
}

void sub_22665D478(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_22665D48C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_22665D4A0(id a1)
{
  return a1;
}

uint64_t sub_22665D4CC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  return objc_msgSend_count(v4, a2, a3, a4);
}

void sub_22665D4E4()
{
  if (qword_25586B418 != -1)
    dispatch_once(&qword_25586B418, &unk_24EE09F18);
}

void sub_22665D50C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)qword_25586B410, "CalendarAssistant");
  v1 = (void *)qword_25586B420;
  qword_25586B420 = (uint64_t)v0;

}

id sub_22665D53C()
{
  id v0;
  const char *v1;
  uint64_t v2;

  v0 = objc_alloc(MEMORY[0x24BDC74E8]);
  return (id)objc_msgSend_initWithEKOptions_(v0, v1, 4, v2);
}

void sub_22665D560(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDC74E8]);
  v7 = (void *)objc_msgSend_initWithEKOptions_(v4, v5, 4, v6);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_22665D600;
  v12[3] = &unk_24EE09F40;
  v13 = v7;
  v14 = v3;
  v8 = v7;
  v9 = v3;
  objc_msgSend_requestFullAccessToEventsWithCompletion_(v8, v10, (uint64_t)v12, v11);

}

void sub_22665D600(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    sub_22665D4E4();
    v6 = qword_25586B420;
    if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_ERROR))
      sub_226660CD0((uint64_t)v5, v6);
    v7 = *MEMORY[0x24BE08FF0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_ERROR))
      sub_226660C48((uint64_t)v5, v7);
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("We weren't granted access to EventKit. %@"), v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x24BE811A8]);
    v14 = (void *)objc_msgSend_initWithReason_(v11, v12, (uint64_t)v10, v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void sub_22665DEEC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_22665DF00(id a1)
{
  return a1;
}

uint64_t sub_22665DF10()
{
  return objc_opt_class();
}

void sub_22665DF18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

uint64_t sub_22665DF24()
{
  return objc_opt_class();
}

id sub_22665DF30(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v56;

  v1 = a1;
  v5 = objc_msgSend_count(v1, v2, v3, v4);
  objc_msgSend_bundle(CalAssistantBundle, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v5)
  {
    if (v5 == 2)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_localizedStringForKey_value_table_(v9, v10, (uint64_t)CFSTR("%@ and %@ (two attendee format)"), (uint64_t)CFSTR("%@ and %@"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v1, v16, 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v1, v19, 1, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringWithFormat_(v14, v22, (uint64_t)v15, v23, v18, v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (v5 == 1)
    {
      objc_msgSend_objectAtIndex_(v1, v10, 0, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0x24BDD1000uLL;
      v25 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_localizedStringForKey_value_table_(v9, v10, (uint64_t)CFSTR("%@, %@ (three or more start format)"), (uint64_t)CFSTR("%@, %@"), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v1, v27, 0, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v1, v30, 1, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringWithFormat_(v25, v33, (uint64_t)v26, v34, v29, v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = v5 - 1;
      if ((unint64_t)(v5 - 1) < 3)
      {
        v47 = v35;
      }
      else
      {
        v37 = 3;
        do
        {
          v38 = *(void **)(v24 + 1992);
          objc_msgSend_localizedStringForKey_value_table_(v12, v36, (uint64_t)CFSTR("%@, %@ (three or more middle format)"), (uint64_t)CFSTR("%@, %@"), 0);
          v39 = v12;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndex_(v1, v41, v37 - 1, v42);
          v43 = v24;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_localizedStringWithFormat_(v38, v45, (uint64_t)v40, v46, v35, v44);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v43;
          v12 = v39;

          ++v37;
          v35 = v47;
        }
        while (v5 != v37);
      }
      v48 = *(void **)(v24 + 1992);
      objc_msgSend_localizedStringForKey_value_table_(v12, v36, (uint64_t)CFSTR("%@ and %@ (three or more end format)"), (uint64_t)CFSTR("%@ and %@"), 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v1, v50, v56, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringWithFormat_(v48, v53, (uint64_t)v49, v54, v47, v52);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t sub_22665E1C4(int a1)
{
  NSObject *v3;
  NSObject *v4;

  if (a1 < 5)
    return qword_226662D70[a1];
  sub_22665D4E4();
  v3 = qword_25586B420;
  if (os_log_type_enabled((os_log_t)qword_25586B420, OS_LOG_TYPE_ERROR))
    sub_2266614B8(a1, v3);
  v4 = *MEMORY[0x24BE08FF0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FF0], OS_LOG_TYPE_ERROR))
    sub_226661430(a1, v4);
  return 0;
}

id sub_22665E258(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *inited;

  v1 = a1;
  v5 = objc_msgSend_frequency(v1, v2, v3, v4);
  v6 = sub_22665E1C4(v5);
  objc_msgSend_endDate(v1, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v14 = objc_alloc(MEMORY[0x24BDC7518]);
    objc_msgSend_endDate(v1, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend_initWithEndDate_(v14, v19, (uint64_t)v18, v20);

  }
  else if (objc_msgSend_endCount(v1, v11, v12, v13) < 1)
  {
    v21 = 0;
  }
  else
  {
    v22 = objc_alloc(MEMORY[0x24BDC7518]);
    v26 = objc_msgSend_endCount(v1, v23, v24, v25);
    v21 = (void *)objc_msgSend_initWithOccurrenceCount_(v22, v27, v26, v28);
  }
  v29 = objc_alloc(MEMORY[0x24BDC7528]);
  v33 = objc_msgSend_interval(v1, v30, v31, v32);
  inited = (void *)objc_msgSend_initRecurrenceWithFrequency_interval_end_(v29, v34, v6, v33, v21);

  return inited;
}

id CreateAceEventFromEKEvent_0(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t isAllDay;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  id v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i;
  void *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  id v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  id v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t j;
  void *v131;
  id v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  const char *v162;
  const char *v163;
  uint64_t v164;
  id v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  const char *v170;
  uint64_t v171;
  id v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  const char *v177;
  uint64_t v178;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  id v184;
  id v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _BYTE v190[128];
  uint64_t v191;

  v191 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  sub_22665D4E4();
  v8 = objc_alloc_init(MEMORY[0x24BE81168]);
  if (v8)
  {
    objc_msgSend_externalURI(v3, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIdentifier_(v8, v10, (uint64_t)v9, v11);

    objc_msgSend_externalURI(v3, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCalendarPunchoutURI_(v8, v16, (uint64_t)v15, v17);

    objc_msgSend_title(v3, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitle_(v8, v22, (uint64_t)v21, v23);

    objc_msgSend_location(v3, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocation_(v8, v28, (uint64_t)v27, v29);

    isAllDay = objc_msgSend_isAllDay(v3, v30, v31, v32);
    objc_msgSend_setAllDay_(v8, v34, isAllDay, v35);
    objc_msgSend_startDate(v3, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStartDate_(v8, v40, (uint64_t)v39, v41);

    objc_msgSend_endDate(v3, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEndDate_(v8, v46, (uint64_t)v45, v47);

    v184 = v4;
    objc_msgSend_name(v4, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimeZoneId_(v8, v52, (uint64_t)v51, v53);

    objc_msgSend_calendar(v3, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_externalURI(v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCalendarId_(v8, v62, (uint64_t)v61, v63);

    if ((objc_msgSend_isEditable(v3, v64, v65, v66) & 1) == 0)
    {
      objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v67, 1, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setReadOnly_(v8, v70, (uint64_t)v69, v71);

    }
    v72 = v8;
    objc_msgSend_attendees(v3, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = v8;
    if (objc_msgSend_count(v76, v77, v78, v79))
    {
      v182 = v72;
      v80 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v83 = (void *)objc_msgSend_initWithCapacity_(v80, v81, 0, v82);
      v186 = 0u;
      v187 = 0u;
      v188 = 0u;
      v189 = 0u;
      v180 = v76;
      v84 = v76;
      v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v186, (uint64_t)v190, 16);
      if (v86)
      {
        v90 = v86;
        v91 = *(_QWORD *)v187;
        do
        {
          for (i = 0; i != v90; ++i)
          {
            if (*(_QWORD *)v187 != v91)
              objc_enumerationMutation(v84);
            v93 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * i);
            objc_msgSend_name(v93, v87, v88, v89, v180);
            v94 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_emailAddress(v93, v95, v96, v97);
            v98 = objc_claimAutoreleasedReturnValue();
            if (v98 | v94)
            {
              v99 = objc_alloc_init(MEMORY[0x24BE814B0]);
              v102 = v99;
              if (v98)
                objc_msgSend_setData_(v99, v100, v98, v101);
              else
                objc_msgSend_setData_(v99, v100, v94, v101);
              if (v94)
                objc_msgSend_setDisplayText_(v102, v103, v94, v104);
              else
                objc_msgSend_setDisplayText_(v102, v103, v98, v104);
              objc_msgSend_addObject_(v83, v105, (uint64_t)v102, v106);

            }
          }
          v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v87, (uint64_t)&v186, (uint64_t)v190, 16);
        }
        while (v90);
      }

      v72 = v182;
      objc_msgSend_setAttendees_(v182, v107, (uint64_t)v83, v108);

      v8 = v185;
      v76 = v180;
    }

    v109 = v72;
    objc_msgSend_recurrenceRules(v3, v110, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v113, v114, v115, v116))
    {
      v183 = v109;
      v117 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v121 = objc_msgSend_count(v113, v118, v119, v120);
      v124 = (void *)objc_msgSend_initWithCapacity_(v117, v122, v121, v123);
      v186 = 0u;
      v187 = 0u;
      v188 = 0u;
      v189 = 0u;
      v181 = v113;
      v125 = v113;
      v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v126, (uint64_t)&v186, (uint64_t)v190, 16);
      if (v127)
      {
        v128 = v127;
        v129 = *(_QWORD *)v187;
        do
        {
          for (j = 0; j != v128; ++j)
          {
            if (*(_QWORD *)v187 != v129)
              objc_enumerationMutation(v125);
            v131 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * j);
            v132 = objc_alloc_init(MEMORY[0x24BE81178]);
            v136 = objc_msgSend_frequency(v131, v133, v134, v135);
            if (v136 <= 3)
              objc_msgSend_setFrequency_(v132, v137, (v136 + 1), v139);
            v140 = objc_msgSend_interval(v131, v137, v138, v139, v181);
            objc_msgSend_setInterval_(v132, v141, v140, v142);
            objc_msgSend_recurrenceEnd(v131, v143, v144, v145);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            v150 = v146;
            if (v146)
            {
              objc_msgSend_endDate(v146, v147, v148, v149);
              v151 = (void *)objc_claimAutoreleasedReturnValue();

              if (v151)
              {
                objc_msgSend_endDate(v150, v152, v153, v154);
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setEndDate_(v132, v156, (uint64_t)v155, v157);

              }
              else if (objc_msgSend_occurrenceCount(v150, v152, v153, v154))
              {
                v159 = objc_msgSend_occurrenceCount(v150, v147, v158, v149);
                objc_msgSend_setEndCount_(v132, v160, v159, v161);
              }
            }
            objc_msgSend_addObject_(v124, v147, (uint64_t)v132, v149);

          }
          v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v162, (uint64_t)&v186, (uint64_t)v190, 16);
        }
        while (v128);
      }

      v109 = v183;
      objc_msgSend_setRecurrences_(v183, v163, (uint64_t)v124, v164);

      v8 = v185;
      v113 = v181;
    }

    v165 = v109;
    v169 = objc_msgSend_selfParticipantStatus(v3, v166, v167, v168);
    if (v169 <= 7)
      objc_msgSend_setSelfParticipantStatus_(v165, v170, **((_QWORD **)&unk_24EE09F60 + v169), v171);

    v172 = v165;
    v176 = objc_msgSend_status(v3, v173, v174, v175);
    v4 = v184;
    if (v176 <= 3)
      objc_msgSend_setStatus_(v172, v177, **((_QWORD **)&unk_24EE09FA0 + v176), v178);

  }
  return v8;
}

void sub_2266602FC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_226660310(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t sub_226660350()
{
  return objc_opt_class();
}

uint64_t sub_226660358()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_226660364()
{
  return objc_opt_class();
}

void sub_22666036C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_226660380(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_2266603DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_2266603E8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  return objc_msgSend_count(v4, a2, a3, a4);
}

uint64_t sub_2266603F4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  return objc_msgSend_isAllDay(v4, a2, a3, a4);
}

void sub_226660400(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;

  sub_22665C8FC(a1);
  v4 = 136315394;
  v5 = "-[CalAssistantEventRetrieve performWithCompletion:]";
  v6 = 2112;
  v7 = (id)sub_22665C8E4();
  v2 = v7;
  sub_22665C910(&dword_22665B000, v1, v3, "%s [%@] - Performing Event Retrieve", (uint8_t *)&v4);

  sub_22665C904();
}

void sub_22666049C(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;

  sub_22665C8FC(a1);
  v3 = 138412290;
  v4 = (id)sub_22665C8E4();
  v2 = v4;
  _os_log_debug_impl(&dword_22665B000, v1, OS_LOG_TYPE_DEBUG, "[%@] - Performing Event Retrieve", (uint8_t *)&v3, 0xCu);

  sub_22665C904();
}

void sub_22666052C(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  __int16 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v5 = 136315650;
  v6 = "-[CalAssistantEventRetrieve performWithCompletion:]_block_invoke";
  v7 = 2112;
  v8 = (id)sub_22665C8F0();
  v9 = 2112;
  v4 = sub_22665C8FC(v8);
  _os_log_debug_impl(&dword_22665B000, v2, OS_LOG_TYPE_DEBUG, "%s [%@] - Returning results %@", (uint8_t *)&v5, 0x20u);

}

void sub_2266605F0(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v3;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)sub_22665C8F0();
  v7 = *(_QWORD *)(a3 + 40);
  v10 = 138412546;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  v8 = v6;
  sub_22665C910(&dword_22665B000, v3, v9, "[%@] - Returning results %@", (uint8_t *)&v10);

}

void sub_2266606A0(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  uint64_t v4;
  int v5[6];

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v5[0] = 136315394;
  v3 = sub_22665D464(v2);
  sub_22665C910(&dword_22665B000, v1, v4, "%s [%@] - There are no visible calendars.  Will not fetch events.", (uint8_t *)v5);

  sub_22665C904();
}

void sub_22666072C(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v3 = sub_22665D4A0(v2);
  sub_22665D48C(&dword_22665B000, v4, v5, "[%@] - There are no visible calendars.  Will not fetch events.", v6, v7, v8, v9, v10);

  sub_22665C904();
}

void sub_2266607A4(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  int v4[6];

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v4[0] = 136315394;
  v3 = sub_22665D464(v2);
  _os_log_error_impl(&dword_22665B000, v1, OS_LOG_TYPE_ERROR, "%s [%@] - Predicate was nil", (uint8_t *)v4, 0x16u);

  sub_22665C904();
}

void sub_226660838(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  uint8_t v4[24];

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v3 = sub_22665D4A0(v2);
  _os_log_error_impl(&dword_22665B000, v1, OS_LOG_TYPE_ERROR, "[%@] - Predicate was nil", v4, 0xCu);

  sub_22665C904();
}

void sub_2266608C0()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_22665D4D8();
  v2 = v1;
  v3 = (id)sub_22665C8F0();
  sub_22665D478(&dword_22665B000, v4, v5, "%s [%@] - Event Search completed with results %@", v6, v7, v8, v9, 2u);

  sub_22665D4AC();
}

void sub_226660964()
{
  uint64_t v0;
  NSObject *v1;
  id v2;
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;

  sub_22665D4D8();
  sub_22665C8FC(v2);
  v5 = 138412546;
  v6 = (id)sub_22665C8F0();
  v7 = 2112;
  v8 = v0;
  v3 = v6;
  sub_22665C910(&dword_22665B000, v1, v4, "[%@] - Event Search completed with results %@", (uint8_t *)&v5);

  sub_22665D4BC();
}

void sub_2266609FC()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_22665D4D8();
  v3 = v2;
  v4 = (id)sub_22665C8F0();
  sub_22665D4CC((uint64_t)v4, v5, v6, v7);
  sub_22665D478(&dword_22665B000, v8, v9, "%s [%@] - Found %ld matching events", v10, v11, v12, v13, 2u);

  sub_22665D4AC();
}

void sub_226660AA8()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;

  sub_22665D4D8();
  sub_22665C8FC(v2);
  v3 = (void *)sub_22665C8F0();
  v4 = v3;
  v9 = 138412546;
  v10 = v3;
  v11 = 2048;
  v12 = sub_22665D4CC((uint64_t)v4, v5, v6, v7);
  sub_22665C910(&dword_22665B000, v0, v8, "[%@] - Found %ld matching events", (uint8_t *)&v9);

  sub_22665D4BC();
}

void sub_226660B44(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  uint64_t v4;
  int v5[6];

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v5[0] = 136315394;
  v3 = sub_22665D464(v2);
  sub_22665C910(&dword_22665B000, v1, v4, "%s [%@] - Performing Event Search", (uint8_t *)v5);

  sub_22665C904();
}

void sub_226660BD0(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v3 = sub_22665D4A0(v2);
  sub_22665D48C(&dword_22665B000, v4, v5, "[%@] - Performing Event Search", v6, v7, v8, v9, v10);

  sub_22665C904();
}

void sub_226660C48(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "+[EKEventStore(CalAssistant) _ca_performBlock:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_22665B000, a2, OS_LOG_TYPE_ERROR, "%s We weren't granted access to EventKit. %@", (uint8_t *)&v2, 0x16u);
}

void sub_226660CD0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22665B000, a2, OS_LOG_TYPE_ERROR, "We weren't granted access to EventKit. %@", (uint8_t *)&v2, 0xCu);
}

void sub_226660D44(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v3 = sub_22665DF00(v2);
  sub_22665DEEC(&dword_22665B000, v4, v5, "%s [%@] - Performing Event Delete", v6, v7, v8, v9, 2u);

  sub_22665C904();
}

void sub_226660DCC(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v3 = sub_22665D4A0(v2);
  sub_22665D48C(&dword_22665B000, v4, v5, "[%@] - Performing Event Delete", v6, v7, v8, v9, v10);

  sub_22665C904();
}

void sub_226660E44(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v3 = sub_22665DF00(v2);
  sub_22665DEEC(&dword_22665B000, v4, v5, "%s [%@] - Validation failed because the event identifier was nil", v6, v7, v8, v9, 2u);

  sub_22665C904();
}

void sub_226660ECC(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v3 = sub_22665D4A0(v2);
  sub_22665D48C(&dword_22665B000, v4, v5, "[%@] - Validation failed because the event identifier was nil", v6, v7, v8, v9, v10);

  sub_22665C904();
}

void sub_226660F44(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v3 = (void *)sub_22665DF24();
  v4 = v3;
  v7 = 136315650;
  v8 = "-[CalAssistantEventDelete _validateEvent:]";
  v9 = 2112;
  v10 = v3;
  v11 = 2112;
  v12 = (id)sub_22665DF10();
  v5 = v12;
  sub_22665DF18(&dword_22665B000, v1, v6, "%s [%@] - Validation failed because event was of class [%@], not the expected class SACalendarEvent", (uint8_t *)&v7);

  sub_22665D4AC();
}

void sub_226661008(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  int v7;
  void *v8;

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665DF24();
  v3 = v2;
  v4 = (void *)sub_22665DF10();
  v7 = 138412546;
  v8 = v2;
  v5 = sub_22665DF00(v4);
  sub_22665C910(&dword_22665B000, v1, v6, "[%@] - Validation failed because event was of class [%@], not the expected class SACalendarEvent", (uint8_t *)&v7);

  sub_22665D4BC();
}

void sub_2266610AC(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v3 = sub_22665DF00(v2);
  sub_22665DEEC(&dword_22665B000, v4, v5, "%s [%@] - Event deletion failed because the event was not in the event store", v6, v7, v8, v9, 2u);

  sub_22665C904();
}

void sub_226661134(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v3 = sub_22665D4A0(v2);
  sub_22665D48C(&dword_22665B000, v4, v5, "[%@] - Event deletion failed because the event was not in the event store", v6, v7, v8, v9, v10);

  sub_22665C904();
}

void sub_2266611AC(void *a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = (void *)sub_22665DF10();
  v6 = v5;
  objc_msgSend_localizedDescription(a3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 136315650;
  v13 = "-[CalAssistantEventDelete _deleteEvent:]";
  v14 = 2112;
  v15 = v5;
  v16 = 2112;
  v17 = v10;
  sub_22665DF18(&dword_22665B000, v4, v11, "%s [%@] - Event deletion failed because removeEvent returned a non nil error: [%@]", (uint8_t *)&v12);

  sub_22665D4AC();
}

void sub_226661278(void *a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = sub_22665C8FC(a1);
  v5 = (void *)sub_22665DF10();
  v6 = v5;
  objc_msgSend_localizedDescription(a3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138412546;
  v13 = v5;
  v14 = 2112;
  v15 = v10;
  sub_22665C910(&dword_22665B000, v4, v11, "[%@] - Event deletion failed because removeEvent returned a non nil error: [%@]", (uint8_t *)&v12);

  sub_22665D4BC();
}

void sub_226661330(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v3 = sub_22665DF00(v2);
  sub_22665DEEC(&dword_22665B000, v4, v5, "%s [%@] - Event deletion failed because the event was read only", v6, v7, v8, v9, 2u);

  sub_22665C904();
}

void sub_2266613B8(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_22665C8FC(a1);
  v2 = (void *)sub_22665C8E4();
  v3 = sub_22665D4A0(v2);
  sub_22665D48C(&dword_22665B000, v4, v5, "[%@] - Event deletion failed because the event was read only", v6, v7, v8, v9, v10);

  sub_22665C904();
}

void sub_226661430(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "EKRecurrenceFrequencyFromSACalendarRecurrenceFrequency";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_22665B000, a2, OS_LOG_TYPE_ERROR, "%s Error: Invalid SACalendarRecurrenceFrequency [%d]", (uint8_t *)&v2, 0x12u);
}

void sub_2266614B8(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_22665B000, a2, OS_LOG_TYPE_ERROR, "Error: Invalid SACalendarRecurrenceFrequency [%d]", (uint8_t *)v2, 8u);
}

void sub_22666152C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (id)sub_226660350();
  sub_226660340();
  sub_2266602FC(&dword_22665B000, v1, v2, "%s [%@] - Event committed successfully", v3, v4, v5, v6, 2u);

  sub_22665C904();
}

void sub_2266615B4()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (id)sub_226660350();
  sub_2266603B0();
  sub_22666036C(&dword_22665B000, v1, v2, "[%@] - Event committed successfully", v3, v4, v5, v6, v7);

  sub_22665C904();
}

void sub_22666162C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (id)sub_226660350();
  sub_226660340();
  sub_2266602FC(&dword_22665B000, v1, v2, "%s [%@] - Event saved successfully", v3, v4, v5, v6, 2u);

  sub_22665C904();
}

void sub_2266616B4()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (id)sub_226660350();
  sub_2266603B0();
  sub_22666036C(&dword_22665B000, v1, v2, "[%@] - Event saved successfully", v3, v4, v5, v6, v7);

  sub_22665C904();
}

void sub_22666172C()
{
  NSObject *v0;
  id v1;
  int v2[10];

  sub_22665D4D8();
  v1 = (id)sub_226660364();
  v2[0] = 136315650;
  sub_226660394();
  _os_log_error_impl(&dword_22665B000, v0, OS_LOG_TYPE_ERROR, "%s [%@] - Event failed to save with error %@", (uint8_t *)v2, 0x20u);

  sub_22665D4AC();
}

void sub_2266617C4()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_22665D4D8();
  v0 = (id)sub_226660350();
  sub_2266603CC();
  sub_226660380(&dword_22665B000, v1, v2, "[%@] - Event failed to save with error %@", v3, v4, v5, v6, 2u);

  sub_22665D4BC();
}

void sub_226661848()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (id)sub_226660350();
  sub_226660340();
  sub_226660380(&dword_22665B000, v1, v2, "%s [%@] - Calendar plugin doesn't handle multiple recurrences.", v3, v4, v5, v6, 2u);

  sub_22665C904();
}

void sub_2266618D0(uint64_t a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (id)sub_226660350();
  sub_2266603B0();
  sub_2266603DC(&dword_22665B000, a2, v4, "[%@] - Calendar plugin doesn't handle multiple recurrences.", v5);

  sub_22665C904();
}

void sub_226661950()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_22665D4D8();
  v0 = (id)sub_226660364();
  sub_226660394();
  sub_226660310(&dword_22665B000, v1, v2, "%s [%@] - Giving event recurrence rule %@", v3, v4, v5, v6, 2u);

  sub_22665D4AC();
}

void sub_2266619D8()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_22665D4D8();
  v0 = (id)sub_226660350();
  sub_2266603CC();
  sub_2266602FC(&dword_22665B000, v1, v2, "[%@] - Giving event recurrence rule %@", v3, v4, v5, v6, 2u);

  sub_22665D4BC();
}

void sub_226661A5C()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_22665D4D8();
  v1 = (id)sub_226660364();
  v2 = (void *)sub_226660358();
  objc_msgSend_title(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_226660324();
  sub_226660310(&dword_22665B000, v7, v8, "%s [%@] - Event title is now %@", v9, v10, v11, v12, 2u);

  sub_22665D4AC();
}

void sub_226661AF4()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_22665D4D8();
  v1 = (id)sub_226660350();
  v2 = (void *)sub_226660358();
  objc_msgSend_title(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_226660340();
  sub_2266602FC(&dword_22665B000, v7, v8, "[%@] - Event title is now %@", v9, v10, v11, v12, 2u);

  sub_22665D4BC();
}

void sub_226661B88()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;
  id v5;

  v5 = (id)sub_226660364();
  sub_2266603BC();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x1Cu);

  sub_22665D4AC();
}

void sub_226661C38()
{
  id v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  v0 = (id)sub_226660350();
  sub_2266603B0();
  sub_2266603BC();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x12u);

  sub_22665D4BC();
}

void sub_226661CD0()
{
  void *v0;
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_22665D4D8();
  v1 = (id)sub_226660364();
  sub_2266603E8((uint64_t)v1, v2, v3, v4);
  sub_226660310(&dword_22665B000, v5, v6, "%s [%@] - Giving event %ld attendees", v7, v8, v9, v10, 2u);

  sub_22665D4AC();
}

void sub_226661D70()
{
  void *v0;
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_22665D4D8();
  v1 = (id)sub_226660350();
  sub_2266603E8((uint64_t)v1, v2, v3, v4);
  sub_2266602FC(&dword_22665B000, v5, v6, "[%@] - Giving event %ld attendees", v7, v8, v9, v10, 2u);

  sub_22665D4BC();
}

void sub_226661DFC(uint64_t a1, void *a2, NSObject *a3)
{
  void *v3;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (id)objc_opt_class();
  objc_msgSend_startDate(a2, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endDate(a2, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v18 = 136316162;
  v19 = "-[CalAssistantEventCommit _commitEvent:serviceHelper:]";
  v20 = 2112;
  v21 = v6;
  v22 = 2112;
  v23 = v10;
  v24 = 2112;
  v25 = v3;
  v26 = 1024;
  v27 = sub_2266603F4(v14, v15, v16, v17);
  _os_log_debug_impl(&dword_22665B000, a3, OS_LOG_TYPE_DEBUG, "%s [%@] - Event has start date %@, end date %@, all day %d", (uint8_t *)&v18, 0x30u);

}

void sub_226661F00(uint64_t a1, void *a2, NSObject *a3)
{
  void *v3;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;

  v6 = (id)sub_226660364();
  objc_msgSend_startDate(a2, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endDate(a2, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v18 = 138413058;
  v19 = v6;
  v20 = 2112;
  v21 = v10;
  v22 = 2112;
  v23 = v3;
  v24 = 1024;
  v25 = sub_2266603F4(v14, v15, v16, v17);
  _os_log_debug_impl(&dword_22665B000, a3, OS_LOG_TYPE_DEBUG, "[%@] - Event has start date %@, end date %@, all day %d", (uint8_t *)&v18, 0x26u);

}

void sub_226661FF0()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_22665D4D8();
  v1 = (id)sub_226660364();
  v2 = (void *)sub_226660358();
  objc_msgSend_notes(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_226660324();
  sub_226660310(&dword_22665B000, v7, v8, "%s [%@] - Giving event notes %@", v9, v10, v11, v12, 2u);

  sub_22665D4AC();
}

void sub_226662088()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_22665D4D8();
  v1 = (id)sub_226660350();
  v2 = (void *)sub_226660358();
  objc_msgSend_notes(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_226660340();
  sub_2266602FC(&dword_22665B000, v7, v8, "[%@] - Giving event notes %@", v9, v10, v11, v12, 2u);

  sub_22665D4BC();
}

void sub_22666211C()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_22665D4D8();
  v1 = (id)sub_226660364();
  v2 = (void *)sub_226660358();
  objc_msgSend_location(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_226660324();
  sub_226660310(&dword_22665B000, v7, v8, "%s [%@] - Giving event location %@", v9, v10, v11, v12, 2u);

  sub_22665D4AC();
}

void sub_2266621B4()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_22665D4D8();
  v1 = (id)sub_226660350();
  v2 = (void *)sub_226660358();
  objc_msgSend_location(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_226660340();
  sub_2266602FC(&dword_22665B000, v7, v8, "[%@] - Giving event location %@", v9, v10, v11, v12, 2u);

  sub_22665D4BC();
}

void sub_226662248()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_22665D4D8();
  v1 = (id)sub_226660364();
  v2 = (void *)sub_226660358();
  objc_msgSend_title(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_226660324();
  sub_226660310(&dword_22665B000, v7, v8, "%s [%@] - Giving event title %@", v9, v10, v11, v12, 2u);

  sub_22665D4AC();
}

void sub_2266622E0()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_22665D4D8();
  v1 = (id)sub_226660350();
  v2 = (void *)sub_226660358();
  objc_msgSend_title(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_226660340();
  sub_2266602FC(&dword_22665B000, v7, v8, "[%@] - Giving event title %@", v9, v10, v11, v12, 2u);

  sub_22665D4BC();
}

void sub_226662374()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_22665D4D8();
  v1 = (id)sub_226660364();
  v2 = (void *)sub_226660358();
  objc_msgSend_calendar(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_title(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_226660324();
  sub_226660310(&dword_22665B000, v11, v12, "%s [%@] - Created a new event in calendar %@", v13, v14, v15, v16, 2u);

  sub_22665D4AC();
}

void sub_22666241C()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_22665D4D8();
  v1 = (id)sub_226660350();
  v2 = (void *)sub_226660358();
  objc_msgSend_calendar(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_title(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_226660340();
  sub_2266602FC(&dword_22665B000, v11, v12, "[%@] - Created a new event in calendar %@", v13, v14, v15, v16, 2u);

  sub_22665D4BC();
}

void sub_2266624C0(void *a1)
{
  NSObject *v1;
  id v2;
  id v3;
  id v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  sub_22665C8E4();
  v5 = 136315394;
  v6 = "-[CalAssistantEventCommit _commitEvent:serviceHelper:]";
  sub_226660340();
  v4 = v3;
  _os_log_error_impl(&dword_22665B000, v1, OS_LOG_TYPE_ERROR, "%s [%@] - Can't modify a read-only event", (uint8_t *)&v5, 0x16u);

  sub_22665C904();
}

void sub_226662560(void *a1)
{
  NSObject *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  sub_22665C8E4();
  sub_2266603B0();
  v4 = v3;
  sub_2266603DC(&dword_22665B000, v1, v5, "[%@] - Can't modify a read-only event", v6);

  sub_22665C904();
}

void sub_2266625E8()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  os_log_t v7;
  os_log_type_t v8;
  const char *v9;
  uint8_t *v10;
  void *v11;

  sub_22665D4D8();
  v1 = (id)objc_opt_class();
  v2 = (void *)sub_226660358();
  objc_msgSend_title(v2, v3, v4, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2266603BC();
  _os_log_debug_impl(v6, v7, v8, v9, v10, 0x2Au);

}

void sub_2266626B4()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_22665D4D8();
  v1 = (id)sub_226660364();
  v2 = (void *)sub_226660358();
  objc_msgSend_title(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2266603CC();
  sub_226660310(&dword_22665B000, v7, v8, "[%@] - Found existing event %@ with title %@", v9, v10, v11, v12, 2u);

  sub_22665D4AC();
}

void sub_226662750()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_22665D4D8();
  v1 = (id)sub_226660364();
  v2 = (void *)sub_226660358();
  objc_msgSend_identifier(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_226660324();
  sub_226660310(&dword_22665B000, v7, v8, "%s [%@] - Looking for event with identifier %@", v9, v10, v11, v12, 2u);

  sub_22665D4AC();
}

void sub_2266627E8()
{
  void *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_22665D4D8();
  v1 = (id)sub_226660350();
  v2 = (void *)sub_226660358();
  objc_msgSend_identifier(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_226660340();
  sub_2266602FC(&dword_22665B000, v7, v8, "[%@] - Looking for event with identifier %@", v9, v10, v11, v12, 2u);

  sub_22665D4BC();
}

void sub_22666287C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (id)sub_226660350();
  sub_226660340();
  sub_2266602FC(&dword_22665B000, v1, v2, "%s [%@] - Performing Event Commit", v3, v4, v5, v6, 2u);

  sub_22665C904();
}

void sub_226662904()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (id)sub_226660350();
  sub_2266603B0();
  sub_22666036C(&dword_22665B000, v1, v2, "[%@] - Performing Event Commit", v3, v4, v5, v6, v7);

  sub_22665C904();
}

CFAbsoluteTime CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTime at, CFTimeZoneRef tz, CFGregorianUnits *units)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB778](tz, units, at);
  return result;
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x24BDBC768](allocator, name, tryAbbrev);
}

uint64_t CalCopyTimeZone()
{
  return MEMORY[0x24BE13F18]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

