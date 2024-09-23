@implementation SGSimpleMailMessage

+ (id)simpleMailMessageFromHeaders:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
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
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v67;
  void *v68;
  id obj;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v67 = a1;
  v75 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[SGSimpleMailMessage initForBuilding]([SGSimpleMailMessage alloc], "initForBuilding");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (!v6)
    goto LABEL_50;
  v7 = v6;
  v8 = *(_QWORD *)v71;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v71 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
      v11 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v10, "key");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

      objc_msgSend(v4, "messageId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {

      }
      else
      {
        objc_msgSend(v10, "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("message-id"));

        if (!v15)
        {
          objc_msgSend(v10, "value");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_msgSend(v35, "copy");
          objc_msgSend(v4, "setMessageId:", v36);
          goto LABEL_46;
        }
      }
      objc_msgSend(v4, "subject", v67);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {

      }
      else
      {
        objc_msgSend(v10, "key");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "caseInsensitiveCompare:", CFSTR("subject"));

        if (!v18)
        {
          objc_msgSend(v10, "value");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setSubject:", v35);
          goto LABEL_47;
        }
      }
      objc_msgSend(v4, "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {

      }
      else
      {
        objc_msgSend(v10, "key");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("date"));

        if (!v21)
        {
          objc_msgSend(v10, "value");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "dateFromEmailString:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setDate:", v36);
          goto LABEL_46;
        }
      }
      objc_msgSend(v4, "from");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {

      }
      else
      {
        objc_msgSend(v10, "key");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("from"));

        if (!v24)
        {
          v47 = (void *)MEMORY[0x1E0D19938];
          objc_msgSend(v10, "value");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "namedEmailAddressWithFieldValue:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setFrom:", v36);
          goto LABEL_46;
        }
      }
      objc_msgSend(v4, "replyTo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {

      }
      else
      {
        objc_msgSend(v10, "key");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("reply-to"));

        if (!v27)
        {
          v48 = (void *)MEMORY[0x1E0D19938];
          objc_msgSend(v10, "value");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addressItemsFromEmailString:", v35);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "firstObject");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "namedEmailAddressWithFieldValue:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setReplyTo:", v51);

          goto LABEL_47;
        }
      }
      objc_msgSend(v4, "to");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {

      }
      else
      {
        objc_msgSend(v10, "key");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "caseInsensitiveCompare:", CFSTR("to"));

        if (!v30)
        {
          v52 = (void *)MEMORY[0x1E0D19938];
          objc_msgSend(v10, "value");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addressItemsFromEmailString:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "namedEmailAddressesWithFieldValues:", v36);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setTo:", v53);
          goto LABEL_45;
        }
      }
      objc_msgSend(v4, "mailConversationIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {

      }
      else
      {
        objc_msgSend(v10, "key");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "caseInsensitiveCompare:", CFSTR("conversation-id"));

        if (!v33)
        {
          objc_msgSend(v10, "value");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setMailConversationIdentifier:", v35);
          goto LABEL_47;
        }
      }
      objc_msgSend(v4, "cc");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {

      }
      else
      {
        objc_msgSend(v10, "key");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "caseInsensitiveCompare:", CFSTR("cc"));

        if (!v38)
        {
          v54 = (void *)MEMORY[0x1E0D19938];
          objc_msgSend(v10, "value");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addressItemsFromEmailString:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "namedEmailAddressesWithFieldValues:", v36);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setCc:", v53);
          goto LABEL_45;
        }
      }
      objc_msgSend(v4, "bcc");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {

        goto LABEL_35;
      }
      objc_msgSend(v10, "key");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "caseInsensitiveCompare:", CFSTR("bcc"));

      if (!v41)
      {
        v55 = (void *)MEMORY[0x1E0D19938];
        objc_msgSend(v10, "value");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addressItemsFromEmailString:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "namedEmailAddressesWithFieldValues:", v36);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setBcc:", v53);
LABEL_45:

LABEL_46:
        goto LABEL_47;
      }
LABEL_35:
      objc_msgSend(v4, "mailingList");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
        objc_msgSend(v10, "key");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("list-id"));

        if (v43)
          goto LABEL_48;
        v44 = (void *)MEMORY[0x1E0D19938];
        objc_msgSend(v10, "value");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addressItemsFromEmailString:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "firstObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "namedEmailAddressWithFieldValue:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setMailingList:", v46);

        goto LABEL_46;
      }
LABEL_47:

LABEL_48:
      objc_autoreleasePoolPop(v11);
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  }
  while (v7);
LABEL_50:

  objc_msgSend(v4, "to");
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)v56;
  v58 = MEMORY[0x1E0C9AA60];
  if (v56)
    v59 = v56;
  else
    v59 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "setTo:", v59, v67);

  objc_msgSend(v4, "cc");
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v60;
  if (v60)
    v62 = v60;
  else
    v62 = v58;
  objc_msgSend(v4, "setCc:", v62);

  objc_msgSend(v4, "bcc");
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v63;
  if (v63)
    v65 = v63;
  else
    v65 = v58;
  objc_msgSend(v4, "setBcc:", v65);

  objc_msgSend(v4, "setHasInhumanHeaders:", objc_msgSend(v68, "headersContainInhumanOnes:keys:", obj, v5));
  objc_msgSend(v4, "setHeaders:", obj);

  return v4;
}

+ (id)addressItemsFromEmailString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(a1, "decodeEncodedWordsIn:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_7566);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v8;
}

+ (id)dateFromEmailString:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (dateFromEmailString___pasOnceToken4 != -1)
    dispatch_once(&dateFromEmailString___pasOnceToken4, &__block_literal_global_26);
  v4 = (id)dateFromEmailString___pasExprOnceResult;
  if (dateFromEmailString___pasOnceToken5 != -1)
    dispatch_once(&dateFromEmailString___pasOnceToken5, &__block_literal_global_93);
  v5 = (id)dateFromEmailString___pasExprOnceResult_92;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v8 = 0;
  if (v7)
  {
    v9 = *(_QWORD *)v20;
    while (2)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
        v13 = (void *)MEMORY[0x1C3BD4F6C]();
        v18 = 0;
        v14 = objc_msgSend(v12, "getObjectValue:forString:range:error:", &v18, v3, 0, 0);
        v8 = v18;

        if (v14)
        {
          objc_msgSend(v5, "components:fromDate:", 4, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "year");

          if (v16 > 1899)
          {
            v8 = v8;
            objc_autoreleasePoolPop(v13);
            v7 = v8;
            goto LABEL_16;
          }
        }
        objc_autoreleasePoolPop(v13);
        v10 = (char *)v10 + 1;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_16:

  return v7;
}

+ (id)decodeQuotedPrintable:(id)a3 charset:(unint64_t)a4 rfc2047UnderscoreAsSpace:(BOOL)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  BOOL v22;
  _QWORD v23[4];
  _QWORD block[6];

  v8 = a3;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__SGSimpleMailMessage_RFC822Parsing__decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___pasOnceToken6 != -1)
    dispatch_once(&decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___pasOnceToken6, block);
  v10 = (id)decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___pasExprOnceResult;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(v8, "length"));
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v12 = objc_msgSend(v8, "length");
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __93__SGSimpleMailMessage_RFC822Parsing__decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___block_invoke_2;
  v18[3] = &unk_1E7DAA770;
  v21 = v23;
  v13 = v8;
  v19 = v13;
  v22 = a5;
  v14 = v11;
  v20 = v14;
  objc_msgSend(v10, "enumerateMatchesInString:options:range:usingBlock:", v13, 0, 0, v12, v18);
  v15 = v20;
  v16 = v14;

  _Block_object_dispose(v23, 8);
  return v16;
}

+ (id)decodeEncodedWordsIn:(id)a3
{
  return (id)objc_msgSend(a3, "sg_stringWithDecodedEncodedWords");
}

+ (id)parseHeaders:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  SEL v22;
  id v23;
  _QWORD block[6];

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SGSimpleMailMessage_RFC822Parsing__parseHeaders___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (parseHeaders___pasOnceToken9 != -1)
    dispatch_once(&parseHeaders___pasOnceToken9, block);
  v7 = (id)parseHeaders___pasExprOnceResult;
  v8 = objc_msgSend(a1, "rangeOfBodyFromRfc822:", v5);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v5;
  }
  else
  {
    objc_msgSend(v5, "subdataWithRange:", 0, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v9, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  v13 = objc_msgSend(v11, "length");
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __51__SGSimpleMailMessage_RFC822Parsing__parseHeaders___block_invoke_2;
  v19[3] = &unk_1E7DAA798;
  v20 = v11;
  v22 = a2;
  v23 = a1;
  v14 = v12;
  v21 = v14;
  v15 = v11;
  objc_msgSend(v7, "enumerateMatchesInString:options:range:usingBlock:", v15, 0, 0, v13, v19);
  v16 = v21;
  v17 = v14;

  return v17;
}

+ (id)parseRfc822Headers:(id)a3 htmlContent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(a1, "parseHeaders:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGSimpleMailMessage simpleMailMessageFromHeaders:](SGSimpleMailMessage, "simpleMailMessageFromHeaders:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v10, "setHtmlBody:", v11);

  objc_autoreleasePoolPop(v8);
  return v10;
}

+ (id)parseRfc822Headers:(id)a3 htmlContent:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(a1, "parseRfc822Headers:htmlContent:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSource:", v10);
  objc_autoreleasePoolPop(v11);

  return v12;
}

+ (_NSRange)rangeOfBodyFromRfc822:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  _NSRange result;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "bytes");
  if (v4)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = *(unsigned __int8 *)(v6 + v7);
      v11 = v8 | (v10 != 13);
      if ((v11 & 1) != 0)
      {
        if (v10 == 10)
        {
          if (v9 == 1)
          {
            v15 = v7 + 1;
            v12 = v4 - v15;
            v4 = v15;
            goto LABEL_10;
          }
          v9 = 1;
        }
        else
        {
          v9 = 0;
        }
      }
      v8 = v11 ^ 1;
      ++v7;
    }
    while (v4 != v7);
  }
  v12 = 0;
LABEL_10:

  v13 = v4;
  v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

+ (_NSRange)rangeOfHeadersFromRfc822:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = objc_msgSend(a1, "rangeOfBodyFromRfc822:", a3);
  v4 = 0;
  result.length = v3;
  result.location = v4;
  return result;
}

+ (id)uudecode:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v7;
  uint64_t data;
  _OWORD v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  archive_read_new();
  archive_read_support_filter_uu();
  archive_read_support_format_raw();
  archive_read_append_filter();
  v4 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "bytes");
  objc_msgSend(v4, "length");
  if (archive_read_open_memory() || archive_read_next_header())
  {
    v5 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", (unint64_t)(3 * objc_msgSend(v4, "length")) >> 2);
    memset(v9, 0, sizeof(v9));
    while (1)
    {
      data = archive_read_data();
      if (data < 0)
        break;
      objc_msgSend(v7, "appendBytes:length:", v9, data);
      if (!data)
      {
        v5 = v7;
        goto LABEL_10;
      }
    }
    v5 = 0;
LABEL_10:

  }
  archive_read_free();

  return v5;
}

+ (id)stripTrailingASCIIHSpace:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  void *v19;
  _QWORD v20[4];

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(v3, "length");
  objc_msgSend(v5, "addIndexesInRange:", 0, v6);
  while (1)
  {
    do
    {
      if (stripTrailingASCIIHSpace___pasOnceToken16 != -1)
        dispatch_once(&stripTrailingASCIIHSpace___pasOnceToken16, &__block_literal_global_131);
      v7 = objc_msgSend(v3, "rangeOfData:options:range:", stripTrailingASCIIHSpace___pasExprOnceResult, 1, 0, v6);
      v6 = v7;
    }
    while (!v7);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    do
    {
      v8 = *(unsigned __int8 *)(v4 - 1 + v6);
      if (v8 != 32 && v8 != 9)
        break;
      objc_msgSend(v5, "removeIndex:", --v6);
    }
    while (v6);
  }
  v10 = objc_msgSend(v5, "count");
  if (v10 == objc_msgSend(v3, "length"))
  {
    v11 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v12 = malloc_type_malloc(objc_msgSend(v5, "count"), 0xDC62C61FuLL);
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v15);
    }
    v13 = v12;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__SGSimpleMailMessage_RFC822Parsing__stripTrailingASCIIHSpace___block_invoke_2;
    v16[3] = &unk_1E7DAA7E0;
    v18 = v20;
    v19 = v12;
    v17 = v3;
    objc_msgSend(v5, "enumerateRangesUsingBlock:", v16);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v13, objc_msgSend(v5, "count"), 1);

    _Block_object_dispose(v20, 8);
  }

  return v11;
}

