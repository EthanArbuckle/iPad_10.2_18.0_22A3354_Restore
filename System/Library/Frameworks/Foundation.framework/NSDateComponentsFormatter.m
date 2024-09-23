@implementation NSDateComponentsFormatter

- (NSString)stringFromTimeInterval:(NSTimeInterval)ti
{
  id v5;
  NSString *v6;

  if ((*(_QWORD *)&ti & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDateComponentsFormatter.m"), 484, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(timeInterval) && !isnan(timeInterval)"));
  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setSecond:", (uint64_t)ti);
  objc_msgSend(v5, "setMinute:", 0);
  objc_msgSend(v5, "setHour:", 0);
  objc_msgSend(v5, "setDay:", 0);
  objc_msgSend(v5, "setWeekOfMonth:", 0);
  objc_msgSend(v5, "setMonth:", 0);
  objc_msgSend(v5, "setYear:", 0);
  v6 = -[NSDateComponentsFormatter stringForObjectValue:](self, "stringForObjectValue:", v5);

  return v6;
}

- (id)stringForObjectValue:(id)a3 withReferenceDate:(id)a4
{
  id v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  uint64_t k;
  int m;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t unitsStyle;
  void *v23;
  NSDateComponentsFormatter *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  NSMutableString *v34;
  id v35;
  void *v36;
  BOOL v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int TimePattern;
  int v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  void *v52;
  void *v53;
  unint64_t v54;
  uint64_t v55;
  char v56;
  unint64_t v57;
  char v58;
  int v59;
  __int128 v60;
  unint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int ListPattern;
  int v67;
  int v68;
  BOOL v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  int v77;
  void *v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  _BOOL4 v82;
  NSString *v83;
  void *v84;
  NSString *v85;
  NSMutableString *v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  NSNumber *v93;
  uint64_t v94;
  unint64_t v95;
  NSNumber *v96;
  void *context;
  void *v98;
  void *v99;
  NSDateComponentsFormatter *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t zeroFormattingBehavior;
  NSMutableString *v105;
  _QWORD v106[6];
  _QWORD v107[8];
  _QWORD v108[3];
  int v109;
  uint64_t v110;
  _OWORD v111[16];
  _BYTE v112[128];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _OWORD v133[3];
  uint64_t v134;
  _OWORD v135[3];
  uint64_t v136;
  _QWORD __b[7];
  _OWORD v138[3];
  uint64_t v139;
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  context = (void *)MEMORY[0x186DA8F78]();
  v7 = -[NSDateComponentsFormatter _calendarFromDateComponents:](self, "_calendarFromDateComponents:", a3);
  v8 = (void *)objc_msgSend(v7, "locale");
  if (!v8)
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  if (!objc_msgSend((id)objc_msgSend(v8, "localeIdentifier"), "length"))
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v98 = v8;
  v99 = (void *)objc_msgSend(v8, "localeIdentifier");
  objc_msgSend(v99, "UTF8String");
  zeroFormattingBehavior = self->_zeroFormattingBehavior;
  if (zeroFormattingBehavior == 1)
  {
    v9 = 14;
    if (!self->_unitsStyle)
      v9 = 2;
    LODWORD(zeroFormattingBehavior) = v9;
  }
  v110 = 0;
  v100 = self;
  v10 = -[NSDateComponentsFormatter _canonicalizedDateComponents:withCalendar:usedUnits:withReferenceDate:](self, "_canonicalizedDateComponents:withCalendar:usedUnits:withReferenceDate:", a3, v7, &v110, a4);
  v139 = 0;
  memset(v138, 0, sizeof(v138));
  memset_pattern16(__b, &unk_18227E5F0, 0x38uLL);
  v108[0] = 0;
  v108[1] = v108;
  v108[2] = 0x2020000000;
  v109 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v107[0] = MEMORY[0x1E0C809B0];
  v107[1] = 3221225472;
  v107[2] = __68__NSDateComponentsFormatter_stringForObjectValue_withReferenceDate___block_invoke;
  v107[3] = &unk_1E0F4FCF8;
  v107[4] = v10;
  v107[5] = v108;
  v107[6] = __b;
  v107[7] = v138;
  forEachUnit(v110, (uint64_t)v107);
  if ((zeroFormattingBehavior & 2) != 0)
  {
    for (i = 0; i != 7; ++i)
    {
      v13 = __b[i];
      if (v13 != 0x8000000000000000)
      {
        if (v13)
          break;
        __b[i] = 0x8000000000000000;
        *(_QWORD *)((char *)v138 + i * 8) = 0;
      }
    }
  }
  if ((zeroFormattingBehavior & 8) != 0)
  {
    for (j = 6; j != -1; --j)
    {
      v15 = __b[j];
      if (v15 != 0x8000000000000000)
      {
        if (v15)
          break;
        __b[j] = 0x8000000000000000;
        *(_QWORD *)((char *)v138 + j * 8) = 0;
      }
    }
  }
  if ((zeroFormattingBehavior & 4) != 0)
  {
    for (k = 0; k != 7; ++k)
    {
      if (__b[k] != 0x8000000000000000)
        break;
    }
    for (m = 6; m != -1; --m)
    {
      if (__b[m] != 0x8000000000000000)
        break;
    }
    if ((int)k < m)
    {
      v18 = m - (unint64_t)k;
      v19 = (_QWORD *)v138 + k;
      v20 = &__b[k];
      do
      {
        if (!*v20)
        {
          *v20 = 0x8000000000000000;
          *v19 = 0;
        }
        ++v19;
        ++v20;
        --v18;
      }
      while (v18);
    }
  }
  v21 = 0;
  unitsStyle = self->_unitsStyle;
  while (!*(_QWORD *)((char *)v138 + v21))
  {
    v21 += 8;
    if (v21 == 56)
    {
      *(_QWORD *)&v117 = 0;
      *((_QWORD *)&v117 + 1) = &v117;
      v118 = 0x2020000000uLL;
      v106[0] = v11;
      v106[1] = 3221225472;
      v106[2] = __68__NSDateComponentsFormatter_stringForObjectValue_withReferenceDate___block_invoke_2;
      v106[3] = &unk_1E0F4FD20;
      v106[4] = v10;
      v106[5] = &v117;
      forEachUnit(v110, (uint64_t)v106);
      *(_QWORD *)&v138[0] = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 24);
      __b[0] = 0;
      _Block_object_dispose(&v117, 8);
      break;
    }
  }
  if (unitsStyle)
  {
    v101 = 0x8000000000000000;
    v102 = 0x8000000000000000;
    v103 = 0x8000000000000000;
    v23 = v8;
    v24 = self;
  }
  else
  {
    v26 = 0;
    v103 = 0x8000000000000000;
    v101 = 0x8000000000000000;
    v102 = 0x8000000000000000;
    v23 = v8;
    v24 = self;
    do
    {
      v27 = *(_QWORD *)((char *)v138 + v26 * 8);
      switch(v27)
      {
        case 32:
          v103 = __b[v26];
          break;
        case 64:
          v102 = __b[v26];
          break;
        case 128:
          v101 = __b[v26];
          break;
      }
      ++v26;
    }
    while (v26 != 7);
  }
  v28 = 0;
  v29 = 0;
  v136 = 0;
  memset(v135, 0, sizeof(v135));
  v134 = 0;
  memset(v133, 0, sizeof(v133));
  do
  {
    v30 = *(_QWORD *)((char *)v138 + v28 * 8);
    if (v30)
    {
      *((_QWORD *)v135 + v29) = v30;
      *((_QWORD *)v133 + v29++) = __b[v28];
      *(_QWORD *)((char *)v138 + v28 * 8) = 0;
    }
    ++v28;
  }
  while (v28 != 7);
  if (v29 >= 2)
  {
    v31 = v29 - 1;
    v32 = (uint64_t *)v133 + 1;
    do
    {
      v33 = *v32;
      if (*v32 < 0)
        v33 = -v33;
      *v32++ = v33;
      --v31;
    }
    while (v31);
  }
  if (!unitsStyle)
  {
    os_unfair_lock_lock(&v24->_lock);
    -[NSDateComponentsFormatter _ensureUnitFormatterWithLocale_alreadyLocked:](v24, "_ensureUnitFormatterWithLocale_alreadyLocked:", v23);
    v35 = (id)-[NSNumberFormatter copy](v24->_unitFormatter, "copy");
    v36 = v35;
    if ((zeroFormattingBehavior & 0x10000) != 0)
      objc_msgSend(v35, "setMinimumIntegerDigits:", 2);
    os_unfair_lock_unlock(&v24->_lock);
    v37 = v101 == 0x8000000000000000 || v102 == 0x8000000000000000;
    v38 = !v37;
    if (v37 || v103 == 0x8000000000000000)
    {
      if (v38)
      {
        v42 = v101;
        if (v101 < 0)
          v42 = -v101;
        v101 = v42;
      }
      else
      {
        if (v102 == 0x8000000000000000 || v103 == 0x8000000000000000)
        {
          v105 = 0;
          v70 = v103 == 0x8000000000000000 && v102 == 0x8000000000000000 && v101 == 0x8000000000000000;
          if (!v70 && v29 == 1)
          {
            if (!v24->_includesTimeRemainingPhrase && !v24->_includesApproximationPhrase)
            {
              v93 = [NSNumber alloc];
              v94 = v101;
              if (v102 != 0x8000000000000000)
                v94 = v102;
              if (v103 == 0x8000000000000000)
                v95 = v94;
              else
                v95 = v103;
              v96 = -[NSNumber initWithInteger:](v93, "initWithInteger:", v95);
              v34 = (NSMutableString *)(id)objc_msgSend((id)objc_msgSend(v36, "stringFromNumber:", v96), "mutableCopy");

              goto LABEL_151;
            }
            v105 = 0;
            v29 = 1;
            objc_msgSend(0, "insertString:atIndex:", CFSTR("{0} "), 0);
            goto LABEL_108;
          }
LABEL_106:
          v34 = v105;
          if (!v29)
            goto LABEL_151;
          -[NSMutableString insertString:atIndex:](v105, "insertString:atIndex:", CFSTR("{0} "), 0);
LABEL_108:
          unitsStyle = 1;
          goto LABEL_109;
        }
        v43 = v102;
        if (v102 < 0)
          v43 = -v102;
        v102 = v43;
      }
      v41 = -2;
    }
    else
    {
      if (v101 >= 0)
        v39 = v101;
      else
        v39 = -v101;
      v40 = v102;
      if (v102 < 0)
        v40 = -v102;
      v101 = v39;
      v102 = v40;
      v41 = -3;
    }
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    LODWORD(v111[0]) = 0;
    TimePattern = uatmufmt_getTimePattern();
    if (SLODWORD(v111[0]) > 0)
      goto LABEL_89;
    v45 = TimePattern;
    v105 = +[NSString string](NSMutableString, "string");
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v46 = +[NSDateFormatter _componentsFromFormatString:](NSDateFormatter, "_componentsFromFormatString:", +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v117, v45));
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v113, v112, 16);
    v29 += v41;
    if (v47)
    {
      v48 = *(_QWORD *)v114;
      v49 = *MEMORY[0x1E0C99740];
      v50 = *MEMORY[0x1E0C99730];
      do
      {
        for (n = 0; n != v47; ++n)
        {
          if (*(_QWORD *)v114 != v48)
            objc_enumerationMutation(v46);
          v52 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * n);
          v53 = (void *)objc_msgSend(v52, "objectForKey:", v49);
          if ((objc_msgSend((id)objc_msgSend(v52, "objectForKey:", v50), "BOOLValue") & 1) == 0)
          {
            v54 = objc_msgSend(v53, "length");
            v55 = ((v54 < 2) & WORD1(zeroFormattingBehavior)) != 0 ? 2 : v54;
            objc_msgSend(v36, "setMinimumIntegerDigits:", v55);
            v56 = objc_msgSend(v53, "hasPrefix:", CFSTR("h"));
            v57 = v103;
            if ((v56 & 1) != 0
              || (v58 = objc_msgSend(v53, "hasPrefix:", CFSTR("m")), v57 = v102, (v58 & 1) != 0)
              || (v59 = objc_msgSend(v53, "hasPrefix:", CFSTR("s")), v57 = v101, v59))
            {
              v53 = (void *)objc_msgSend(v36, "stringFromNumber:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v57));
            }
          }
          -[NSMutableString appendString:](v105, "appendString:", v53);
        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v113, v112, 16);
      }
      while (v47);
    }
    v24 = v100;
    goto LABEL_106;
  }
  v105 = 0;
  v34 = 0;
  if (!v29)
    goto LABEL_151;
