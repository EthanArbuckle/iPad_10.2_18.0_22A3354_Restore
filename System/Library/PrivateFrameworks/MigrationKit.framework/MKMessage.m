@implementation MKMessage

- (MKMessage)initWithData:(id)a3
{
  id v4;
  MKMessage *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MKMessage *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  id v35;
  id v36;
  MKMessage *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  MKMessageAttachment *v51;
  NSString *body;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  unint64_t v60;
  void *v61;
  const __CFString *sender;
  void *v63;
  void *v64;
  void *v65;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  MKMessage *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  objc_super v86;
  _BYTE v87[128];
  void *v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)MKMessage;
  v5 = -[MKMessage init](&v86, sel_init);
  if (!v5)
    goto LABEL_80;
  v85 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v85);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v85;
  if (!v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MKAccount initWithData:].cold.1((uint64_t)v5, v8);
      goto LABEL_28;
    }
    v9 = v6;
    objc_msgSend(v9, "mk_numberForKey:", CFSTR("is_sent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessage setIsSent:](v5, "setIsSent:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v9, "mk_numberForKey:", CFSTR("is_read"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessage setIsRead:](v5, "setIsRead:", objc_msgSend(v11, "BOOLValue"));

    objc_msgSend(v9, "mk_numberForKey:", CFSTR("is_normalized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessage setIsNormalized:](v5, "setIsNormalized:", objc_msgSend(v12, "BOOLValue"));

    v13 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v9, "mk_numberForKey:", CFSTR("date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessage setDate:](v5, "setDate:", v15);

    -[NSDate timeIntervalSinceReferenceDate](v5->_date, "timeIntervalSinceReferenceDate");
    -[MKMessage setTimestampInSeconds:](v5, "setTimestampInSeconds:", (uint64_t)v16);
    -[NSDate timeIntervalSinceReferenceDate](v5->_date, "timeIntervalSinceReferenceDate");
    -[MKMessage setTimestampInNanoseconds:](v5, "setTimestampInNanoseconds:", (uint64_t)(v17 * 1000000000.0));
    objc_msgSend(v9, "mk_stringForKey:", CFSTR("id"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessage setID:](v5, "setID:", v18);

    objc_msgSend(v9, "mk_stringForKey:", CFSTR("thread_id"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessage setThreadID:](v5, "setThreadID:", v19);

    objc_msgSend(v9, "mk_stringForKey:", CFSTR("sender"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessage setSender:](v5, "setSender:", v20);

    if (!v5->_isNormalized)
    {
      +[MKMessagePhoneNumber addCountryCallingCode:](MKMessagePhoneNumber, "addCountryCallingCode:", v5->_sender);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMessage setSender:](v5, "setSender:", v21);

    }
    objc_msgSend(v9, "mk_stringForKey:", CFSTR("subject"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessage setSubject:](v5, "setSubject:", v22);

    objc_msgSend(v9, "mk_stringForKey:", CFSTR("body"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMessage setBody:](v5, "setBody:", v23);

    if (!v5->_body)
      -[MKMessage setBody:](v5, "setBody:", &stru_24E35A3B8);
    objc_msgSend(v9, "objectForKey:", CFSTR("recipients"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v69 = v9;
        v71 = v4;
        v25 = v5;
        v26 = v24;
        v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v28 = v26;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
        if (v29)
        {
          v30 = v29;
          v31 = 0;
          v32 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v82 != v32)
                objc_enumerationMutation(v28);
              v34 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v34, "length"))
              {
                if (v25->_isNormalized)
                {
                  v35 = v34;
                }
                else
                {
                  +[MKMessagePhoneNumber addCountryCallingCode:](MKMessagePhoneNumber, "addCountryCallingCode:", v34);
                  v35 = (id)objc_claimAutoreleasedReturnValue();
                }
                v36 = v35;

                objc_msgSend(v27, "addObject:", v36);
                v31 = v36;
              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
          }
          while (v30);
        }
        else
        {
          v31 = 0;
        }

        v5 = v25;
        -[MKMessage setRecipients:](v25, "setRecipients:", v27);

        v9 = v69;
        v4 = v71;
      }
    }
    if (v5->_isSent)
    {
      if (!-[NSArray count](v5->_recipients, "count"))
      {
        if (-[NSString length](v5->_sender, "length"))
        {
          v38 = (void *)-[NSString copy](v5->_sender, "copy");
          v88 = v38;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v88, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKMessage setRecipients:](v5, "setRecipients:", v39);

          goto LABEL_39;
        }
LABEL_40:
        objc_msgSend(v9, "objectForKey:", CFSTR("attachments"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v68 = v24;
            v70 = v9;
            v76 = v5;
            v72 = v4;
            v74 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v67 = v40;
            v41 = v40;
            v73 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v77 = 0u;
            v78 = 0u;
            v79 = 0u;
            v80 = 0u;
            v42 = v41;
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
            if (!v43)
              goto LABEL_59;
            v44 = v43;
            v45 = *(_QWORD *)v78;
            v75 = v42;
            while (1)
            {
              for (j = 0; j != v44; ++j)
              {
                if (*(_QWORD *)v78 != v45)
                  objc_enumerationMutation(v42);
                v47 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
                objc_msgSend(v47, "mk_stringForKey:", CFSTR("id"), v67);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "mk_stringForKey:", CFSTR("content_type"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "mk_stringForKey:", CFSTR("data"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v48, "length")
                  && objc_msgSend(v49, "length")
                  && objc_msgSend(v50, "length")
                  && (objc_msgSend(v49, "isEqualToString:", CFSTR("application/smil")) & 1) == 0)
                {
                  if (objc_msgSend(v49, "isEqualToString:", CFSTR("text/plain")))
                  {
                    v51 = (MKMessageAttachment *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v50, 0);
                    body = v76->_body;
                    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v51, 4);
                    -[NSString stringByAppendingString:](body, "stringByAppendingString:", v53);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    v42 = v75;
                    -[MKMessage setBody:](v76, "setBody:", v54);

                    goto LABEL_55;
                  }
                  v51 = -[MKMessageAttachment initWithID:contentType:base64Data:]([MKMessageAttachment alloc], "initWithID:contentType:base64Data:", v48, v49, v50);
                  if (v51)
                  {
                    objc_msgSend(v74, "addObject:", v51);
                    -[MKMessageAttachment UUID](v51, "UUID");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "addObject:", v53);
LABEL_55:

                  }
                }

              }
              v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
              if (!v44)
              {
LABEL_59:

                v5 = v76;
                -[MKMessage setAttachments:](v76, "setAttachments:", v74);
                v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v76->_body);
                v56 = (void *)IMCreateSuperFormatStringWithAppendedFileTransfers();

                objc_msgSend(MEMORY[0x24BDD1440], "archivedDataWithRootObject:", v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                -[MKMessage setAttributedBody:](v76, "setAttributedBody:", v57);

                v9 = v70;
                v4 = v72;
                v40 = v67;
                v24 = v68;
                break;
              }
            }
          }
        }
        v58 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        -[MKMessage recipients](v5, "recipients");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "count");

        if (v60 >= 2)
        {
          if (-[NSString length](v5->_sender, "length"))
            objc_msgSend(v58, "addObject:", v5->_sender);
          objc_msgSend(v58, "addObjectsFromArray:", v5->_recipients, v67);
LABEL_71:
          if (objc_msgSend(v58, "count", v67))
            -[MKMessage setHandles:](v5, "setHandles:", v58);
          if (v5->_isSent)
          {
            sender = (const __CFString *)v5->_sender;
          }
          else
          {
            if (-[NSArray count](v5->_recipients, "count") == 1)
            {
              -[NSArray objectAtIndexedSubscript:](v5->_recipients, "objectAtIndexedSubscript:", 0);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              -[MKMessage setAccount:](v5, "setAccount:", v63);

LABEL_79:
              objc_msgSend(MEMORY[0x24BDD1880], "UUID");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "UUIDString");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              -[MKMessage setUUID:](v5, "setUUID:", v65);

LABEL_80:
              v37 = v5;
              goto LABEL_81;
            }
            sender = &stru_24E35A3B8;
          }
          -[MKMessage setAccount:](v5, "setAccount:", sender);
          goto LABEL_79;
        }
        if (-[NSArray count](v5->_recipients, "count") == 1)
        {
          if (v5->_isSent || !-[NSString length](v5->_sender, "length"))
          {
            -[NSArray objectAtIndexedSubscript:](v5->_recipients, "objectAtIndexedSubscript:", 0, v67);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "addObject:", v61);

            goto LABEL_71;
          }
        }
        else if (!-[NSString length](v5->_sender, "length"))
        {
          goto LABEL_71;
        }
        objc_msgSend(v58, "addObject:", v5->_sender, v67);
        goto LABEL_71;
      }
      if (v5->_isSent)
        goto LABEL_40;
    }
    if (!-[NSString length](v5->_sender, "length") && -[NSArray count](v5->_recipients, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](v5->_recipients, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMessage setSender:](v5, "setSender:", v38);
LABEL_39:

      goto LABEL_40;
    }
    goto LABEL_40;
  }
  +[MKLog log](MKLog, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MKAccount initWithData:].cold.2((uint64_t)v5, (uint64_t)v7, v8);
LABEL_28:

  v37 = 0;
LABEL_81:

  return v37;
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void)setIsSent:(BOOL)a3
{
  self->_isSent = a3;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (void)setIsRead:(BOOL)a3
{
  self->_isRead = a3;
}

- (BOOL)isNormalized
{
  return self->_isNormalized;
}

- (void)setIsNormalized:(BOOL)a3
{
  self->_isNormalized = a3;
}

- (int64_t)timestampInSeconds
{
  return self->_timestampInSeconds;
}

- (void)setTimestampInSeconds:(int64_t)a3
{
  self->_timestampInSeconds = a3;
}

- (int64_t)timestampInNanoseconds
{
  return self->_timestampInNanoseconds;
}

- (void)setTimestampInNanoseconds:(int64_t)a3
{
  self->_timestampInNanoseconds = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)attributedBody
{
  return self->_attributedBody;
}

- (void)setAttributedBody:(id)a3
{
  objc_storeStrong((id *)&self->_attributedBody, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_storeStrong((id *)&self->_handles, a3);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (int64_t)chatStyle
{
  return self->_chatStyle;
}

- (void)setChatStyle:(int64_t)a3
{
  self->_chatStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_attributedBody, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_ID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