+ (id)formatFlowed:(id)a3 delSp:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  BOOL v18;
  _QWORD v19[4];
  _QWORD v20[3];
  char v21;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", objc_msgSend(v5, "length"));
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __57__SGSimpleMailMessage_RFC822Parsing__formatFlowed_delSp___block_invoke;
  v14 = &unk_1E7DAA808;
  v16 = v20;
  v7 = v6;
  v15 = v7;
  v17 = v19;
  v18 = a4;
  objc_msgSend(v5, "enumerateLinesUsingBlock:", &v11);
  if (objc_msgSend(v5, "isEqual:", v7, v11, v12, v13, v14))
    v8 = v5;
  else
    v8 = v7;
  v9 = v8;

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);

  return v9;
}

+ (id)parseParameterizedHeaderValue:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  _QWORD block[6];

  v5 = a3;
  v6 = objc_msgSend(v5, "rangeOfString:options:", CFSTR(";"), 2);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)MEMORY[0x1E0D81638];
    v8 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v7, "tupleWithFirst:second:", v8, MEMORY[0x1E0C9AA70]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v6;
    v11 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v5, "substringToIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    v14 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__SGSimpleMailMessage_RFC822Parsing__parseParameterizedHeaderValue___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a2;
    block[5] = a1;
    if (parseParameterizedHeaderValue___pasOnceToken19 != -1)
      dispatch_once(&parseParameterizedHeaderValue___pasOnceToken19, block);
    v15 = (id)parseParameterizedHeaderValue___pasExprOnceResult;
    v16 = objc_msgSend(v5, "length") - v10;
    v19 = v14;
    v20 = 3221225472;
    v21 = __68__SGSimpleMailMessage_RFC822Parsing__parseParameterizedHeaderValue___block_invoke_2;
    v22 = &unk_1E7DAA830;
    v23 = v5;
    v24 = v13;
    v17 = v13;
    objc_msgSend(v15, "enumerateMatchesInString:options:range:usingBlock:", v23, 0, v10, v16, &v19);
    objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v12, v17, v19, v20, v21, v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v11);
  }

  return v9;
}

+ (id)htmlFromPlainTextBody:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  __CFString *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", v4);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__SGSimpleMailMessage_RFC822Parsing__htmlFromPlainTextBody___block_invoke;
    v12[3] = &unk_1E7DAA858;
    v14 = &v16;
    v7 = v6;
    v13 = v7;
    v15 = v5;
    objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 0, v12);
    if (v17[3])
    {
      v8 = 0;
      do
      {
        objc_msgSend(v7, "appendString:", CFSTR("</blockquote>"));
        ++v8;
      }
      while (v8 < v17[3]);
    }
    if (objc_msgSend(v7, "isEqual:", v3))
      v9 = v3;
    else
      v9 = v7;
    v10 = (__CFString *)objc_msgSend(v9, "copy");

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v10 = &stru_1E7DB83A8;
  }

  return v10;
}

+ (id)htmlBodyFromRfc822:(id)a3 headers:(id)a4 attachmentCallback:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  CFStringEncoding v37;
  unint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSUInteger v61;
  NSUInteger v62;
  NSUInteger v63;
  void *v64;
  void *v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  NSUInteger v69;
  NSUInteger location;
  BOOL v72;
  uint64_t v73;
  NSUInteger v74;
  NSUInteger v75;
  NSRange v76;
  uint64_t v77;
  NSUInteger length;
  NSUInteger v79;
  NSUInteger v80;
  char v81;
  NSUInteger v82;
  char v83;
  int v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  void *v92;
  void *v93;
  NSUInteger v94;
  void *v95;
  void *v96;
  void *v97;
  void *v99;
  int v100;
  int v101;
  void *v102;
  __CFString *v103;
  __CFString *v104;
  void *v105;
  void *v106;
  void *v107;
  __CFString *theString;
  BOOL v109;
  id v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  _BOOL4 v115;
  void *v116;
  int v117;
  void *v118;
  void (**v119)(id, void *, void *, void *);
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v125;
  uint64_t v126;
  void *v127;
  id v128;
  id v129;
  char v130;
  uint8_t buf[4];
  uint64_t v132;
  __int16 v133;
  unint64_t v134;
  void *v135;
  uint64_t v136;
  _QWORD v137[3];
  NSRange v138;
  NSRange v139;

  v137[1] = *MEMORY[0x1E0C80C00];
  v110 = a3;
  v8 = a4;
  v119 = (void (**)(id, void *, void *, void *))a5;
  v113 = v8;
  objc_msgSend(v8, "hv_firstHeaderForKey:", CFSTR("content-type"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("text/plain");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  v104 = v12;
  objc_msgSend(a1, "parseParameterizedHeaderValue:", v12);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v121, "first");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v13);
  objc_msgSend(v121, "second");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("charset"));
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = CFSTR("us-ascii");
  -[__CFString lowercaseString](v16, "lowercaseString");
  theString = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v15);
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("boundary"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_8;
  v19 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("boundary"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("\n--"), "stringByAppendingString:", v20);
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v19);
  if (v111)
  {
    v21 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v111, "stringByAppendingString:", CFSTR("--"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v21);
    v22 = 1;
  }
  else
  {
LABEL_8:
    v107 = 0;
    v111 = 0;
    v22 = 0;
  }
  objc_msgSend(v113, "hv_firstHeaderForKey:", CFSTR("content-disposition"));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = CFSTR("inline");
  if (v23)
    v25 = (__CFString *)v23;
  v26 = v25;

  v103 = v26;
  objc_msgSend(a1, "parseParameterizedHeaderValue:", v26);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v120, "first");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "lowercaseString");
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v27);
  objc_msgSend(v120, "second");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v122, "isEqual:", CFSTR("attachment")) & 1) != 0
    || (v22 & objc_msgSend(v114, "hasPrefix:", CFSTR("multipart/"))) != 1)
  {
    if ((objc_msgSend(v114, "isEqual:", CFSTR("text/html")) & 1) == 0
      && (objc_msgSend(v114, "isEqual:", CFSTR("text/plain")) & 1) == 0
      && !objc_msgSend(v122, "isEqual:", CFSTR("attachment")))
    {
      v32 = 0;
      goto LABEL_126;
    }
    v30 = (void *)MEMORY[0x1C3BD4F6C]();
    v31 = objc_msgSend(v122, "isEqual:", CFSTR("attachment"));
    if (!v119 && (v31 & 1) != 0)
    {
      v32 = 0;
LABEL_125:
      objc_autoreleasePoolPop(v30);
      goto LABEL_126;
    }
    v125 = v30;
    v33 = objc_msgSend(a1, "rangeOfBodyFromRfc822:", v110);
    v35 = v34;
    v36 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v110, "subdataWithRange:", v33, v35);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v36);
    v37 = CFStringConvertIANACharSetNameToEncoding(theString);
    if (v37 == -1)
      v37 = 1536;
    v38 = CFStringConvertEncodingToNSStringEncoding(v37);
    if (objc_msgSend(v114, "isEqual:", CFSTR("text/plain"))
      && (objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("format")),
          (v39 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      && (objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("format")),
          v40 = (void *)objc_claimAutoreleasedReturnValue(),
          v41 = objc_msgSend(v40, "caseInsensitiveCompare:", CFSTR("flowed")),
          v40,
          v39,
          !v41))
    {
      objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("delsp"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (v96)
      {
        objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("delsp"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = objc_msgSend(v97, "caseInsensitiveCompare:", CFSTR("yes")) == 0;

      }
      else
      {
        v115 = 0;
      }

      v117 = 1;
    }
    else
    {
      v117 = 0;
      v115 = 0;
    }
    v42 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v113, "hv_firstHeaderForKey:", CFSTR("content-transfer-encoding"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "lowercaseString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v42);
    if (objc_msgSend(v44, "isEqual:", CFSTR("binary")))
    {
LABEL_28:
      v45 = v127;
      goto LABEL_36;
    }
    if (objc_msgSend(v44, "isEqual:", CFSTR("base64")))
    {
      v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedData:options:", v127, 1);
    }
    else if (objc_msgSend(v44, "isEqual:", CFSTR("x-uuencode")))
    {
      objc_msgSend(a1, "uudecode:", v127);
      v45 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v44, "isEqual:", CFSTR("quoted-printable")))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v127, 1, 0);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "decodeQuotedPrintable:charset:rfc2047UnderscoreAsSpace:", v95, v38, 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v46)
          goto LABEL_41;
LABEL_37:
        v47 = objc_msgSend(v122, "isEqual:", CFSTR("attachment"));
        v48 = (void *)MEMORY[0x1C3BD4F6C]();
        if (!v47)
        {
          v130 = 0;
          v50 = (void *)MEMORY[0x1C3BD4F6C]();
          v51 = (void *)MEMORY[0x1E0CB3940];
          v136 = *MEMORY[0x1E0CB31E0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v38);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = v52;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v135, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v137[0] = v53;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, &v136, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v129 = 0;
          v55 = objc_msgSend(v51, "stringEncodingForData:encodingOptions:convertedString:usedLossyConversion:", v46, v54, &v129, &v130);
          v56 = v129;

          objc_autoreleasePoolPop(v50);
          if (v55)
          {
            if (v130)
            {
              sgLogHandle();
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                v132 = v55;
                v133 = 2048;
                v134 = v38;
                _os_log_impl(&dword_1C3607000, v57, OS_LOG_TYPE_DEFAULT, "Lossy conversion. Detected charset: %ld (expected: %ld)", buf, 0x16u);
              }

            }
            if (objc_msgSend(v114, "isEqual:", CFSTR("text/plain")))
            {
              if (v117)
              {
                objc_msgSend(a1, "formatFlowed:delSp:", v56, v115);
                v58 = objc_claimAutoreleasedReturnValue();

                v56 = (id)v58;
              }
              objc_msgSend(a1, "htmlFromPlainTextBody:", v56);
              v59 = objc_claimAutoreleasedReturnValue();

              v56 = (id)v59;
            }
            v56 = v56;
            v32 = v56;
          }
          else
          {
            v32 = 0;
          }

          objc_autoreleasePoolPop(v48);
          goto LABEL_124;
        }
        if (!v119)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGSimpleMailMessage+RFC822Parsing.m"), 739, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attachmentCallback"));

        }
        objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("filename"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v119[2](v119, v46, v49, v114);

        objc_autoreleasePoolPop(v48);
LABEL_41:
        v32 = 0;
LABEL_124:

        v30 = v125;
        goto LABEL_125;
      }
      if (v117)
        goto LABEL_28;
      objc_msgSend(a1, "stripTrailingASCIIHSpace:", v127);
      v45 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_36:
    v46 = v45;
    if (!v45)
      goto LABEL_41;
    goto LABEL_37;
  }
  v100 = objc_msgSend(v114, "isEqual:", CFSTR("multipart/alternative"));
  if ((v100 & 1) != 0)
  {
    v29 = 0;
LABEL_53:
    v116 = 0;
    goto LABEL_54;
  }
  if (!objc_msgSend(v114, "isEqual:", CFSTR("multipart/related")))
  {
    v29 = objc_msgSend(v114, "isEqual:", CFSTR("multipart/signed"));
    goto LABEL_53;
  }
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("start"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v116 == 0;
LABEL_54:
  v60 = objc_msgSend(a1, "rangeOfBodyFromRfc822:", v110);
  if (v60)
    v62 = v61 + 1;
  else
    v62 = v61;
  if (v60)
    v63 = v60 - 1;
  else
    v63 = 0;
  v64 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v111, "dataUsingEncoding:", 1);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v64);
  v65 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v107, "dataUsingEncoding:", 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v65);
  v102 = (void *)objc_opt_new();
  v128 = objc_retainAutorelease(v110);
  v66 = objc_msgSend(v128, "bytes");
  v112 = 0;
  if (v29)
    v67 = 5;
  else
    v67 = 0;
  v101 = v67;
  v126 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v68 = objc_msgSend(v128, "rangeOfData:options:range:", v118, 0, v63, v62);
    if (v68 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!v62)
        break;
      location = v63 + v62 - 1;
      if (*(_BYTE *)(v66 + v63) == 10 || *(_BYTE *)(v66 + location) != 10)
        break;
      v72 = 1;
      v73 = 1;
      goto LABEL_94;
    }
    v74 = v68;
    v75 = v69;
    v139.length = v69 + 2;
    v138.location = v63;
    v138.length = v62;
    v139.location = v74;
    v76 = NSIntersectionRange(v138, v139);
    v77 = objc_msgSend(v128, "rangeOfData:options:range:", v105, 2, v76.location, v76.length);
    v72 = v77 != 0x7FFFFFFFFFFFFFFFLL;
    if (v77 == 0x7FFFFFFFFFFFFFFFLL)
      location = v74;
    else
      location = v76.location;
    if (v77 == 0x7FFFFFFFFFFFFFFFLL)
      length = v75;
    else
      length = v76.length;
    v79 = v63 + v62;
    v80 = length + location;
    if (length + location >= v63 + v62)
    {
      v73 = length;
LABEL_91:
      if (location && *(_BYTE *)(v66 + location - 1) == 13)
      {
        --location;
        ++v73;
      }
LABEL_94:
      if (v126 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v109 = v72;
        v86 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v128, "subdataWithRange:", v126 + v112, location - (v126 + v112));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "parseHeaders:", v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v88;
        if (v116)
        {
          objc_msgSend(v88, "hv_firstHeaderForKey:", CFSTR("content-id"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v116, "isEqual:", v90);

          if (!v91)
            goto LABEL_103;
        }
        v92 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(a1, "htmlBodyFromRfc822:headers:attachmentCallback:", v87, v89, v119);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        if (v93)
        {
          if (v100)
            objc_msgSend(v102, "removeAllObjects");
          objc_msgSend(v102, "addObject:", v93);
        }

        objc_autoreleasePoolPop(v92);
        if (v116)
          v85 = 5;
        else
LABEL_103:
          v85 = v101;

        objc_autoreleasePoolPop(v86);
        v72 = v109;
        if (v85)
        {
          length = v73;
          goto LABEL_112;
        }
      }
      if (!v72)
      {
        v85 = 0;
        v112 = v73;
        length = v73;
        v126 = location;
        goto LABEL_112;
      }
      break;
    }
    v81 = 0;
    v73 = v79 - location;
    v82 = length;
    while (2)
    {
      v83 = v81;
      while (1)
      {
        v84 = *(unsigned __int8 *)(v66 + v80);
        ++v82;
        if (v84 == 10 || (v83 & 1) != 0)
        {
          v73 = v82;
          if (v84 == 10)
            goto LABEL_91;
LABEL_111:
          v85 = 4;
          goto LABEL_112;
        }
        if (v84 != 9 && v84 != 32)
          break;
        v83 = 0;
        v80 = v82 + location;
        if (v82 + location >= v79)
        {
          if ((v81 & 1) == 0)
            goto LABEL_91;
          goto LABEL_111;
        }
      }
      if (v84 != 13)
        goto LABEL_111;
      v80 = v82 + location;
      v85 = 4;
      v81 = 1;
      if (v82 + location < v79)
        continue;
      break;
    }