LABEL_109:
  v60 = 0uLL;
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v61 = v29 - 2;
  if (v29 != 2)
  {
    if (v29 == 1)
    {
      memset(&v111[8], 0, 128);
      if (!v105)
      {
        v105 = +[NSString stringWithString:](NSMutableString, "stringWithString:", CFSTR("{0}"));
        v60 = 0uLL;
      }
      v111[6] = v60;
      v111[7] = v60;
      v111[4] = v60;
      v111[5] = v60;
      v111[2] = v60;
      v111[3] = v60;
      v111[0] = v60;
      v111[1] = v60;
      os_unfair_lock_lock(&v24->_lock);
      if (-[NSDateComponentsFormatter _updateFormatterCacheIfNeeded_locked:unitsStyle:](v24, "_updateFormatterCacheIfNeeded_locked:unitsStyle:", v99, unitsStyle))
      {
        icuUnitFromNSUnit(*(uint64_t *)&v135[0]);
        v62 = uatmufmt_format();
        os_unfair_lock_unlock(&v24->_lock);
        v63 = -[NSString rangeOfString:](v105, "rangeOfString:", CFSTR("{0}"));
        -[NSMutableString replaceCharactersInRange:withCharacters:length:](v105, "replaceCharactersInRange:withCharacters:length:", v63, v64, v111, v62);
      }
      else
      {
        os_unfair_lock_unlock(&v24->_lock);
        v105 = 0;
      }
      goto LABEL_150;
    }
    goto LABEL_116;
  }
  if (!v105)
  {
    icuStyleFromNSStyle(unitsStyle);
    ListPattern = uatmufmt_getListPattern();
    v34 = 0;
    if (ListPattern < 1)
      goto LABEL_151;
    v34 = -[NSString initWithCharacters:length:]([NSMutableString alloc], "initWithCharacters:length:", &v117, ListPattern);
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    os_unfair_lock_lock(&v24->_lock);
    if (-[NSDateComponentsFormatter _updateFormatterCacheIfNeeded_locked:unitsStyle:](v24, "_updateFormatterCacheIfNeeded_locked:unitsStyle:", v99, unitsStyle))
    {
      icuUnitFromNSUnit(*((uint64_t *)&v135[0] + 1));
      v67 = uatmufmt_format();
      os_unfair_lock_unlock(&v24->_lock);
      v87 = -[NSString rangeOfString:](v34, "rangeOfString:", CFSTR("{1}"));
      -[NSMutableString replaceCharactersInRange:withCharacters:length:](v34, "replaceCharactersInRange:withCharacters:length:", v87, v88, &v117, v67);
      v89 = 0;
    }
    else
    {
      os_unfair_lock_unlock(&v24->_lock);
      v34 = 0;
      v89 = 1;
    }
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    os_unfair_lock_lock(&v24->_lock);
    if (-[NSDateComponentsFormatter _updateFormatterCacheIfNeeded_locked:unitsStyle:](v24, "_updateFormatterCacheIfNeeded_locked:unitsStyle:", v99, unitsStyle))
    {
      icuUnitFromNSUnit(*(_QWORD *)((unint64_t)v135 & 0xFFFFFFFFFFFFFFF7 | (8 * (v89 & 1))));
      v90 = uatmufmt_format();
      os_unfair_lock_unlock(&v24->_lock);
      v91 = -[NSString rangeOfString:](v34, "rangeOfString:", CFSTR("{0}"));
      -[NSMutableString replaceCharactersInRange:withCharacters:length:](v34, "replaceCharactersInRange:withCharacters:length:", v91, v92, &v117, v90);
      goto LABEL_151;
    }
    os_unfair_lock_unlock(&v24->_lock);
LABEL_89:
    v34 = 0;
    goto LABEL_151;
  }
