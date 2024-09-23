@implementation CalConferencePersistence

+ (id)_knownPersistenceFormats
{
  if (_knownPersistenceFormats_onceToken != -1)
    dispatch_once(&_knownPersistenceFormats_onceToken, &__block_literal_global_2);
  return (id)_knownPersistenceFormats_formats;
}

void __52__CalConferencePersistence__knownPersistenceFormats__block_invoke()
{
  CalAppleConferenceFormat *v0;
  CalGoogleConferenceFormat *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(CalAppleConferenceFormat);
  v4[0] = v0;
  v1 = objc_alloc_init(CalGoogleConferenceFormat);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_knownPersistenceFormats_formats;
  _knownPersistenceFormats_formats = v2;

}

+ (id)serializeConference:(id)a3 serializationBlockTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isWritable"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(a1, "_knownPersistenceFormats", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v12, "supportsSerializingConferenceWithSource:", objc_msgSend(v6, "source")) & 1) != 0)
          {
            objc_msgSend(v12, "serializeConference:serializationBlockTitle:", v6, v7);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
        }
        v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)deserializeConference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "_knownPersistenceFormats", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "deserializeConferences:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_htmlSerializedConference:(id)a3 serializationBlockTitle:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "serializeConference:serializationBlockTitle:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<pre>\n%@\n</pre>"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)updateHTML:(id)a3 withEventNotes:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSRange v36;
  NSRange v37;
  NSUInteger v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  NSUInteger range1;
  uint64_t v45;
  NSRange v46;

  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    objc_msgSend((id)v6, "CDVStringByXMLUnquoting");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "deserializeConference:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "deserializeConference:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "conference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && !objc_msgSend(v10, "isWritable") || v12 && (objc_msgSend(v12, "isWritable") & 1) == 0)
    {
      v16 = v8;
    }
    else
    {
      v13 = (void *)objc_msgSend(v8, "mutableCopy");
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v15;

      if (v10 && v12)
      {
        if ((objc_msgSend(v10, "isEqual:", v12) & 1) == 0)
        {
          v17 = objc_msgSend(v9, "range");
          objc_msgSend((id)v7, "substringWithRange:", v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "stringByAppendingString:", CFSTR("\n"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_msgSend(v11, "range");
          objc_msgSend(v16, "replaceCharactersInRange:withString:", v23, v24, v22);
LABEL_29:

        }
      }
      else
      {
        if (v10 && !v12)
        {
          objc_msgSend(v9, "blockTitle");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_htmlSerializedConference:serializationBlockTitle:", v10, v25);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = objc_msgSend(v16, "rangeOfString:options:", CFSTR("</body>"), 1);
          if (v26 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v27 = objc_msgSend(v16, "rangeOfString:options:", CFSTR("<body>"), 1);
            if (v27 == 0x7FFFFFFFFFFFFFFFLL)
              v26 = objc_msgSend(v16, "length");
            else
              v26 = v27 + v28;
          }
          objc_msgSend(v16, "insertString:atIndex:", v22, v26);
          goto LABEL_29;
        }
        if (!v12 || v10)
          goto LABEL_30;
        v29 = objc_msgSend(v11, "range");
        v31 = v30;
        v32 = objc_msgSend(v16, "rangeOfString:options:range:", CFSTR("<pre>"), 5, 0, v29);
        range1 = v33;
        v45 = v31;
        v34 = objc_msgSend(v16, "rangeOfString:options:range:", CFSTR("</pre>"), 1, v29 + v31, objc_msgSend(v16, "length") - (v29 + v31));
        if (v32 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v36.location = v34;
          if (v34 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v36.length = v35;
            v46.location = v32;
            v46.length = range1;
            v37 = NSUnionRange(v46, v36);
            v38 = v37.location + objc_msgSend(CFSTR("<pre>"), "length");
            objc_msgSend(v16, "substringWithRange:", v38, v37.length - (objc_msgSend(CFSTR("<pre>"), "length") + objc_msgSend(CFSTR("</pre>"), "length")));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "stringByReplacingCharactersInRange:withString:", v29 - v38, v45, &stru_1E2A86598);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "stringByTrimmingCharactersInSet:", v41);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v43, "length"))
            {
              objc_msgSend(v16, "replaceCharactersInRange:withString:", v37.location, v37.length, &stru_1E2A86598);

              goto LABEL_30;
            }

          }
        }
        objc_msgSend(v16, "replaceCharactersInRange:withString:", v29, v45, &stru_1E2A86598);
      }
    }
LABEL_30:

    goto LABEL_31;
  }
  v16 = 0;
LABEL_31:

  return v16;
}

@end