LABEL_112:
    v94 = v63 + v62;
    v63 = length + location;
    v62 = v94 - (length + location);
  }
  while (v85 != 5);
  if (objc_msgSend(v102, "count"))
  {
    objc_msgSend(v102, "_pas_proxyComponentsJoinedByString:", &stru_1E7DB83A8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }

LABEL_126:
  return v32;
}

+ (id)parseRfc822:(id)a3
{
  return (id)objc_msgSend(a1, "parseRfc822:attachmentCallback:", a3, 0);
}

+ (id)parseRfc822:(id)a3 attachmentCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  NSRange v15;
  uint64_t v16;
  void *v17;
  NSRange v19;
  NSRange v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "parseHeaders:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "htmlBodyFromRfc822:headers:attachmentCallback:", v6, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rangeOfString:options:", CFSTR("\r"), 2);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v10;
    v13 = v11;
    v14 = (void *)MEMORY[0x1C3BD4F6C]();
    v20.location = objc_msgSend(v9, "length");
    v19.location = v12;
    v19.length = v13;
    v20.length = 0;
    v15 = NSUnionRange(v19, v20);
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\r"), &stru_1E7DB83A8, 2, v15.location, v15.length);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v14);
    v9 = (void *)v16;
  }
  +[SGSimpleMailMessage simpleMailMessageFromHeaders:](SGSimpleMailMessage, "simpleMailMessageFromHeaders:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHtmlBody:", v9);

  return v17;
}

+ (BOOL)enumerateRfc822InNeXTMbox:(id)a3 tableOfContents:(id)a4 withBlock:(id)a5
{
  BOOL v5;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  char v12;
  signed int v13;
  char v14;
  signed int v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  signed int v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  id v31;
  unint64_t v32;
  id v33;
  void *v34;
  unint64_t v35;
  id v36;
  unsigned __int8 v37;
  unsigned int v38;
  signed int v39;
  signed int v40;
  signed int v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "length");
  v36 = v8;
  v35 = objc_msgSend(v8, "length");
  if (v11 >= 0x20)
  {
    v41 = 0;
    objc_msgSend(v9, "getBytes:range:", &v41, 4, 4);
    v13 = v41;
    v41 = bswap32(v41);
    if (v13)
    {
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "\n", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41 >= 1)
      {
        v15 = 0;
        v16 = 32;
        v31 = v9;
        v32 = v11;
        v33 = v10;
        while (1)
        {
          v17 = (void *)MEMORY[0x1C3BD4F6C]();
          if (v16 + 4 > v11)
            break;
          v40 = 0;
          objc_msgSend(v9, "getBytes:range:", &v40, v16, 4);
          v40 = bswap32(v40);
          v18 = v16 + 4 + v40;
          if (v18 > v11)
            break;
          v39 = 0;
          objc_msgSend(v9, "getBytes:range:", &v39, v16 + 4, 4);
          v38 = 0;
          v39 = bswap32(v39);
          objc_msgSend(v9, "getBytes:range:", &v38, v16 + 8, 4);
          v19 = v39;
          v20 = bswap32(v38);
          v38 = v20;
          v21 = v39 + (uint64_t)v20;
          v5 = v21 <= v35;
          if (v21 > v35)
            goto LABEL_19;
          v22 = v20;
          v23 = objc_msgSend(v36, "rangeOfData:options:range:", v34, 0, v39, v20);
          if (v23 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v25 = v23;
            v26 = v24;
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", objc_msgSend(objc_retainAutorelease(v36), "bytes") + v19, v23 - v19, 1);
            if (objc_msgSend(v27, "rangeOfString:options:", CFSTR("From "), 11) != 0x7FFFFFFFFFFFFFFFLL)
            {
              v19 = v25 + v26;
              v22 = v21 - (v25 + v26);
            }

            v9 = v31;
          }
          objc_msgSend(v36, "subdataWithRange:", v19, v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0;
          v10 = v33;
          (*((void (**)(id, void *, unsigned __int8 *))v33 + 2))(v33, v28, &v37);
          v29 = v37;

          if (v29)
            goto LABEL_19;
          objc_autoreleasePoolPop(v17);
          ++v15;
          v16 = v18;
          v11 = v32;
          if (v15 >= v41)
          {
            v14 = 1;
            goto LABEL_20;
          }
        }
        v5 = 0;
LABEL_19:
        objc_autoreleasePoolPop(v17);
        v14 = 0;
      }
LABEL_20:
      v12 = v14 | v5;

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12 & 1;
}

void __60__SGSimpleMailMessage_RFC822Parsing__htmlFromPlainTextBody___block_invoke(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  id v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a2;
  v17 = v7;
  if (!a4)
  {
LABEL_10:
    v8 = 0;
    v10 = a1 + 40;
LABEL_11:
    v11 = *(_QWORD *)(*(_QWORD *)v10 + 8);
    v12 = *(_QWORD *)(v11 + 24);
    goto LABEL_12;
  }
  v8 = 0;
  while (1)
  {
    v9 = objc_msgSend(v7, "characterAtIndex:", v8);
    if (v9 != 62)
      break;
    ++v8;
    v7 = v17;
    if (a4 == v8)
    {
      v8 = a4;
      goto LABEL_7;
    }
  }
  if (v9 != 32)
    goto LABEL_10;
LABEL_7:
  v10 = a1 + 40;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(_QWORD *)(v11 + 24);
  if (v12 < v8)
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("<blockquote type=cite>"));
      ++v12;
    }
    while (v8 != v12);
    goto LABEL_11;
  }
LABEL_12:
  if (v8 < v12)
  {
    v13 = v8;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("</blockquote>"));
      ++v13;
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    while (v13 < *(_QWORD *)(v11 + 24));
  }
  *(_QWORD *)(v11 + 24) = v8;
  if (v8 < a4)
  {
    if (v8)
    {
      objc_msgSend(v17, "substringFromIndex:", v8 + 1);
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v14;
    }
    else
    {
      v15 = v17;
    }
    v17 = v15;
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
      2,
      0,
      objc_msgSend(v16, "length"));
    objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
      2,
      0,
      objc_msgSend(v16, "length"));
    objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", CFSTR("  "), CFSTR(" &nbsp;"),
      2,
      0,
      objc_msgSend(v16, "length"));
    objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\t"), CFSTR("<span class=Apple-tab-span style=white-space:pre>\t</span>"), 2, 0, objc_msgSend(v16, "length"));
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v16);

  }
  if (a3 + a4 != *(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("<br>\n"));

}

void __68__SGSimpleMailMessage_RFC822Parsing__parseParameterizedHeaderValue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[ \\t]*;[ \\t]*([^ \\t()<>@,;:\\\\\"\\/\\[\\]?.=]+)=(?:([^ \\t()<>@,;:\\\\\"\\/\\[\\]?.=]+)|\"((?:[^\"]|\\\\\")*)\")[ \\t]*(?:(?=;)|$)"),
    0,
    &v7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGSimpleMailMessage+RFC822Parsing.m"), 427, CFSTR("error creating parameterRegex: %@"), v4);

  }
  v5 = (void *)parseParameterizedHeaderValue___pasExprOnceResult;
  parseParameterizedHeaderValue___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

void __68__SGSimpleMailMessage_RFC822Parsing__parseParameterizedHeaderValue___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v16, "rangeAtIndex:", 1);
  objc_msgSend(v3, "substringWithRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "rangeAtIndex:", 2) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v16, "rangeAtIndex:", 3) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      v12 = *(void **)(a1 + 32);
      v13 = objc_msgSend(v16, "rangeAtIndex:", 3);
      objc_msgSend(v12, "substringWithRange:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\\"), CFSTR("\"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v10 = objc_msgSend(v16, "rangeAtIndex:", 2);
    objc_msgSend(v9, "substringWithRange:", v10, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v7);

}

void __57__SGSimpleMailMessage_RFC822Parsing__formatFlowed_delSp___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  uint64_t v4;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFIndex v12;
  UniChar v13;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  int v19;
  char *v20;
  _BOOL8 v21;
  char *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CFStringRef theString;
  const UniChar *v45;
  const char *v46;
  uint64_t v47;
  CFIndex v48;
  char *v49;
  uint64_t v50;
  CFRange v51;

  v3 = a2;
  objc_opt_self();
  v4 = objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_28;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  Length = CFStringGetLength(v3);
  theString = v3;
  v47 = 0;
  v48 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  v45 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  v49 = 0;
  v50 = 0;
  v46 = CStringPtr;
  if (Length < 1)
  {
    v4 = 0;
LABEL_28:
    Length = 0;
    v21 = 0;
    goto LABEL_29;
  }
  v8 = 0;
  v9 = 0;
  v4 = 0;
  v10 = 64;
  while (1)
  {
    if ((unint64_t)v4 >= 4)
      v11 = 4;
    else
      v11 = v4;
    v12 = v48;
    if (v48 <= v4)
    {
      v21 = 0;
      Length = v4 + 1;
      goto LABEL_29;
    }
    if (v45)
    {
      v13 = v45[v4 + v47];
    }
    else if (v46)
    {
      v13 = v46[v47 + v4];
    }
    else
    {
      if (v50 <= v4 || v9 > v4)
      {
        v15 = v11 + v8;
        v16 = v10 - v11;
        v17 = (char *)(v4 - v11);
        v18 = v17 + 64;
        if ((uint64_t)(v17 + 64) >= v48)
          v18 = (char *)v48;
        v49 = v17;
        v50 = (uint64_t)v18;
        if (v48 >= v16)
          v12 = v16;
        v51.length = v12 + v15;
        v51.location = (CFIndex)&v17[v47];
        CFStringGetCharacters(theString, v51, (UniChar *)&v36);
        v9 = (uint64_t)v49;
      }
      v13 = *((_WORD *)&v36 + v4 - v9);
    }
    v19 = v13;
    v20 = (char *)(v4 + 1);
    if (v19 != 62)
      break;
    --v8;
    ++v10;
    ++v4;
    if ((char *)Length == v20)
    {
      v21 = 0;
      v4 = Length;
      goto LABEL_29;
    }
  }
  v21 = v19 == 32;
  Length = v4 + 1;
LABEL_29:

  v22 = (char *)(v4 + v21);
  if (-[__CFString length](v3, "length") - (_QWORD)v22 == 3
    && -[__CFString hasSuffix:](v3, "hasSuffix:", CFSTR("-- ")))
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v23 + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    *(_BYTE *)(v23 + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_37;
  }
  if (-[__CFString length](v3, "length", v36, v37, v38, v39, v40, v41, v42, v43) <= (unint64_t)Length)
  {
LABEL_37:
    v25 = -[__CFString length](v3, "length", v36, v37, v38, v39, v40, v41, v42, v43);
    goto LABEL_38;
  }
  v24 = -[__CFString hasSuffix:](v3, "hasSuffix:", CFSTR(" "));
  v25 = -[__CFString length](v3, "length");
  if (!v24)
  {
LABEL_38:
    v27 = 0;
    v26 = 0;
    goto LABEL_39;
  }
  v26 = *(unsigned __int8 *)(a1 + 56);
  v27 = 1;
LABEL_39:
  v28 = v25 - (_QWORD)v22 - v26;
  v29 = (void *)MEMORY[0x1C3BD4F6C]();
  -[__CFString substringWithRange:](v3, "substringWithRange:", v22, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v29);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v30);
  }
  else
  {
    v31 = (void *)MEMORY[0x1C3BD4F6C]();
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v32 + 24))
    {
      *(_BYTE *)(v32 + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
    }
    if (v4)
    {
      v33 = *(void **)(a1 + 32);
      -[__CFString substringToIndex:](v3, "substringToIndex:", v4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "appendString:", v34);

    }
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v30);
    objc_autoreleasePoolPop(v31);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v27;
  if (v27)
    v35 = (char *)v4;
  else
    v35 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v35;
  if ((v27 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));

}