LABEL_116:
  if (unitsStyle >= 6)
    abort();
  v65 = uatmufmt_getListPattern();
  v34 = 0;
  if (v65 >= 1)
  {
    if (v105)
      -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v105, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{0}"), +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v117, v65), 0, 0, -[NSString length](v105, "length"));
    else
      v105 = -[NSString initWithCharacters:length:]([NSMutableString alloc], "initWithCharacters:length:", &v117, v65);
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    os_unfair_lock_lock(&v24->_lock);
    if (-[NSDateComponentsFormatter _updateFormatterCacheIfNeeded_locked:unitsStyle:](v24, "_updateFormatterCacheIfNeeded_locked:unitsStyle:", v99, unitsStyle))
    {
      icuUnitFromNSUnit(*((_QWORD *)v135 + v29 - 1));
      v68 = uatmufmt_format();
      os_unfair_lock_unlock(&v24->_lock);
      v71 = -[NSString rangeOfString:](v105, "rangeOfString:", CFSTR("{1}"));
      -[NSMutableString replaceCharactersInRange:withCharacters:length:](v105, "replaceCharactersInRange:withCharacters:length:", v71, v72, &v117, v68);
    }
    else
    {
      os_unfair_lock_unlock(&v24->_lock);
      v105 = 0;
      v61 = v29 - 1;
    }
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    os_unfair_lock_lock(&v24->_lock);
    if (-[NSDateComponentsFormatter _updateFormatterCacheIfNeeded_locked:unitsStyle:](v24, "_updateFormatterCacheIfNeeded_locked:unitsStyle:", v99, unitsStyle))
    {
      icuUnitFromNSUnit(*((_QWORD *)v135 + v61));
      v73 = uatmufmt_format();
      os_unfair_lock_unlock(&v24->_lock);
      --v61;
      v74 = -[NSString rangeOfString:](v105, "rangeOfString:", CFSTR("{0}"));
      -[NSMutableString replaceCharactersInRange:withCharacters:length:](v105, "replaceCharactersInRange:withCharacters:length:", v74, v75, &v117, v73);
    }
    else
    {
      os_unfair_lock_unlock(&v24->_lock);
      v105 = 0;
    }
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    if ((v61 & 0x80000000) != 0)
    {
LABEL_150:
      v34 = v105;
      goto LABEL_151;
    }
    v76 = v61 + 1;
    do
    {
      --v76;
      v77 = uatmufmt_getListPattern();
      v34 = 0;
      if (v77 < 1)
        break;
      v78 = (void *)-[NSMutableString copy](v105, "copy");
      -[NSMutableString replaceCharactersInRange:withCharacters:length:](v105, "replaceCharactersInRange:withCharacters:length:", 0, -[NSString length](v105, "length"), &v117, v77);
      -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v105, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{1}"), v78, 0, 0, -[NSString length](v105, "length"));

      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      os_unfair_lock_lock(&v24->_lock);
      if (-[NSDateComponentsFormatter _updateFormatterCacheIfNeeded_locked:unitsStyle:](v24, "_updateFormatterCacheIfNeeded_locked:unitsStyle:", v99, unitsStyle))
      {
        icuUnitFromNSUnit(*((_QWORD *)v135 + v61));
        v79 = uatmufmt_format();
        os_unfair_lock_unlock(&v24->_lock);
        --v61;
        v80 = -[NSString rangeOfString:](v105, "rangeOfString:", CFSTR("{0}"));
        -[NSMutableString replaceCharactersInRange:withCharacters:length:](v105, "replaceCharactersInRange:withCharacters:length:", v80, v81, &v117, v79);
      }
      else
      {
        os_unfair_lock_unlock(&v24->_lock);
        v105 = 0;
      }
      v34 = v105;
    }
    while (v76 > 0);
  }