uint64_t __63__SGSimpleMailMessage_RFC822Parsing__stripTrailingASCIIHSpace___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "getBytes:range:", *(_QWORD *)(a1 + 48) + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), a2, a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a3;
  return result;
}

void __63__SGSimpleMailMessage_RFC822Parsing__stripTrailingASCIIHSpace___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)stripTrailingASCIIHSpace___pasExprOnceResult;
  stripTrailingASCIIHSpace___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __51__SGSimpleMailMessage_RFC822Parsing__parseHeaders___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?:^(\\S+?):(?:\\r?\\n[ \\t])?[ \\t]*(\\S+(?:.*\\r?\\n[ \\t].*\\S+|.*\\S)*|).*$|(?:\\r?\\n){2})"), 16, &v7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGSimpleMailMessage+RFC822Parsing.m"), 178, CFSTR("error creating headerRegex: %@"), v4);

  }
  v5 = (void *)parseHeaders___pasExprOnceResult;
  parseHeaders___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

void __51__SGSimpleMailMessage_RFC822Parsing__parseHeaders___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  SGSimpleMailHeaderKeyValue *v18;
  void *v19;
  void *v20;
  void *v21;
  SGSimpleMailHeaderKeyValue *v22;
  void *v23;
  id v24;

  v24 = a2;
  v6 = objc_msgSend(v24, "rangeAtIndex:", 1);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *a4 = 1;
  }
  else
  {
    v8 = v6;
    v9 = v7;
    v10 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v10);
    v12 = objc_msgSend(v24, "rangeAtIndex:", 2);
    v14 = v13;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), CFSTR("SGSimpleMailMessage+RFC822Parsing.m"), 208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fieldValueRange.location != NSNotFound"));

    }
    v15 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v15);
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\r"), &stru_1E7DB83A8, 2, 0, objc_msgSend(v17, "length"));
    objc_msgSend(v17, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n\t"), CFSTR(" "), 2, 0, objc_msgSend(v17, "length"));
    objc_msgSend(v17, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), &stru_1E7DB83A8, 2, 0, objc_msgSend(v17, "length"));
    v18 = [SGSimpleMailHeaderKeyValue alloc];
    v19 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v11, "lowercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 56), "decodeEncodedWordsIn:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SGSimpleMailHeaderKeyValue initWithKey:value:](v18, "initWithKey:value:", v20, v21);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);
  }

}

void __93__SGSimpleMailMessage_RFC822Parsing__decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?:=([0-9A-F]{2})|=[ \\t]*(?:\\r?\\n|$)|[ \\t]+(?:\\r?\\n|$)|$)"), 0, &v7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGSimpleMailMessage+RFC822Parsing.m"), 126, CFSTR("error creating quotedPrintableRegex: %@"), v4);

  }
  v5 = (void *)decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___pasExprOnceResult;
  decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

void __93__SGSimpleMailMessage_RFC822Parsing__decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v4 != objc_msgSend(v3, "range"))
  {
    v5 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), objc_msgSend(v3, "range") - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(unsigned __int8 *)(a1 + 56);
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    if (v7)
    {
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("_"));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    objc_autoreleasePoolPop(v8);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __93__SGSimpleMailMessage_RFC822Parsing__decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___block_invoke_3;
    v20[3] = &unk_1E7DAA748;
    v21 = *(id *)(a1 + 40);
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v20);

    objc_autoreleasePoolPop(v5);
  }
  v11 = objc_msgSend(v3, "rangeAtIndex:", 1);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v11;
    v14 = v12;
    v15 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v13, v14);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = strtol((const char *)objc_msgSend(v16, "UTF8String"), 0, 16);
    objc_msgSend(*(id *)(a1 + 40), "appendBytes:length:", &v19, 1);

    objc_autoreleasePoolPop(v15);
  }
  v17 = objc_msgSend(v3, "range");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v17 + v18;

}

void __93__SGSimpleMailMessage_RFC822Parsing__decodeQuotedPrintable_charset_rfc2047UnderscoreAsSpace___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendBytes:length:", " ", 1);
  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v8, "dataUsingEncoding:allowLossyConversion:", 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "appendData:", v7);

}

void __58__SGSimpleMailMessage_RFC822Parsing__dateFromEmailString___block_invoke_3()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)dateFromEmailString___pasExprOnceResult_92;
  dateFromEmailString___pasExprOnceResult_92 = v1;

  objc_autoreleasePoolPop(v0);
}

void __58__SGSimpleMailMessage_RFC822Parsing__dateFromEmailString___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __58__SGSimpleMailMessage_RFC822Parsing__dateFromEmailString___block_invoke_2;
  v5[3] = &unk_1E7DAA700;
  v5[1] = 3221225472;
  v6 = v1;
  v7 = &unk_1E7E106E0;
  v8 = &unk_1E7E106F8;
  v2 = v1;
  objc_msgSend(&unk_1E7E10710, "_pas_mappedArrayWithTransform:", v5);
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)dateFromEmailString___pasExprOnceResult;
  dateFromEmailString___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

id __58__SGSimpleMailMessage_RFC822Parsing__dateFromEmailString___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setLocale:", a1[4]);
  objc_msgSend(v4, "setShortMonthSymbols:", a1[5]);
  objc_msgSend(v4, "setShortWeekdaySymbols:", a1[6]);
  objc_msgSend(v4, "setLenient:", 1);
  objc_msgSend(v4, "setDateFormat:", v3);

  return v4;
}

id __66__SGSimpleMailMessage_RFC822Parsing__addressItemsFromEmailString___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3500];
  v3 = a2;
  objc_msgSend(v2, "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initForBuilding
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SGSimpleMailMessage;
  v2 = -[SGMessage initForBuilding](&v11, sel_initForBuilding);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "_clearExistingHtml");
    v4 = objc_opt_new();
    v5 = (void *)v3[25];
    v3[25] = v4;

    v6 = objc_opt_new();
    v7 = (void *)v3[26];
    v3[26] = v6;

    v8 = objc_opt_new();
    v9 = (void *)v3[27];
    v3[27] = v8;

  }
  return v3;
}

- (SGSimpleMailMessage)initWithMessageDictionary:(id)a3
{
  id v4;
  SGSimpleMailMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *messageId;
  void *v12;
  uint64_t v13;
  NSString *inReplyTo;
  void *v15;
  uint64_t v16;
  NSString *appleMailMessageId;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  SGSimpleNamedEmailAddress *from;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  SGSimpleNamedEmailAddress *forwardedBy;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  SGSimpleNamedEmailAddress *replyTo;
  void *v33;
  void *v34;
  uint64_t v35;
  NSArray *to;
  void *v37;
  void *v38;
  uint64_t v39;
  NSArray *cc;
  void *v41;
  void *v42;
  uint64_t v43;
  NSArray *bcc;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  SGSimpleNamedEmailAddress *mailingList;
  void *v51;
  NSArray *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  SGSimpleMailHeaderKeyValue *v59;
  void *v60;
  void *v61;
  SGSimpleMailHeaderKeyValue *v62;
  NSArray *headers;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  objc_super v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)SGSimpleMailMessage;
  v5 = -[SGMessage initWithMessageDictionary:](&v70, sel_initWithMessageDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("htmlBody"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("htmlBody"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "copy");
      -[SGSimpleMailMessage setHtmlBody:](v5, "setHtmlBody:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inReplyTo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    inReplyTo = v5->_inReplyTo;
    v5->_inReplyTo = (NSString *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleMailMessageId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    appleMailMessageId = v5->_appleMailMessageId;
    v5->_appleMailMessageId = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0D19938];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("from"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "namedEmailAddressWithFieldValue:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    from = v5->_from;
    v5->_from = (SGSimpleNamedEmailAddress *)v21;

    v23 = (void *)MEMORY[0x1E0D19938];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("forwardedBy"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "namedEmailAddressWithFieldValue:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    forwardedBy = v5->_forwardedBy;
    v5->_forwardedBy = (SGSimpleNamedEmailAddress *)v26;

    v28 = (void *)MEMORY[0x1E0D19938];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("replyTo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "namedEmailAddressWithFieldValue:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    replyTo = v5->_replyTo;
    v5->_replyTo = (SGSimpleNamedEmailAddress *)v31;

    v33 = (void *)MEMORY[0x1E0D19938];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("to"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "namedEmailAddressesWithFieldValues:", v34);
    v35 = objc_claimAutoreleasedReturnValue();
    to = v5->_to;
    v5->_to = (NSArray *)v35;

    v37 = (void *)MEMORY[0x1E0D19938];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cc"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "namedEmailAddressesWithFieldValues:", v38);
    v39 = objc_claimAutoreleasedReturnValue();
    cc = v5->_cc;
    v5->_cc = (NSArray *)v39;

    v41 = (void *)MEMORY[0x1E0D19938];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bcc"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "namedEmailAddressesWithFieldValues:", v42);
    v43 = objc_claimAutoreleasedReturnValue();
    bcc = v5->_bcc;
    v5->_bcc = (NSArray *)v43;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasInhumanHeaders"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasInhumanHeaders = objc_msgSend(v45, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPartiallyDownloaded"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isPartiallyDownloaded = objc_msgSend(v46, "BOOLValue");

    v47 = (void *)MEMORY[0x1E0D19938];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mailingList"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "namedEmailAddressWithFieldValue:", v48);
    v49 = objc_claimAutoreleasedReturnValue();
    mailingList = v5->_mailingList;
    v5->_mailingList = (SGSimpleNamedEmailAddress *)v49;

    v65 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headers"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v51, "count"));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v53 = v51;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v67;
      do
      {
        v57 = 0;
        do
        {
          if (*(_QWORD *)v67 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v57);
          v59 = [SGSimpleMailHeaderKeyValue alloc];
          objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectAtIndexedSubscript:", 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[SGSimpleMailHeaderKeyValue initWithKey:value:](v59, "initWithKey:value:", v60, v61);
          -[NSArray addObject:](v52, "addObject:", v62);

          ++v57;
        }
        while (v55 != v57);
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      }
      while (v55);
    }

    headers = v5->_headers;
    v5->_headers = v52;

    v4 = v65;
  }

  return v5;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  void *v5;
  NSString *messageId;
  NSString *inReplyTo;
  SGSimpleNamedEmailAddress *from;
  void *v9;
  SGSimpleNamedEmailAddress *replyTo;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SGSimpleNamedEmailAddress *mailingList;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (asDictionary_onceToken != -1)
    dispatch_once(&asDictionary_onceToken, &__block_literal_global_9156);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", asDictionary_sharedKeySet);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34.receiver = self;
  v34.super_class = (Class)SGSimpleMailMessage;
  -[SGMessage asDictionary](&v34, sel_asDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  -[SGSimpleMailMessage htmlBody](self, "htmlBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("htmlBody"));

  messageId = self->_messageId;
  if (messageId)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", messageId, CFSTR("messageId"));
  inReplyTo = self->_inReplyTo;
  if (inReplyTo)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", inReplyTo, CFSTR("inReplyTo"));
  from = self->_from;
  if (from)
  {
    -[SGSimpleNamedEmailAddress serialized](from, "serialized");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("from"));

  }
  replyTo = self->_replyTo;
  if (replyTo)
  {
    -[SGSimpleNamedEmailAddress serialized](replyTo, "serialized");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("replyTo"));

  }
  if (self->_to)
  {
    objc_msgSend(MEMORY[0x1E0D19938], "serializeAll:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("to"));

  }
  if (self->_cc)
  {
    objc_msgSend(MEMORY[0x1E0D19938], "serializeAll:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("cc"));

  }
  if (self->_bcc)
  {
    objc_msgSend(MEMORY[0x1E0D19938], "serializeAll:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("bcc"));

  }
  if (self->_hasInhumanHeaders)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hasInhumanHeaders"));

  }
  if (self->_isPartiallyDownloaded)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isPartiallyDownloaded"));

  }
  mailingList = self->_mailingList;
  if (mailingList)
  {
    -[SGSimpleNamedEmailAddress serialized](mailingList, "serialized");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("mailingList"));

  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_headers, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = self->_headers;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v25, "key", (_QWORD)v30);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v26;
        objc_msgSend(v25, "value");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v35[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v28);

      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v22);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("headers"));
  return v3;
}

- (id)headersDictionary
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
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
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSString *messageId;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v4 = self->_headers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v9, "key", (_QWORD)v49);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v11 = (void *)objc_opt_new();
          objc_msgSend(v9, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

        }
        objc_msgSend(v9, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v13);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    }
    while (v6);
  }

  if (self->_messageId)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message-id"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      messageId = self->_messageId;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &messageId, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("message-id"));

    }
  }
  -[SGMessage subject](self, "subject", (_QWORD)v49);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subject"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[SGMessage subject](self, "subject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("subject"));

    }
  }
  -[SGMessage date](self, "date");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("date"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      -[SGMessage date](self, "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sg_descriptionForMimeHeaders");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("date"));

    }
  }
  if (self->_from)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("from"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      -[SGSimpleNamedEmailAddress serialized](self->_from, "serialized");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("from"));

    }
  }
  if (self->_replyTo)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reply-to"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      -[SGSimpleNamedEmailAddress serialized](self->_replyTo, "serialized");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("reply-to"));

    }
  }
  if (-[NSArray count](self->_to, "count"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("to"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      objc_msgSend(MEMORY[0x1E0D19938], "serializeAll:", self->_to);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_pas_componentsJoinedByString:", CFSTR(", "));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("to"));

    }
  }
  if (-[NSArray count](self->_cc, "count"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cc"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
    {
      objc_msgSend(MEMORY[0x1E0D19938], "serializeAll:", self->_cc);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "_pas_componentsJoinedByString:", CFSTR(", "));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("cc"));

    }
  }
  if (-[NSArray count](self->_bcc, "count"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bcc"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
      objc_msgSend(MEMORY[0x1E0D19938], "serializeAll:", self->_bcc);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "_pas_componentsJoinedByString:", CFSTR(", "));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("bcc"));

    }
  }
  if (self->_mailingList)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("list-id"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {
      -[SGSimpleNamedEmailAddress serialized](self->_mailingList, "serialized");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("list-id"));

    }
  }
  return v3;
}

- (void)_clearExistingHtml
{
  NSString *htmlBody;
  _PASCachedResult *v4;
  _PASCachedResult *htmlBodyCached;
  NSData *htmlContentData;
  _PASCachedResult *v7;
  _PASCachedResult *htmlContentDataCached;

  htmlBody = self->_htmlBody;
  self->_htmlBody = 0;

  v4 = (_PASCachedResult *)objc_opt_new();
  htmlBodyCached = self->_htmlBodyCached;
  self->_htmlBodyCached = v4;

  htmlContentData = self->_htmlContentData;
  self->_htmlContentData = 0;

  v7 = (_PASCachedResult *)objc_opt_new();
  htmlContentDataCached = self->_htmlContentDataCached;
  self->_htmlContentDataCached = v7;

}

- (NSString)htmlBody
{
  NSString *htmlBody;
  _PASCachedResult *htmlBodyCached;
  _QWORD v5[5];

  htmlBody = self->_htmlBody;
  if (htmlBody)
    return htmlBody;
  htmlBodyCached = self->_htmlBodyCached;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__SGSimpleMailMessage_htmlBody__block_invoke;
  v5[3] = &unk_1E7DB15E8;
  v5[4] = self;
  -[_PASCachedResult resultNonnullWithBlock:](htmlBodyCached, "resultNonnullWithBlock:", v5);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setHtmlBody:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  NSString *v6;
  NSString *htmlBody;
  HVHtmlParser *v8;
  HVHtmlParser *htmlParser;
  NSString *v10;

  v4 = (__CFString *)a3;
  -[SGSimpleMailMessage _clearExistingHtml](self, "_clearExistingHtml");
  v5 = &stru_1E7DB83A8;
  if (v4)
    v5 = v4;
  v6 = v5;

  htmlBody = self->_htmlBody;
  self->_htmlBody = v6;
  v10 = v6;

  v8 = (HVHtmlParser *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80F98]), "initWithString:", v10);
  htmlParser = self->_htmlParser;
  self->_htmlParser = v8;

}

- (NSData)htmlContentData
{
  NSData *htmlContentData;
  _PASCachedResult *htmlContentDataCached;
  _QWORD v5[5];

  htmlContentData = self->_htmlContentData;
  if (htmlContentData)
    return htmlContentData;
  htmlContentDataCached = self->_htmlContentDataCached;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__SGSimpleMailMessage_htmlContentData__block_invoke;
  v5[3] = &unk_1E7DAB328;
  v5[4] = self;
  -[_PASCachedResult resultNonnullWithBlock:](htmlContentDataCached, "resultNonnullWithBlock:", v5);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setHtmlContentData:(id)a3
{
  id v4;
  void *v5;
  NSData *v6;
  NSData *htmlContentData;
  HVHtmlParser *v8;
  HVHtmlParser *htmlParser;
  NSData *v10;

  v4 = a3;
  -[SGSimpleMailMessage _clearExistingHtml](self, "_clearExistingHtml");
  v5 = (void *)*MEMORY[0x1E0D81688];
  if (v4)
    v5 = v4;
  v6 = v5;

  htmlContentData = self->_htmlContentData;
  self->_htmlContentData = v6;
  v10 = v6;

  v8 = (HVHtmlParser *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80F98]), "initWithData:encoding:", v10, 4);
  htmlParser = self->_htmlParser;
  self->_htmlParser = v8;

}

- (NSIndexSet)quotedRegions
{
  _PASCachedResult *quotedRegionsCached;
  void *v6;
  _QWORD v7[5];

  quotedRegionsCached = self->_quotedRegionsCached;
  if (!quotedRegionsCached)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSimpleMailMessage.m"), 325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_quotedRegionsCached"));

    quotedRegionsCached = self->_quotedRegionsCached;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__SGSimpleMailMessage_quotedRegions__block_invoke;
  v7[3] = &unk_1E7DAB378;
  v7[4] = self;
  -[_PASCachedResult resultNonnullWithBlock:](quotedRegionsCached, "resultNonnullWithBlock:", v7);
  return (NSIndexSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isInhumanContentNoncached
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[SGSimpleMailMessage textContent](self, "textContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1C3BD4F6C]();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v3, "length"));
    -[SGSimpleMailMessage htmlParser](self, "htmlParser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quotedRegions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeIndexes:", v7);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__SGSimpleMailMessage_isInhumanContentNoncached__block_invoke;
    v10[3] = &unk_1E7DAB3A0;
    v12 = &v13;
    v11 = v3;
    objc_msgSend(v5, "enumerateRangesUsingBlock:", v10);

    objc_autoreleasePoolPop(v4);
  }
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)hasHumanHeaders
{
  _PASCachedResult *hasHumanHeadersCached;
  void *v3;
  char v4;
  _QWORD v6[5];

  hasHumanHeadersCached = self->_hasHumanHeadersCached;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SGSimpleMailMessage_hasHumanHeaders__block_invoke;
  v6[3] = &unk_1E7DB1610;
  v6[4] = self;
  -[_PASCachedResult resultNonnullWithBlock:](hasHumanHeadersCached, "resultNonnullWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)dataDetectorMatchesWithSignature
{
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
  void *v14;
  void *v15;

  -[SGSimpleMailMessage textContent](self, "textContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSimpleMailMessage htmlParser](self, "htmlParser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quotedRegions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGSimpleMailMessage htmlParser](self, "htmlParser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabularRegions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGMessage date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v3, "length"));
  objc_msgSend(v9, "removeIndexes:", v5);
  objc_msgSend(v9, "removeIndexes:", v7);
  +[SGDataDetectorMatch detectionsAndSignatureInText:eligibleRegions:baseDate:](SGDataDetectorMatch, "detectionsAndSignatureInText:eligibleRegions:baseDate:", v3, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[SGDataDetectorMatch detectionsInPlainText:withEligibleRegions:baseDate:](SGDataDetectorMatch, "detectionsInPlainText:withEligibleRegions:baseDate:", v3, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "_pas_filteredArrayWithTest:", &__block_literal_global_171);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v10, "matches");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");

        objc_msgSend(v14, "addObjectsFromArray:", v12);
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(v10, "setMatches:", v15);

      }
    }
    else
    {
      v12 = v11;
    }

  }
  return v10;
}

- (id)textContent
{
  void *v3;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGSimpleMailMessage;
  -[SGMessage textContent](&v8, sel_textContent);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SGSimpleMailMessage;
    -[SGMessage textContent](&v7, sel_textContent);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SGSimpleMailMessage htmlParser](self, "htmlParser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (int64_t)contentLength
{
  void *v3;
  void *v4;
  int64_t v5;
  void *htmlContentData;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SGSimpleMailMessage;
  -[SGMessage textContent](&v9, sel_textContent);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)SGSimpleMailMessage;
    -[SGMessage textContent](&v8, sel_textContent);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

  }
  else
  {
    htmlContentData = self->_htmlContentData;
    if (htmlContentData)
      return objc_msgSend(htmlContentData, "length");
    htmlContentData = self->_htmlBody;
    if (htmlContentData)
      return objc_msgSend(htmlContentData, "length");
    else
      return 0;
  }
  return v5;
}