LABEL_151:
  _Block_object_dispose(v108, 8);
  if (-[NSString length](v34, "length"))
  {
    if (v100->_includesApproximationPhrase)
    {
      v82 = !v100->_includesTimeRemainingPhrase;
      v83 = [NSString alloc];
      v84 = (void *)_NSFoundationBundle();
      if (v82)
        v85 = -[NSString initWithFormat:locale:](v83, "initWithFormat:locale:", objc_msgSend(v84, "localizedStringForKey:value:table:", CFSTR("About %@"), &stru_1E0F56070, CFSTR("DurationFormatting")), v98, v34);
      else
        v85 = -[NSString initWithFormat:locale:](v83, "initWithFormat:locale:", objc_msgSend(v84, "localizedStringForKey:value:table:", CFSTR("About %@ remaining"), &stru_1E0F56070, CFSTR("DurationFormatting")), v98, v34);
      goto LABEL_159;
    }
    if (v100->_includesTimeRemainingPhrase)
    {
      v85 = -[NSString initWithFormat:locale:]([NSString alloc], "initWithFormat:locale:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("%@ remaining"), &stru_1E0F56070, CFSTR("DurationFormatting")), v98, v34);
LABEL_159:
      v34 = (NSMutableString *)v85;
      goto LABEL_160;
    }
  }
  v86 = v34;
LABEL_160:
  objc_autoreleasePoolPop(context);
  return v34;
}

uint64_t __68__NSDateComponentsFormatter_stringForObjectValue_withReferenceDate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "valueForComponent:", a2);
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) = result;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * (int)(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++) = a2;
  return result;
}

uint64_t __99__NSDateComponentsFormatter__canonicalizedDateComponents_withCalendar_usedUnits_withReferenceDate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "valueForComponent:", a2);
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) = result;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * (int)(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++) = a2;
  return result;
}

- (BOOL)_updateFormatterCacheIfNeeded_locked:(id)a3 unitsStyle:(int64_t)a4
{
  if (self->_fmt && -[NSString isEqualToString:](self->_fmtLocaleIdent, "isEqualToString:", a3))
    return 1;
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(a3, "UTF8String");
  if (a4 == 4)
  {
    unum_open();
    os_unfair_lock_lock(&self->_lock);
    -[NSDateComponentsFormatter _flushFormatterCache_locked](self, "_flushFormatterCache_locked");
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSDateComponentsFormatter _flushFormatterCache_locked](self, "_flushFormatterCache_locked");
    if ((unint64_t)(a4 - 1) >= 5 || ((0x17u >> (a4 - 1)) & 1) == 0)
      abort();
  }
  self->_fmt = (void *)uatmufmt_openWithNumberFormat();
  self->_fmtLocaleIdent = (NSString *)objc_msgSend(a3, "copy");
  return 1;
}

- (id)_canonicalizedDateComponents:(id)a3 withCalendar:(id)a4 usedUnits:(unint64_t *)a5 withReferenceDate:(id)a6
{
  id v8;
  unint64_t allowedUnits;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t unitsStyle;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t maximumUnitCount;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  int64_t v54;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  int v62;
  uint64_t v64;
  unint64_t *v66;
  NSDateComponentsFormatter *v68;
  _QWORD v69[8];
  _QWORD v70[3];
  int v71;
  _OWORD v72[3];
  uint64_t v73;
  _OWORD v74[3];
  uint64_t v75;
  uint64_t v76;

  v8 = a4;
  v76 = *MEMORY[0x1E0C80C00];
  allowedUnits = self->_allowedUnits;
  if (!allowedUnits)
  {
    v12 = 4 * (objc_msgSend(a3, "year") != 0x7FFFFFFFFFFFFFFFLL);
    v13 = v12 | (8 * (objc_msgSend(a3, "month") != 0x7FFFFFFFFFFFFFFFLL));
    v14 = v13 | ((unint64_t)(objc_msgSend(a3, "weekOfMonth") != 0x7FFFFFFFFFFFFFFFLL) << 12);
    v15 = v14 | (16 * (objc_msgSend(a3, "day") != 0x7FFFFFFFFFFFFFFFLL));
    v16 = v15 | (32 * (objc_msgSend(a3, "hour") != 0x7FFFFFFFFFFFFFFFLL));
    v17 = v16 | ((unint64_t)(objc_msgSend(a3, "minute") != 0x7FFFFFFFFFFFFFFFLL) << 6);
    allowedUnits = v17 | ((unint64_t)(objc_msgSend(a3, "second") != 0x7FFFFFFFFFFFFFFFLL) << 7);
    v8 = a4;
  }
  unitsStyle = self->_unitsStyle;
  if (!unitsStyle)
  {
    v19 = 0;
    v20 = 0;
    do
    {
      if ((*(_QWORD *)((_BYTE *)&unk_18227E5A0 + unitsStyle) & ~allowedUnits) != 0)
      {
        v20 |= v19;
      }
      else
      {
        if ((v19 & v20 & 1) != 0)
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Specifying positional units with gaps is ambiguous, and therefore unsupported"), 0));
        v19 = 1;
      }
      unitsStyle += 8;
    }
    while (unitsStyle != 56);
  }
  if (!a6)
    a6 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v21 = objc_msgSend(v8, "dateByAddingComponents:toDate:options:", a3, a6, 0);
  v22 = objc_msgSend(v8, "components:fromDate:toDate:options:", allowedUnits, a6, v21, 0);
  v23 = (void *)v22;
  if (self->_collapsesLargestUnit || self->_maximumUnitCount >= 1)
  {
    v75 = 0;
    memset(v74, 0, sizeof(v74));
    v73 = 0;
    memset(v72, 0, sizeof(v72));
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    v71 = 0;
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __99__NSDateComponentsFormatter__canonicalizedDateComponents_withCalendar_usedUnits_withReferenceDate___block_invoke;
    v69[3] = &unk_1E0F4FCF8;
    v69[4] = v22;
    v69[5] = v70;
    v69[6] = v72;
    v69[7] = v74;
    forEachUnit(allowedUnits, (uint64_t)v69);
    v66 = a5;
    v68 = self;
    if (self->_collapsesLargestUnit)
    {
      v24 = 0;
      v25 = -1;
      do
      {
        if (!*((_QWORD *)v74 + v24))
          goto LABEL_28;
        v26 = *((_QWORD *)v72 + v24);
        if (!v26)
          goto LABEL_28;
        if (v26 == 1 && v25 == -1)
        {
          v28 = (char *)v74 + 8 * v24;
          v29 = objc_msgSend(v8, "rangeOfUnit:inUnit:forDate:", *((_QWORD *)v28 + 1));
          v31 = (char *)v72 + 8 * v24;
          v32 = *((_QWORD *)v31 + 1);
          v33 = (double)v30 * 0.1;
          if (v33 <= (double)(unint64_t)(v32 - v29) && v33 <= (double)(v29 + v30 - v32))
          {
LABEL_27:
            v25 = v24;
            goto LABEL_28;
          }
          allowedUnits &= ~*((_QWORD *)v74 + v24);
          v23 = (void *)objc_msgSend(v8, "components:fromDate:toDate:options:", allowedUnits, a6, v21, 0);
          *((_QWORD *)v72 + v24) = 0;
          v34 = objc_msgSend(v23, "valueForComponent:", *((_QWORD *)v28 + 1));
          v25 = v24 + 1;
          *((_QWORD *)v31 + 1) = v34;
        }
        else if (v25 == -1)
        {
          goto LABEL_27;
        }
LABEL_28:
        ++v24;
      }
      while (v24 != 6);
    }
    maximumUnitCount = v68->_maximumUnitCount;
    if (maximumUnitCount >= 1)
    {
      v36 = 0;
      v37 = 0;
      v38 = 0;
      while (1)
      {
        if (!*((_QWORD *)v74 + v36) || !*((_QWORD *)v72 + v36))
        {
          v39 = v38;
          goto LABEL_36;
        }
        v39 = v38 + 1;
        if (v38 == maximumUnitCount)
          break;
        v37 = v36;
LABEL_36:
        ++v36;
        v38 = v39;
        if (v36 == 7)
          goto LABEL_39;
      }
      v37 = v36;
LABEL_39:
      if (v39 > maximumUnitCount && (int)v37 >= 1)
      {
        v40 = v37;
        if (v37 <= 5)
        {
          v41 = 8 * v37;
          bzero((char *)v72 + v41 + 8, 8 * (5 - v37) + 8);
          do
          {
            allowedUnits &= ~*(_QWORD *)((char *)v74 + v41 + 8);
            v41 += 8;
          }
          while (v41 != 48);
        }
        v42 = 0;
        while (1)
        {
          if (v42)
          {
            v43 = *((_QWORD *)v72 + v40);
            v44 = v42 + v43;
            if (v40)
            {
              v45 = objc_msgSend(a4, "rangeOfUnit:inUnit:forDate:", *((_QWORD *)v74 + v40), *((_QWORD *)v74 + (v40 - 1)), v21);
              v47 = v45 + v46 - 1;
              if ((int)v43 < 1)
                v48 = -1;
              else
                v48 = 1;
              v49 = v47 >= v44;
              if (v47 >= v44)
                v50 = 0;
              else
                v50 = v45 + v46;
              if (v49)
                v42 = 0;
              else
                v42 = v48;
              v51 = v44 - v50;
            }
            else
            {
              v42 = 0;
              v51 = v44;
            }
            *((_QWORD *)v72 + v40) = v51;
            v52 = v39 - (v51 == 0);
            if (v51)
              v53 = v39 + 1;
            else
              v53 = v39;
            if ((_DWORD)v43)
              LODWORD(v39) = v52;
            else
              LODWORD(v39) = v53;
            v8 = a4;
          }
          v54 = v68->_maximumUnitCount;
          if (v54 >= (int)v39 && v42 == 0)
            goto LABEL_89;
          v56 = *((_QWORD *)v72 + v40);
          if (v40)
          {
            if (v54 < (int)v39)
              break;
          }
          if (!v56)
            goto LABEL_86;
LABEL_87:
          if (v40-- <= 0)
            goto LABEL_89;
        }
        if (*((_QWORD *)v74 + v40) == 16 && *((_QWORD *)v74 + (v40 - 1)) == 4096)
        {
          v57 = *((_QWORD *)v72 + v40);
          v58 = 7;
        }
        else
        {
          v59 = objc_msgSend(v8, "rangeOfUnit:inUnit:forDate:");
          v58 = v59 + v60;
          v57 = *((_QWORD *)v72 + v40);
        }
        v61 = 2 * v57;
        if ((v57 & 0x4000000000000000) != 0)
          v61 = -2 * v57;
        if (v57 > 0)
          v62 = 1;
        else
          v62 = -1;
        if (v61 >= v58)
          v42 = v62;
        else
          v42 = 0;
        *((_QWORD *)v72 + v40) = 0;
        LODWORD(v39) = v39 - ((_DWORD)v56 != 0);
LABEL_86:
        allowedUnits &= ~*((_QWORD *)v74 + v40);
        goto LABEL_87;
      }
    }
LABEL_89:
    v64 = 0;
    a5 = v66;
    do
    {
      objc_msgSend(v23, "setValue:forComponent:", *(_QWORD *)((char *)v72 + v64), *(_QWORD *)((char *)v74 + v64));
      v64 += 8;
    }
    while (v64 != 56);
    _Block_object_dispose(v70, 8);
  }
  *a5 = allowedUnits;
  return v23;
}