- (id)author
{
  _PASCachedResult *authorCached;
  _QWORD v4[5];

  authorCached = self->_authorCached;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__SGSimpleMailMessage_author__block_invoke;
  v4[3] = &unk_1E7DAB3E8;
  v4[4] = self;
  -[_PASCachedResult resultWithBlock:](authorCached, "resultWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)uniqueIdentifier
{
  NSString *messageId;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  uint64_t v16;
  CC_LONG v17;
  void *v18;
  uint64_t i;
  void *v20;
  CC_SHA256_CTX c;
  char __str[16];
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  messageId = self->_messageId;
  if (messageId)
    return messageId;
  memset(&c, 0, sizeof(c));
  v5 = CC_SHA256_Init(&c);
  v6 = (void *)MEMORY[0x1C3BD4F6C](v5);
  -[SGSimpleNamedEmailAddress emailAddress](self->_from, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  if (v8)
  {
    v9 = objc_retainAutorelease(v8);
    CC_SHA256_Update(&c, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
  }

  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGMessage subject](self, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v10);
  if (v12)
  {
    v13 = objc_retainAutorelease(v12);
    CC_SHA256_Update(&c, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
  }

  -[SGMessage date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v16 = (uint64_t)v15;

  *(_OWORD *)__str = 0u;
  v23 = 0u;
  snprintf(__str, 0x20uLL, "%llu", v16);
  v17 = strlen(__str);
  CC_SHA256_Update(&c, __str, v17);
  CC_SHA256_Final((unsigned __int8 *)__str, &c);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 64);
  for (i = 0; i != 32; ++i)
  {
    v20 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v18, "appendFormat:", CFSTR("%02x"), __str[i]);
    objc_autoreleasePoolPop(v20);
  }
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  SGSimpleMailMessage *v4;
  SGSimpleMailMessage *v5;
  BOOL v6;

  v4 = (SGSimpleMailMessage *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGSimpleMailMessage isEqualToSimpleMailMessage:](self, "isEqualToSimpleMailMessage:", v5);

  return v6;
}

- (BOOL)isEqualToSimpleMailMessage:(id)a3
{
  id *v4;
  NSString *messageId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  SGSimpleNamedEmailAddress *from;
  SGSimpleNamedEmailAddress *v11;
  SGSimpleNamedEmailAddress *v12;
  SGSimpleNamedEmailAddress *v13;
  char v14;
  SGSimpleNamedEmailAddress *replyTo;
  SGSimpleNamedEmailAddress *v16;
  SGSimpleNamedEmailAddress *v17;
  SGSimpleNamedEmailAddress *v18;
  char v19;
  NSArray *to;
  NSArray *v21;
  NSArray *v22;
  NSArray *v23;
  char v24;
  NSArray *cc;
  NSArray *v26;
  NSArray *v27;
  NSArray *v28;
  char v29;
  NSArray *bcc;
  NSArray *v31;
  NSArray *v32;
  NSArray *v33;
  char v34;
  NSArray *headers;
  NSArray *v36;
  NSArray *v37;
  NSArray *v38;
  char v39;
  SGSimpleNamedEmailAddress *mailingList;
  SGSimpleNamedEmailAddress *v41;
  SGSimpleNamedEmailAddress *v42;
  SGSimpleNamedEmailAddress *v43;
  char v44;
  NSString *appleMailMessageId;
  NSString *v46;
  NSString *v47;
  NSString *v48;
  char v49;
  char v50;
  NSData *htmlContentData;
  void *v53;
  void *v54;
  objc_super v55;

  v4 = (id *)a3;
  v55.receiver = self;
  v55.super_class = (Class)SGSimpleMailMessage;
  if (!-[SGMessage isEqualToMessage:](&v55, sel_isEqualToMessage_, v4))
    goto LABEL_38;
  messageId = self->_messageId;
  v6 = (NSString *)v4[35];
  if (messageId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = messageId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_38;
  }
  from = self->_from;
  v11 = (SGSimpleNamedEmailAddress *)v4[29];
  if (from == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = from;
    v14 = -[SGSimpleNamedEmailAddress isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_38;
  }
  replyTo = self->_replyTo;
  v16 = (SGSimpleNamedEmailAddress *)v4[30];
  if (replyTo == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = replyTo;
    v19 = -[SGSimpleNamedEmailAddress isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_38;
  }
  to = self->_to;
  v21 = (NSArray *)v4[31];
  if (to == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = to;
    v24 = -[NSArray isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_38;
  }
  cc = self->_cc;
  v26 = (NSArray *)v4[32];
  if (cc == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = cc;
    v29 = -[NSArray isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_38;
  }
  bcc = self->_bcc;
  v31 = (NSArray *)v4[33];
  if (bcc == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = bcc;
    v34 = -[NSArray isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_38;
  }
  headers = self->_headers;
  v36 = (NSArray *)v4[40];
  if (headers == v36)
  {

  }
  else
  {
    v37 = v36;
    v38 = headers;
    v39 = -[NSArray isEqual:](v38, "isEqual:", v37);

    if ((v39 & 1) == 0)
      goto LABEL_38;
  }
  mailingList = self->_mailingList;
  v41 = (SGSimpleNamedEmailAddress *)v4[41];
  if (mailingList == v41)
  {

  }
  else
  {
    v42 = v41;
    v43 = mailingList;
    v44 = -[SGSimpleNamedEmailAddress isEqual:](v43, "isEqual:", v42);

    if ((v44 & 1) == 0)
      goto LABEL_38;
  }
  if (self->_hasInhumanHeaders != *((unsigned __int8 *)v4 + 224)
    || self->_isPartiallyDownloaded != *((unsigned __int8 *)v4 + 225))
  {
    goto LABEL_38;
  }
  appleMailMessageId = self->_appleMailMessageId;
  v46 = (NSString *)v4[36];
  if (appleMailMessageId == v46)
  {

  }
  else
  {
    v47 = v46;
    v48 = appleMailMessageId;
    v49 = -[NSString isEqual:](v48, "isEqual:", v47);

    if ((v49 & 1) == 0)
    {
LABEL_38:
      v50 = 0;
      goto LABEL_39;
    }
  }
  htmlContentData = self->_htmlContentData;
  if (htmlContentData)
  {
    objc_msgSend(v4, "htmlContentData");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[NSData isEqual:](htmlContentData, "isEqual:", v53);
  }
  else
  {
    -[SGSimpleMailMessage htmlBody](self, "htmlBody");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "htmlBody");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v53, "isEqual:", v54);

  }
LABEL_39:

  return v50;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGSimpleMailMessage;
  v3 = -[SGSimpleMailMessage hash](&v6, sel_hash);
  v4 = -[NSString hash](self->_messageId, "hash") - v3 + 32 * v3;
  return -[SGSimpleNamedEmailAddress hash](self->_from, "hash") - v4 + 32 * v4;
}

- (SGSimpleMailMessage)initWithCoder:(id)a3
{
  id v4;
  SGSimpleMailMessage *v5;
  void *v6;
  uint64_t v7;
  NSString *htmlBody;
  void *v9;
  uint64_t v10;
  NSData *htmlContentData;
  void *v12;
  uint64_t v13;
  NSString *messageId;
  void *v15;
  uint64_t v16;
  NSString *inReplyTo;
  void *v18;
  uint64_t v19;
  SGSimpleNamedEmailAddress *from;
  void *v21;
  uint64_t v22;
  SGSimpleNamedEmailAddress *mailingList;
  void *v24;
  uint64_t v25;
  SGSimpleNamedEmailAddress *replyTo;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *to;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *cc;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSArray *bcc;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSArray *headers;
  void *v47;
  uint64_t v48;
  NSString *appleMailMessageId;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SGSimpleMailMessage;
  v5 = -[SGMessage initWithCoder:](&v51, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("htmlBody"));
    v7 = objc_claimAutoreleasedReturnValue();
    htmlBody = v5->_htmlBody;
    v5->_htmlBody = (NSString *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("htmlContentData"));
    v10 = objc_claimAutoreleasedReturnValue();
    htmlContentData = v5->_htmlContentData;
    v5->_htmlContentData = (NSData *)v10;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("messageId"));
    v13 = objc_claimAutoreleasedReturnValue();
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v13;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("inReplyTo"));
    v16 = objc_claimAutoreleasedReturnValue();
    inReplyTo = v5->_inReplyTo;
    v5->_inReplyTo = (NSString *)v16;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("from"));
    v19 = objc_claimAutoreleasedReturnValue();
    from = v5->_from;
    v5->_from = (SGSimpleNamedEmailAddress *)v19;

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("mailingList"));
    v22 = objc_claimAutoreleasedReturnValue();
    mailingList = v5->_mailingList;
    v5->_mailingList = (SGSimpleNamedEmailAddress *)v22;

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("replyTo"));
    v25 = objc_claimAutoreleasedReturnValue();
    replyTo = v5->_replyTo;
    v5->_replyTo = (SGSimpleNamedEmailAddress *)v25;

    v27 = objc_alloc(MEMORY[0x1E0C99E60]);
    v28 = objc_opt_class();
    v29 = (void *)objc_msgSend(v27, "initWithObjects:", v28, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("to"));
    v30 = objc_claimAutoreleasedReturnValue();
    to = v5->_to;
    v5->_to = (NSArray *)v30;

    v32 = objc_alloc(MEMORY[0x1E0C99E60]);
    v33 = objc_opt_class();
    v34 = (void *)objc_msgSend(v32, "initWithObjects:", v33, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("cc"));
    v35 = objc_claimAutoreleasedReturnValue();
    cc = v5->_cc;
    v5->_cc = (NSArray *)v35;

    v37 = objc_alloc(MEMORY[0x1E0C99E60]);
    v38 = objc_opt_class();
    v39 = (void *)objc_msgSend(v37, "initWithObjects:", v38, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("bcc"));
    v40 = objc_claimAutoreleasedReturnValue();
    bcc = v5->_bcc;
    v5->_bcc = (NSArray *)v40;

    v5->_hasInhumanHeaders = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasInhumanHeaders"));
    v5->_isPartiallyDownloaded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPartiallyDownloaded"));
    v42 = objc_alloc(MEMORY[0x1E0C99E60]);
    v43 = objc_opt_class();
    v44 = (void *)objc_msgSend(v42, "initWithObjects:", v43, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("headers"));
    v45 = objc_claimAutoreleasedReturnValue();
    headers = v5->_headers;
    v5->_headers = (NSArray *)v45;

    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("appleMailMessageId"));
    v48 = objc_claimAutoreleasedReturnValue();
    appleMailMessageId = v5->_appleMailMessageId;
    v5->_appleMailMessageId = (NSString *)v48;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGSimpleMailMessage;
  v4 = a3;
  -[SGMessage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_htmlBody, CFSTR("htmlBody"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_htmlContentData, CFSTR("htmlContentData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_messageId, CFSTR("messageId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_inReplyTo, CFSTR("inReplyTo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_from, CFSTR("from"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_replyTo, CFSTR("replyTo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mailingList, CFSTR("mailingList"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_to, CFSTR("to"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cc, CFSTR("cc"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bcc, CFSTR("bcc"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasInhumanHeaders, CFSTR("hasInhumanHeaders"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isPartiallyDownloaded, CFSTR("isPartiallyDownloaded"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_headers, CFSTR("headers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_appleMailMessageId, CFSTR("appleMailMessageId"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SGSimpleMailMessage;
  v4 = -[SGMessage copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (self->_htmlContentData)
  {
    objc_msgSend(v4, "setHtmlContentData:");
  }
  else if (self->_htmlBody)
  {
    objc_msgSend(v4, "setHtmlBody:");
  }
  objc_msgSend(v5, "setMessageId:", self->_messageId);
  objc_msgSend(v5, "setFrom:", self->_from);
  objc_msgSend(v5, "setReplyTo:", self->_replyTo);
  objc_msgSend(v5, "setTo:", self->_to);
  objc_msgSend(v5, "setCc:", self->_cc);
  objc_msgSend(v5, "setBcc:", self->_bcc);
  objc_msgSend(v5, "setHasInhumanHeaders:", self->_hasInhumanHeaders);
  objc_msgSend(v5, "setIsPartiallyDownloaded:", self->_isPartiallyDownloaded);
  objc_msgSend(v5, "setMailingList:", self->_mailingList);
  objc_storeStrong(v5 + 40, self->_headers);
  objc_storeStrong(v5 + 36, self->_appleMailMessageId);
  objc_storeStrong(v5 + 37, self->_inReplyTo);
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGSimpleMailMessage asDictionary](self, "asDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGSimpleMailMessage %@>"), v4);

  return v5;
}

- (SGSimpleMailMessage)initWithSearchableItem:(id)a3
{
  id v4;
  SGSimpleMailMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSMapTable *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *appleMailMessageId;
  uint64_t v26;
  NSString *inReplyTo;
  uint64_t v28;
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
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  SGSimpleMailHeaderKeyValue *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *context;
  id v59;
  uint64_t v60;
  uint64_t v61;
  NSMapTable *obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)SGSimpleMailMessage;
  v5 = -[SGMessage initWithSearchableItem:](&v71, sel_initWithSearchableItem_, v4);
  if (v5)
  {
    context = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v4, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setSource:](v5, "setSource:", v7);

    objc_msgSend(v6, "contentCreationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    -[SGMessage setDate:](v5, "setDate:", v9);

    objc_msgSend(v6, "authors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emailHeaders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0CB3748]);
      objc_msgSend(MEMORY[0x1E0CB3748], "hv_headerKeyFunctions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3748], "hv_headerValueFunctions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (NSMapTable *)objc_msgSend(v12, "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v13, v14, objc_msgSend(v11, "count"));

      -[NSMapTable hv_addEntriesFromHeadersDictionary:](v15, "hv_addEntriesFromHeadersDictionary:", v11);
    }
    else
    {
      v15 = 0;
    }
    if (objc_msgSend(v10, "count"))
    {
      v16 = (void *)MEMORY[0x1E0D19938];
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "namedEmailAddressWithCSPerson:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGSimpleMailMessage setFrom:](v5, "setFrom:", v18);

    }
    -[NSMapTable objectForKey:](v15, "objectForKey:", CFSTR("reply-to"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      v20 = (void *)MEMORY[0x1E0D19938];
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "namedEmailAddressWithFieldValue:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGSimpleMailMessage setReplyTo:](v5, "setReplyTo:", v22);

    }
    -[NSMapTable hv_firstHeaderForKey:](v15, "hv_firstHeaderForKey:", CFSTR("message-id"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 || (objc_msgSend(v6, "mailMessageID"), (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SGSimpleMailMessage setMessageId:](v5, "setMessageId:", v23);

    }
    objc_msgSend(v6, "mailMessageID");
    v24 = objc_claimAutoreleasedReturnValue();
    appleMailMessageId = v5->_appleMailMessageId;
    v5->_appleMailMessageId = (NSString *)v24;

    -[NSMapTable hv_firstHeaderForKey:](v15, "hv_firstHeaderForKey:", CFSTR("in-reply-to"));
    v26 = objc_claimAutoreleasedReturnValue();
    inReplyTo = v5->_inReplyTo;
    v5->_inReplyTo = (NSString *)v26;

    -[NSMapTable hv_firstHeaderForKey:](v15, "hv_firstHeaderForKey:", CFSTR("list-id"));
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(MEMORY[0x1E0D19938], "namedEmailAddressWithFieldValue:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGSimpleMailMessage setMailingList:](v5, "setMailingList:", v29);

    }
    v53 = (void *)v28;
    objc_msgSend(v6, "primaryRecipients");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    sgMapAndFilter();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSimpleMailMessage setTo:](v5, "setTo:", v31);

    objc_msgSend(v6, "additionalRecipients");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    sgMapAndFilter();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSimpleMailMessage setCc:](v5, "setCc:", v33);

    objc_msgSend(v6, "hiddenAdditionalRecipients");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    sgMapAndFilter();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSimpleMailMessage setBcc:](v5, "setBcc:", v35);

    objc_msgSend(v6, "mailboxIdentifiers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSimpleMailMessage setMailboxIdentifiers:](v5, "setMailboxIdentifiers:", v36);

    v56 = v10;
    v57 = v6;
    v54 = v19;
    v55 = v11;
    if (v15)
    {
      v37 = (void *)objc_opt_class();
      NSAllMapTableKeys(v15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGSimpleMailMessage setHasInhumanHeaders:](v5, "setHasInhumanHeaders:", objc_msgSend(v37, "headersContainInhumanOnes:keys:", v15, v38));

    }
    else
    {
      -[SGSimpleMailMessage setHasInhumanHeaders:](v5, "setHasInhumanHeaders:", 0);
    }
    v59 = v4;
    objc_msgSend(v4, "attributeSet");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "isPartiallyDownloaded");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSimpleMailMessage setIsPartiallyDownloaded:](v5, "setIsPartiallyDownloaded:", objc_msgSend(v40, "BOOLValue"));

    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMapTable count](v15, "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v15;
    v61 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    if (v61)
    {
      v60 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v61; ++i)
        {
          if (*(_QWORD *)v68 != v60)
            objc_enumerationMutation(obj);
          v43 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
          v44 = (void *)MEMORY[0x1C3BD4F6C]();
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          -[NSMapTable objectForKey:](obj, "objectForKey:", v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
          if (v46)
          {
            v47 = v46;
            v48 = *(_QWORD *)v64;
            do
            {
              for (j = 0; j != v47; ++j)
              {
                if (*(_QWORD *)v64 != v48)
                  objc_enumerationMutation(v45);
                v50 = -[SGSimpleMailHeaderKeyValue initWithKey:value:]([SGSimpleMailHeaderKeyValue alloc], "initWithKey:value:", v43, *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
                objc_msgSend(v41, "addObject:", v50);

              }
              v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
            }
            while (v47);
          }

          objc_autoreleasePoolPop(v44);
        }
        v61 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      }
      while (v61);
    }

    objc_storeStrong((id *)&v5->_headers, v41);
    objc_msgSend(v57, "HTMLContentDataNoCopy");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      -[SGMessage setTextContent:](v5, "setTextContent:", 0);
      -[SGSimpleMailMessage setHtmlContentData:](v5, "setHtmlContentData:", v51);
    }
    v4 = v59;
    -[SGMessage setIsSent:](v5, "setIsSent:", objc_msgSend(MEMORY[0x1E0D80FB0], "mailItemIsInSent:", v59));

    objc_autoreleasePoolPop(context);
  }

  return v5;
}

- (SGSimpleMailMessage)initWithMailContentEvent:(id)a3 contentProtection:(id)a4 htmlParser:(id)a5
{
  id v8;
  id v9;
  id v10;
  SGSimpleMailMessage *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  SGSimpleNamedEmailAddress *replyTo;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  SGSimpleNamedEmailAddress *mailingList;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *messageId;
  uint64_t v35;
  NSString *v36;
  uint64_t v37;
  NSString *appleMailMessageId;
  void *v39;
  void *v40;
  uint64_t v41;
  NSString *inReplyTo;
  id v43;
  void *v44;
  uint64_t v45;
  SGSimpleNamedEmailAddress *from;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSArray *mailboxIdentifiers;
  void *v62;
  NSArray *v63;
  uint64_t i;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  SGSimpleMailHeaderKeyValue *v72;
  NSArray *headers;
  NSArray *v74;
  uint64_t v75;
  NSData *htmlContentData;
  void *v77;
  id v79;
  id v80;
  id v81;
  SGSimpleMailMessage *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  id obj;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  objc_super v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v99.receiver = self;
  v99.super_class = (Class)SGSimpleMailMessage;
  v11 = -[SGMessage initWithMailContentEvent:contentProtection:](&v99, sel_initWithMailContentEvent_contentProtection_, v8, v9);
  if (v11)
  {
    v79 = a5;
    v80 = v10;
    v81 = v9;
    objc_msgSend(v8, "replyTo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x1E0D19938]);
      objc_msgSend(v8, "replyTo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "initWithNamedHandle:", v14);
      replyTo = v11->_replyTo;
      v11->_replyTo = (SGSimpleNamedEmailAddress *)v15;

    }
    objc_msgSend(v8, "listId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x1E0D19938]);
      objc_msgSend(v8, "listId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "initWithNamedHandle:", v19);
      mailingList = v11->_mailingList;
      v11->_mailingList = (SGSimpleNamedEmailAddress *)v20;

    }
    objc_msgSend(v8, "headers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v11;
    if (v22)
    {
      v23 = (void *)objc_opt_class();
      objc_msgSend(v8, "headers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_hasInhumanHeaders = objc_msgSend(v23, "headerDictionaryContainsInhumanHeaders:", v24);

    }
    else
    {
      v11->_hasInhumanHeaders = 0;
    }

    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v83 = v8;
    objc_msgSend(v8, "headers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v96;
LABEL_11:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v96 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * v29);
        if (!objc_msgSend(CFSTR("message-id"), "compare:options:", v30, 3))
        {
          objc_msgSend(v8, "headers");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "firstObject");
          v33 = objc_claimAutoreleasedReturnValue();
          messageId = v82->_messageId;
          v82->_messageId = (NSString *)v33;

          if (v82->_messageId)
            break;
        }
        if (v27 == ++v29)
        {
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
          if (v27)
            goto LABEL_11;
          break;
        }
      }
    }

    if (!v82->_messageId)
    {
      objc_msgSend(v8, "messageIdentifier");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v82->_messageId;
      v82->_messageId = (NSString *)v35;

    }
    objc_msgSend(v8, "messageIdentifier");
    v37 = objc_claimAutoreleasedReturnValue();
    appleMailMessageId = v82->_appleMailMessageId;
    v82->_appleMailMessageId = (NSString *)v37;

    objc_msgSend(v8, "headers");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("in-reply-to"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
    v41 = objc_claimAutoreleasedReturnValue();
    inReplyTo = v82->_inReplyTo;
    v82->_inReplyTo = (NSString *)v41;

    v43 = objc_alloc(MEMORY[0x1E0D19938]);
    objc_msgSend(v8, "fromHandle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "initWithNamedHandle:", v44);
    from = v82->_from;
    v82->_from = (SGSimpleNamedEmailAddress *)v45;

    objc_msgSend(v8, "toHandles");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "_pas_mappedArrayWithTransform:", &__block_literal_global_219);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)v48;
    v50 = (void *)MEMORY[0x1E0C9AA60];
    if (v48)
      v51 = (void *)v48;
    else
      v51 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v82->_to, v51);

    objc_msgSend(v83, "ccHandles");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "_pas_mappedArrayWithTransform:", &__block_literal_global_220);
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)v53;
    if (v53)
      v55 = (void *)v53;
    else
      v55 = v50;
    objc_storeStrong((id *)&v82->_cc, v55);

    objc_msgSend(v83, "bccHandles");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "_pas_mappedArrayWithTransform:", &__block_literal_global_221);
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v57;
    if (v57)
      v59 = (void *)v57;
    else
      v59 = v50;
    objc_storeStrong((id *)&v82->_bcc, v59);

    objc_msgSend(v83, "mailboxIdentifiers");
    v60 = objc_claimAutoreleasedReturnValue();
    mailboxIdentifiers = v82->_mailboxIdentifiers;
    v82->_mailboxIdentifiers = (NSArray *)v60;

    -[SGMessage setIsSent:](v82, "setIsSent:", -[NSArray containsObject:](v82->_mailboxIdentifiers, "containsObject:", *MEMORY[0x1E0CA5EB8]));
    v82->_isPartiallyDownloaded = objc_msgSend(v83, "isFullyDownloaded") ^ 1;
    objc_msgSend(v83, "headers");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v62, "count"));
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    obj = v62;
    v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    if (v85)
    {
      v84 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v85; ++i)
        {
          if (*(_QWORD *)v92 != v84)
            objc_enumerationMutation(obj);
          v65 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
          v66 = (void *)MEMORY[0x1C3BD4F6C]();
          v87 = 0u;
          v88 = 0u;
          v89 = 0u;
          v90 = 0u;
          objc_msgSend(obj, "objectForKeyedSubscript:", v65);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
          if (v68)
          {
            v69 = v68;
            v70 = *(_QWORD *)v88;
            do
            {
              for (j = 0; j != v69; ++j)
              {
                if (*(_QWORD *)v88 != v70)
                  objc_enumerationMutation(v67);
                v72 = -[SGSimpleMailHeaderKeyValue initWithKey:value:]([SGSimpleMailHeaderKeyValue alloc], "initWithKey:value:", v65, *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j));
                -[NSArray addObject:](v63, "addObject:", v72);

              }
              v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
            }
            while (v69);
          }

          objc_autoreleasePoolPop(v66);
        }
        v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
      }
      while (v85);
    }

    v11 = v82;
    headers = v82->_headers;
    v82->_headers = v63;
    v74 = v63;

    v8 = v83;
    objc_msgSend(v83, "htmlContent");
    v75 = objc_claimAutoreleasedReturnValue();
    htmlContentData = v82->_htmlContentData;
    v82->_htmlContentData = (NSData *)v75;

    objc_storeStrong((id *)&v82->_htmlParser, v79);
    objc_msgSend(v83, "textContent");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setTextContent:](v82, "setTextContent:", v77);

    v10 = v80;
    v9 = v81;
  }

  return v11;
}