- (NSString)stringForObjectValue:(id)obj
{
  return (NSString *)-[NSDateComponentsFormatter stringForObjectValue:withReferenceDate:](self, "stringForObjectValue:withReferenceDate:", obj, self->_referenceDate);
}

- (id)_calendarOrCanonicalCalendar
{
  os_unfair_lock_s *p_lock;
  NSCalendar *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_calendar;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    if (qword_1EDC507A8 != -1)
      dispatch_once(&qword_1EDC507A8, &__block_literal_global_33);
    v4 = (NSCalendar *)(id)_MergedGlobals_6;
  }
  return v4;
}

- (id)_calendarFromDateComponents:(id)a3
{
  id result;

  result = (id)objc_msgSend(a3, "calendar");
  if (!result)
    return -[NSDateComponentsFormatter _calendarOrCanonicalCalendar](self, "_calendarOrCanonicalCalendar");
  return result;
}

uint64_t __68__NSDateComponentsFormatter_stringForObjectValue_withReferenceDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "valueForComponent:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return result;
}

- (void)setUnitsStyle:(NSDateComponentsFormatterUnitsStyle)unitsStyle
{
  if ((unint64_t)unitsStyle >= (NSDateComponentsFormatterUnitsStyleSpellOut|NSDateComponentsFormatterUnitsStyleShort))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDateComponentsFormatter.m"), 914, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unitsStyle == NSDateComponentsFormatterUnitsStyleSpellOut || unitsStyle == NSDateComponentsFormatterUnitsStyleFull || unitsStyle == NSDateComponentsFormatterUnitsStyleShort || unitsStyle == NSDateComponentsFormatterUnitsStyleAbbreviated || unitsStyle == NSDateComponentsFormatterUnitsStylePositional || unitsStyle == NSDateComponentsFormatterUnitsStyleBrief"));
  os_unfair_lock_lock(&self->_lock);
  self->_unitsStyle = unitsStyle;
  -[NSDateComponentsFormatter _flushFormatterCache_locked](self, "_flushFormatterCache_locked");
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_flushFormatterCache_locked
{
  if (self->_fmt)
  {
    uatmufmt_close();
    self->_fmt = 0;
  }

  self->_fmtLocaleIdent = 0;
  self->_unitFormatter = 0;
}

- (void)setAllowedUnits:(NSCalendarUnit)allowedUnits
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_allowedUnits = allowedUnits;
  os_unfair_lock_unlock(p_lock);
}

- (void)setIncludesTimeRemainingPhrase:(BOOL)includesTimeRemainingPhrase
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_includesTimeRemainingPhrase = includesTimeRemainingPhrase;
  os_unfair_lock_unlock(p_lock);
}

- (NSDateComponentsFormatter)init
{
  NSDateComponentsFormatter *v2;
  NSDateComponentsFormatter *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSDateComponentsFormatter;
  v2 = -[NSDateComponentsFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NSDateComponentsFormatter _NSDateComponentsFormatter_commonInit](v2, "_NSDateComponentsFormatter_commonInit");
    v3->_zeroFormattingBehavior = 1;
  }
  return v3;
}

- (void)_NSDateComponentsFormatter_commonInit
{
  self->_lock._os_unfair_lock_opaque = 0;
  self->_calendar = (NSCalendar *)(id)objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
}

- (void)setZeroFormattingBehavior:(NSDateComponentsFormatterZeroFormattingBehavior)zeroFormattingBehavior
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_zeroFormattingBehavior = zeroFormattingBehavior;
  os_unfair_lock_unlock(p_lock);
}

- (void)setCalendar:(NSCalendar *)calendar
{
  os_unfair_lock_s *p_lock;
  NSCalendar *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_calendar;
  if (v6 != calendar)
  {
    self->_calendar = (NSCalendar *)-[NSCalendar copy](calendar, "copy");

  }
  -[NSDateComponentsFormatter _flushFormatterCache_locked](self, "_flushFormatterCache_locked");
  os_unfair_lock_unlock(p_lock);
}

- (void)setMaximumUnitCount:(NSInteger)maximumUnitCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_maximumUnitCount = maximumUnitCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  os_unfair_lock_lock(&self->_lock);
  -[NSDateComponentsFormatter _flushFormatterCache_locked](self, "_flushFormatterCache_locked");
  os_unfair_lock_unlock(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)NSDateComponentsFormatter;
  -[NSDateComponentsFormatter dealloc](&v3, sel_dealloc);
}

- (void)_ensureUnitFormatterWithLocale_alreadyLocked:(id)a3
{
  NSNumberFormatter *unitFormatter;
  NSNumberFormatter *v6;
  uint64_t v7;
  uint64_t v8;

  unitFormatter = self->_unitFormatter;
  if (!unitFormatter)
  {
    v6 = objc_alloc_init(NSNumberFormatter);
    self->_unitFormatter = v6;
    -[NSNumberFormatter setFormatterBehavior:](v6, "setFormatterBehavior:", 1040);
    -[NSNumberFormatter setPaddingCharacter:](self->_unitFormatter, "setPaddingCharacter:", CFSTR("0"));
    -[NSNumberFormatter setMinimumFractionDigits:](self->_unitFormatter, "setMinimumFractionDigits:", 0);
    -[NSNumberFormatter setUsesGroupingSeparator:](self->_unitFormatter, "setUsesGroupingSeparator:", 1);
    -[NSNumberFormatter setRoundingMode:](self->_unitFormatter, "setRoundingMode:", 1);
    unitFormatter = self->_unitFormatter;
  }
  if (self->_unitsStyle == 4)
    v7 = 5;
  else
    v7 = 1;
  -[NSNumberFormatter setNumberStyle:](unitFormatter, "setNumberStyle:", v7);
  if (self->_allowsFractionalUnits)
    v8 = 3;
  else
    v8 = 0;
  -[NSNumberFormatter setMaximumFractionDigits:](self->_unitFormatter, "setMaximumFractionDigits:", v8);
  -[NSNumberFormatter setLocale:](self->_unitFormatter, "setLocale:", a3);
}

- (void)finalize
{
  os_unfair_lock_s *p_lock;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDateComponentsFormatter _flushFormatterCache_locked](self, "_flushFormatterCache_locked");
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)NSDateComponentsFormatter;
  -[NSDateComponentsFormatter finalize](&v4, sel_finalize);
}

uint64_t __57__NSDateComponentsFormatter__calendarOrCanonicalCalendar__block_invoke()
{
  id v0;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  _MergedGlobals_6 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  return objc_msgSend((id)_MergedGlobals_6, "setLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX")));
}

- (NSString)stringFromDate:(NSDate *)startDate toDate:(NSDate *)endDate
{
  id v8;
  unint64_t allowedUnits;

  if (!startDate)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDateComponentsFormatter.m"), 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate != nil"));
    if (endDate)
      goto LABEL_3;
LABEL_11:
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDateComponentsFormatter.m"), 319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate != nil"));
    goto LABEL_3;
  }
  if (!endDate)
    goto LABEL_11;
LABEL_3:
  if (!_NSIsNSDate() || !_NSIsNSDate())
    return 0;
  v8 = -[NSDateComponentsFormatter _calendarOrCanonicalCalendar](self, "_calendarOrCanonicalCalendar");
  if (self->_allowedUnits)
    allowedUnits = self->_allowedUnits;
  else
    allowedUnits = 4348;
  return (NSString *)-[NSDateComponentsFormatter stringForObjectValue:withReferenceDate:](self, "stringForObjectValue:withReferenceDate:", objc_msgSend(v8, "components:fromDate:toDate:options:", allowedUnits, startDate, endDate, 0), startDate);
}

- (void)_ensureUnitFormatterWithLocale:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDateComponentsFormatter _ensureUnitFormatterWithLocale_alreadyLocked:](self, "_ensureUnitFormatterWithLocale_alreadyLocked:", a3);
  os_unfair_lock_unlock(p_lock);
}

+ (NSString)localizedStringFromDateComponents:(NSDateComponents *)components unitsStyle:(NSDateComponentsFormatterUnitsStyle)unitsStyle
{
  id v6;
  NSString *v7;

  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setUnitsStyle:", unitsStyle);
  v7 = (NSString *)objc_msgSend(v6, "stringFromDateComponents:", components);

  return v7;
}

- (NSString)stringFromDateComponents:(NSDateComponents *)components
{
  if (!components)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDateComponentsFormatter.m"), 499, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("components != nil"));
  return -[NSDateComponentsFormatter stringForObjectValue:](self, "stringForObjectValue:", components);
}

- (NSCalendarUnit)allowedUnits
{
  os_unfair_lock_s *p_lock;
  NSCalendarUnit allowedUnits;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  allowedUnits = self->_allowedUnits;
  os_unfair_lock_unlock(p_lock);
  return allowedUnits;
}

- (NSInteger)maximumUnitCount
{
  os_unfair_lock_s *p_lock;
  NSInteger maximumUnitCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  maximumUnitCount = self->_maximumUnitCount;
  os_unfair_lock_unlock(p_lock);
  return maximumUnitCount;
}

- (void)setAllowsFractionalUnits:(BOOL)allowsFractionalUnits
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_allowsFractionalUnits = allowsFractionalUnits;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowsFractionalUnits
{
  NSDateComponentsFormatter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_allowsFractionalUnits;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCollapsesLargestUnit:(BOOL)collapsesLargestUnit
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_collapsesLargestUnit = collapsesLargestUnit;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)collapsesLargestUnit
{
  NSDateComponentsFormatter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_collapsesLargestUnit;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSCalendar)calendar
{
  os_unfair_lock_s *p_lock;
  NSCalendar *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_calendar;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDateComponentsFormatterUnitsStyle)unitsStyle
{
  os_unfair_lock_s *p_lock;
  NSDateComponentsFormatterUnitsStyle unitsStyle;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unitsStyle = self->_unitsStyle;
  os_unfair_lock_unlock(p_lock);
  return unitsStyle;
}

- (NSDateComponentsFormatterZeroFormattingBehavior)zeroFormattingBehavior
{
  os_unfair_lock_s *p_lock;
  NSDateComponentsFormatterZeroFormattingBehavior zeroFormattingBehavior;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  zeroFormattingBehavior = self->_zeroFormattingBehavior;
  os_unfair_lock_unlock(p_lock);
  return zeroFormattingBehavior;
}