- (id)allRecipients
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[SGSimpleMailMessage to](self, "to");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[SGSimpleMailMessage cc](self, "cc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  -[SGSimpleMailMessage bcc](self, "bcc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

- (id)senderDomain
{
  void *v2;
  void *v3;
  void *v4;

  -[SGSimpleMailMessage from](self, "from");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  emailAddressDomain(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasRecipientFromSameDomainAsSender
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SGSimpleMailMessage senderDomain](self, "senderDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SGSimpleMailMessage to](self, "to", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "emailAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        emailAddressDomain(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v3);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)spotlightBundleIdentifier
{
  void *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGSimpleMailMessage;
  -[SGMessage spotlightBundleIdentifier](&v6, sel_spotlightBundleIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)*MEMORY[0x1E0D19A28];
  v4 = v2;

  return v4;
}

- (id)spotlightUniqueIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGSimpleMailMessage;
  -[SGMessage spotlightUniqueIdentifier](&v8, sel_spotlightUniqueIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SGSimpleMailMessage uniqueIdentifier](self, "uniqueIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (id)createNewSearchableItemWithSource:(id)a3 uniqueIdentifier:(id)a4 domainIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
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
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
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
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1C3BD4F6C]();
  v12 = objc_alloc(MEMORY[0x1E0CA6B50]);
  v13 = (void *)objc_msgSend(v12, "initWithContentType:", *MEMORY[0x1E0CEC4D0]);
  -[SGMessage subject](self, "subject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SGMessage subject](self, "subject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSubject:", v15);

  }
  -[SGMessage date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SGMessage date](self, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentCreationDate:", v17);

  }
  -[SGSimpleMailMessage appleMailMessageId](self, "appleMailMessageId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SGSimpleMailMessage appleMailMessageId](self, "appleMailMessageId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMailMessageID:", v19);

  }
  -[SGMessage accountHandles](self, "accountHandles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[SGMessage accountHandles](self, "accountHandles");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccountHandles:", v21);

  }
  -[SGSimpleMailMessage from](self, "from");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[SGSimpleMailMessage from](self, "from");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "name");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    v26 = &stru_1E7DB83A8;
    if (v24)
      v26 = (const __CFString *)v24;
    v50[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAuthorNames:", v27);

    -[SGSimpleMailMessage from](self, "from");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "emailAddress");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    v31 = &stru_1E7DB83A8;
    if (v29)
      v31 = (const __CFString *)v29;
    v49 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAuthorEmailAddresses:", v32);

    -[SGSimpleMailMessage from](self, "from");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "asCSPerson");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAuthors:", v35);

  }
  -[SGSimpleMailMessage to](self, "to");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  sgMapSelector();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPrimaryRecipients:", v37);

  -[SGSimpleMailMessage cc](self, "cc");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  sgMapSelector();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAdditionalRecipients:", v39);

  -[SGSimpleMailMessage bcc](self, "bcc");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  sgMapSelector();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHiddenAdditionalRecipients:", v41);

  -[SGSimpleMailMessage headersDictionary](self, "headersDictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEmailHeaders:", v42);

  if (self->_htmlContentData || self->_htmlBody)
  {
    -[SGSimpleMailMessage htmlContentData](self, "htmlContentData");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHTMLContentData:", v43);
  }
  else
  {
    -[SGSimpleMailMessage body](self, "body");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextContent:", v43);
  }

  if (v8 || (-[SGMessage source](self, "source"), (v8 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v13, "setAccountIdentifier:", v8);

  }
  if (-[SGMessage isSent](self, "isSent"))
  {
    v47 = *MEMORY[0x1E0CA5EB8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMailboxIdentifiers:", v44);

  }
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v9, v10, v13);
  objc_msgSend(v45, "setBundleID:", *MEMORY[0x1E0D19A28]);

  objc_autoreleasePoolPop(v11);
  return v45;
}

- (id)createNewSearchableItem
{
  return -[SGSimpleMailMessage createNewSearchableItemWithSource:uniqueIdentifier:domainIdentifier:](self, "createNewSearchableItemWithSource:uniqueIdentifier:domainIdentifier:", 0, 0, 0);
}