- (void)setIncludesApproximationPhrase:(BOOL)includesApproximationPhrase
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_includesApproximationPhrase = includesApproximationPhrase;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)includesApproximationPhrase
{
  NSDateComponentsFormatter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_includesApproximationPhrase;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)includesTimeRemainingPhrase
{
  NSDateComponentsFormatter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_includesTimeRemainingPhrase;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_formattingContext = formattingContext;
  os_unfair_lock_unlock(p_lock);
}

- (NSFormattingContext)formattingContext
{
  os_unfair_lock_s *p_lock;
  NSFormattingContext formattingContext;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  formattingContext = self->_formattingContext;
  os_unfair_lock_unlock(p_lock);
  return formattingContext;
}

- (NSDate)referenceDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_referenceDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setReferenceDate:(NSDate *)referenceDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_referenceDate;
  if (v6 != referenceDate)
  {
    self->_referenceDate = (NSDate *)-[NSDate copy](referenceDate, "copy");

  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  if (getObjectValue_forString_errorDescription__onceToken != -1)
    dispatch_once(&getObjectValue_forString_errorDescription__onceToken, &__block_literal_global_57);
  return 0;
}

void __71__NSDateComponentsFormatter_getObjectValue_forString_errorDescription___block_invoke()
{
  NSLog((NSString *)CFSTR("NSDateComponentsFormatter does not implement parsing."));
}

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  objc_class *v5;
  IMP MethodImplementation;
  objc_class *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)NSDateComponentsFormatter;
    return -[NSFormatter _mayDecorateAttributedStringForObjectValue:](&v9, sel__mayDecorateAttributedStringForObjectValue_, a3);
  }
  else
  {
    v5 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v5, sel_attributedStringForObjectValue_withDefaultAttributes_);
    v7 = (objc_class *)objc_opt_class();
    return MethodImplementation != class_getMethodImplementation(v7, sel_attributedStringForObjectValue_withDefaultAttributes_);
  }
}

- (NSDateComponentsFormatter)initWithCoder:(id)a3
{
  NSDateComponentsFormatter *v5;
  NSDateComponentsFormatter *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSDateComponentsFormatter cannot be decoded by non-keyed archivers"), 0));
  }
  v8.receiver = self;
  v8.super_class = (Class)NSDateComponentsFormatter;
  v5 = -[NSFormatter initWithCoder:](&v8, sel_initWithCoder_, a3);
  v6 = v5;
  if (v5)
  {
    -[NSDateComponentsFormatter _NSDateComponentsFormatter_commonInit](v5, "_NSDateComponentsFormatter_commonInit");
    v6->_allowedUnits = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.allowedUnits"));
    v6->_allowsFractionalUnits = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.allowsFractionalUnits"));
    v6->_calendar = (NSCalendar *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NS.calendar")), "copy");
    v6->_collapsesLargestUnit = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.collapsesLargestUnit"));
    v6->_includesApproximationPhrase = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.includesApproximationPhrase"));
    v6->_includesTimeRemainingPhrase = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.includesTimeRemainingPhrase"));
    v6->_maximumUnitCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.maximumUnitCount"));
    v6->_unitsStyle = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.unitsStyle"));
    v6->_zeroFormattingBehavior = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NS.zeroFormattingBehavior"));
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t maximumUnitCount;
  unint64_t zeroFormattingBehavior;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSDateComponentsFormatter cannot be encoded by non-keyed archivers"), 0));
  os_unfair_lock_lock(&self->_lock);
  v7.receiver = self;
  v7.super_class = (Class)NSDateComponentsFormatter;
  -[NSFormatter encodeWithCoder:](&v7, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_allowedUnits, CFSTR("NS.allowedUnits"));
  if (self->_allowsFractionalUnits)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NS.allowsFractionalUnits"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_calendar, CFSTR("NS.calendar"));
  if (self->_collapsesLargestUnit)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NS.collapsesLargestUnit"));
  if (self->_includesApproximationPhrase)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NS.includesApproximationPhrase"));
  if (self->_includesTimeRemainingPhrase)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NS.includesTimeRemainingPhrase"));
  maximumUnitCount = self->_maximumUnitCount;
  if (maximumUnitCount)
    objc_msgSend(a3, "encodeInteger:forKey:", maximumUnitCount, CFSTR("NS.maximumUnitCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_unitsStyle, CFSTR("NS.unitsStyle"));
  zeroFormattingBehavior = self->_zeroFormattingBehavior;
  if (zeroFormattingBehavior != 1)
    objc_msgSend(a3, "encodeInt32:forKey:", zeroFormattingBehavior, CFSTR("NS.zeroFormattingBehavior"));
  os_unfair_lock_unlock(&self->_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v6, "setAllowedUnits:", self->_allowedUnits);
  objc_msgSend(v6, "setAllowsFractionalUnits:", self->_allowsFractionalUnits);
  objc_msgSend(v6, "setCalendar:", self->_calendar);
  objc_msgSend(v6, "setCollapsesLargestUnit:", self->_collapsesLargestUnit);
  objc_msgSend(v6, "setIncludesApproximationPhrase:", self->_includesApproximationPhrase);
  objc_msgSend(v6, "setIncludesTimeRemainingPhrase:", self->_includesTimeRemainingPhrase);
  objc_msgSend(v6, "setMaximumUnitCount:", self->_maximumUnitCount);
  objc_msgSend(v6, "setUnitsStyle:", self->_unitsStyle);
  objc_msgSend(v6, "setZeroFormattingBehavior:", self->_zeroFormattingBehavior);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)receiveObservedValue:(id)a3
{
  objc_super v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSObservationFormatterSupport.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!value || [value isKindOfClass:STATIC_CLASS_REF(NSDateComponents)]"));
    v6.receiver = self;
    v6.super_class = (Class)NSDateComponentsFormatter;
    -[NSDateComponentsFormatter receiveObservedValue:](&v6, sel_receiveObservedValue_, -[NSDateComponentsFormatter stringFromDateComponents:](self, "stringFromDateComponents:", a3));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NSDateComponentsFormatter;
    -[NSDateComponentsFormatter receiveObservedValue:](&v7, sel_receiveObservedValue_, 0);
  }
}

@end