- (id)convertMailMessageToBMMailMessage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  uint64_t v36;
  id v37;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D026B8]);
  objc_msgSend(v3, "from");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "from");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emailAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v4, "initWithName:handleType:handle:contactIdentifier:", v6, 0, v8, 0);

  objc_msgSend(v3, "to");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_236);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v12 = (void *)v10;
  v37 = v12;

  objc_msgSend(v3, "subject");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &stru_1E7DB83A8;
  if (v13)
    v15 = (__CFString *)v13;
  v16 = v15;

  v17 = objc_alloc(MEMORY[0x1E0D02698]);
  objc_msgSend(v3, "uniqueIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "timeIntervalSinceReferenceDate");
  v20 = v19;
  objc_msgSend(v3, "source");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headersDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "htmlContentData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "htmlContentData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    LOBYTE(v33) = 1;
    v26 = (void *)v18;
    v27 = v18;
    v28 = (void *)v36;
    v29 = (void *)objc_msgSend(v17, "initWithUniqueId:domainId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:", v27, 0, v21, v22, v36, v37, v20, 0, 0, v23, v16, v24, 0, v33, 0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0);
  }
  else
  {
    objc_msgSend(v3, "textContent");
    v34 = v16;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v33) = 1;
    v26 = (void *)v18;
    v31 = v18;
    v28 = (void *)v36;
    v29 = (void *)objc_msgSend(v17, "initWithUniqueId:domainId:absoluteTimestamp:accountIdentifier:messageIdentifier:fromHandle:toHandles:ccHandles:bccHandles:headers:subject:htmlContent:textContent:isFullyDownloaded:securityMethod:accountHandles:replyTo:mailboxIdentifiers:listId:accountType:attachments:", v31, 0, v21, v22, v36, v37, v20, 0, 0, v23, v34, v24, v30, v33, 0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0);

    v16 = v34;
  }

  return v29;
}

- (SGSimpleNamedEmailAddress)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (SGSimpleNamedEmailAddress)replyTo
{
  return self->_replyTo;
}

- (void)setReplyTo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSArray)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSArray)cc
{
  return self->_cc;
}

- (void)setCc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSArray)bcc
{
  return self->_bcc;
}

- (void)setBcc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (SGSimpleNamedEmailAddress)forwardedBy
{
  return self->_forwardedBy;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)appleMailMessageId
{
  return self->_appleMailMessageId;
}

- (NSString)inReplyTo
{
  return self->_inReplyTo;
}

- (NSArray)mailboxIdentifiers
{
  return self->_mailboxIdentifiers;
}

- (void)setMailboxIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (HVHtmlParser)htmlParser
{
  return self->_htmlParser;
}

- (BOOL)hasInhumanHeaders
{
  return self->_hasInhumanHeaders;
}

- (void)setHasInhumanHeaders:(BOOL)a3
{
  self->_hasInhumanHeaders = a3;
}

- (BOOL)isPartiallyDownloaded
{
  return self->_isPartiallyDownloaded;
}

- (void)setIsPartiallyDownloaded:(BOOL)a3
{
  self->_isPartiallyDownloaded = a3;
}

- (NSArray)headers
{
  return self->_headers;
}

- (SGSimpleNamedEmailAddress)mailingList
{
  return self->_mailingList;
}

- (void)setMailingList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailingList, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_htmlParser, 0);
  objc_storeStrong((id *)&self->_mailboxIdentifiers, 0);
  objc_storeStrong((id *)&self->_inReplyTo, 0);
  objc_storeStrong((id *)&self->_appleMailMessageId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_forwardedBy, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_replyTo, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_authorCached, 0);
  objc_storeStrong((id *)&self->_hasHumanHeadersCached, 0);
  objc_storeStrong((id *)&self->_quotedRegionsCached, 0);
  objc_storeStrong((id *)&self->_htmlContentDataCached, 0);
  objc_storeStrong((id *)&self->_htmlContentData, 0);
  objc_storeStrong((id *)&self->_htmlBodyCached, 0);
  objc_storeStrong((id *)&self->_htmlBody, 0);
}

id __57__SGSimpleMailMessage_convertMailMessageToBMMailMessage___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0D026B8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithName:handleType:handle:contactIdentifier:", v5, 0, v6, 0);
  return v7;
}

id __77__SGSimpleMailMessage_initWithMailContentEvent_contentProtection_htmlParser___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D19938];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithNamedHandle:", v3);

  return v4;
}

id __77__SGSimpleMailMessage_initWithMailContentEvent_contentProtection_htmlParser___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D19938];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithNamedHandle:", v3);

  return v4;
}

id __77__SGSimpleMailMessage_initWithMailContentEvent_contentProtection_htmlParser___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D19938];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithNamedHandle:", v3);

  return v4;
}

uint64_t __46__SGSimpleMailMessage_initWithSearchableItem___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D19938], "namedEmailAddressWithCSPerson:", a2);
}

uint64_t __46__SGSimpleMailMessage_initWithSearchableItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D19938], "namedEmailAddressWithCSPerson:", a2);
}

uint64_t __46__SGSimpleMailMessage_initWithSearchableItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D19938], "namedEmailAddressWithCSPerson:", a2);
}

id __29__SGSimpleMailMessage_author__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "from");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CA6B10]);
    objc_msgSend(*(id *)(a1 + 32), "from");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGNames cleanName:](SGNames, "cleanName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "from");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emailAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v3, "initWithDisplayName:handles:handleIdentifier:", v6, v9, *MEMORY[0x1E0C966A8]);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL __55__SGSimpleMailMessage_dataDetectorMatchesWithSignature__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchType") == 7;
}

id __38__SGSimpleMailMessage_hasHumanHeaders__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "headers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB37E8];
  if (v1)
    v3 = +[SGInhumans areHumanHeaders:](SGInhumans, "areHumanHeaders:", v1);
  else
    v3 = 0;
  objc_msgSend(v2, "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __48__SGSimpleMailMessage_isInhumanContentNoncached__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  void *v8;
  void *v9;
  BOOL v10;

  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[SGInhumans isInhumanBody:](SGInhumans, "isInhumanBody:", v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
  *a4 = v10;

  objc_autoreleasePoolPop(v8);
}

id __36__SGSimpleMailMessage_quotedRegions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;

  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTimer:", kHarvestMetricsMessageQuotedRegions);

  objc_msgSend(*(id *)(a1 + 32), "htmlParser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "length");
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "messageId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasSuffix:", CFSTR("@email.android.com>"));

    objc_msgSend(*(id *)(a1 + 32), "htmlParser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "quotedRegions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v4, "length"));
    objc_msgSend(v12, "removeIndexes:", v10);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __36__SGSimpleMailMessage_quotedRegions__block_invoke_2;
    v17[3] = &unk_1E7DAB350;
    v18 = v4;
    v20 = v8;
    v13 = v11;
    v19 = v13;
    objc_msgSend(v12, "enumerateRangesUsingBlock:", v17);
    if (v10)
      objc_msgSend(v13, "addIndexes:", v10);
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endTimer:significantWork:", kHarvestMetricsMessageQuotedRegions, objc_msgSend(v14, "count") != 0);

  }
  else
  {
    objc_msgSend(v6, "htmlParser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "quotedRegions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

void __36__SGSimpleMailMessage_quotedRegions__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  v12 = 0;
  v9 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v9);
  +[SGMailQuoteParser quotedRegionsFrom:isAOSPMail:foundToEndOfMessage:](SGMailQuoteParser, "quotedRegionsFrom:isAOSPMail:foundToEndOfMessage:", v10, *(unsigned __int8 *)(a1 + 48), &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "shiftIndexesStartingAtIndex:by:", 0, a2);
  objc_msgSend(*(id *)(a1 + 40), "addIndexes:", v11);
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", a2 + a3, objc_msgSend(*(id *)(a1 + 32), "length") - (a2 + a3));
    *a4 = 1;
  }

  objc_autoreleasePoolPop(v8);
}

id __38__SGSimpleMailMessage_htmlContentData__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = (void *)*MEMORY[0x1E0D81688];
  v3 = v1;

  return v3;
}

__CFString *__31__SGSimpleMailMessage_htmlBody__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v1, 4, 0);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_1E7DB83A8;
  }
  return v2;
}

void __35__SGSimpleMailMessage_asDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D80], "sharedKeySetForKeys:", &unk_1E7E10788);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)asDictionary_sharedKeySet;
  asDictionary_sharedKeySet = v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)headerDictionaryContainsInhumanHeaders:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v8, "lowercaseString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (isInhumanHeader(v10) || (objc_msgSend(v10, "isEqual:", CFSTR("list-unsubscribe")) & 1) != 0)
        {

          objc_autoreleasePoolPop(v9);
          v26 = 1;
          v17 = v3;
          goto LABEL_23;
        }

        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("precedence"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", CFSTR("bulk"));

  if ((v12 & 1) != 0)
    goto LABEL_24;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("auto-submitted"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_13;
  v14 = (void *)v13;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("auto-submitted"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", CFSTR("no"));

  if (!v16)
  {
LABEL_24:
    v26 = 1;
  }
  else
  {
LABEL_13:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("x-email-type-id"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      while (2)
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v21);
          v23 = (void *)MEMORY[0x1C3BD4F6C](v18);
          objc_msgSend(v22, "lowercaseString", (_QWORD)v28);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "hasPrefix:", CFSTR("pp"));

          objc_autoreleasePoolPop(v23);
          if ((v25 & 1) != 0)
          {
            v26 = 1;
            goto LABEL_27;
          }
          ++v21;
        }
        while (v19 != v21);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        v19 = v18;
        if (v18)
          continue;
        break;
      }
    }
    v26 = 0;
LABEL_27:

LABEL_23:
  }

  return v26;
}

+ (BOOL)headersContainInhumanOnes:(id)a3 keys:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1C3BD4F6C](v7);
        objc_msgSend(v11, "lowercaseString", (_QWORD)v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (isInhumanHeader(v13) || (objc_msgSend(v13, "isEqual:", CFSTR("list-unsubscribe")) & 1) != 0)
        {

          objc_autoreleasePoolPop(v12);
          v17 = 1;
          goto LABEL_20;
        }

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }

  v14 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v5, "hv_firstHeaderForKey:", CFSTR("precedence"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && (objc_msgSend(v15, "isEqualToString:", CFSTR("bulk")) & 1) != 0)
  {
    v17 = 1;
  }
  else
  {
    objc_msgSend(v5, "hv_firstHeaderForKey:", CFSTR("auto-submitted"), (_QWORD)v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 && !objc_msgSend(v18, "isEqualToString:", CFSTR("no")))
    {
      v17 = 1;
    }
    else
    {
      objc_msgSend(v5, "hv_firstHeaderForKey:", CFSTR("x-email-type-id"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lowercaseString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v21, "hasPrefix:", CFSTR("pp"));
    }

  }
  objc_autoreleasePoolPop(v14);
LABEL_20:

  return v17;
}

+ (id)subjectByCleaningPrefixesInSubject:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;

  v3 = a3;
  v4 = 0;
  if (objc_msgSend(v3, "length"))
  {
    while (1)
    {
      v5 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR(":"), 0, v4, objc_msgSend(v3, "length") - v4);
      if (v5 == 0x7FFFFFFFFFFFFFFFLL || v5 - v4 > 6)
        break;
      v7 = v5;
      v8 = (void *)MEMORY[0x1C3BD4F6C]();
      v4 = v7 + 1;
      if (v7 + 1 < (unint64_t)objc_msgSend(v3, "length"))
      {
        if (subjectByCleaningPrefixesInSubject___pasOnceToken9 != -1)
          dispatch_once(&subjectByCleaningPrefixesInSubject___pasOnceToken9, &__block_literal_global_232);
        v9 = (id)subjectByCleaningPrefixesInSubject___pasExprOnceResult;
        v4 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v9, 0, v7 + 1, objc_msgSend(v3, "length") + ~v7);

        if (v4 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v4 = objc_msgSend(v3, "length");
          objc_autoreleasePoolPop(v8);
          break;
        }
      }
      objc_autoreleasePoolPop(v8);
    }
  }
  if (objc_msgSend(v3, "length") <= v4)
  {
    v11 = &stru_1E7DB83A8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v3, "substringFromIndex:", v4);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v10);
  }

  return v11;
}

void __58__SGSimpleMailMessage_subjectByCleaningPrefixesInSubject___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)subjectByCleaningPrefixesInSubject___pasExprOnceResult;
  subjectByCleaningPrefixesInSubject___pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

- (NSString)messageIdWithoutBrackets
{
  void *v3;
  void *v4;

  -[SGSimpleMailMessage messageId](self, "messageId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSimpleMailMessage removeBrackets:](self, "removeBrackets:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)removeBrackets:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR(">"));
  v5 = v3;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    v7 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("<"), 4, 0, v4);
    v5 = v3;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v3, "substringWithRange:", v7 + 1, v6 - (v7 + 1));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

@end
