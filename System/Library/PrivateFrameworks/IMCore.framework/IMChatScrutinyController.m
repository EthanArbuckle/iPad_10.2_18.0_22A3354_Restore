@implementation IMChatScrutinyController

+ (id)sharedController
{
  if (qword_1ECF12450 != -1)
    dispatch_once(&qword_1ECF12450, &unk_1E471DBB8);
  return (id)qword_1ECF12438;
}

- (void)markMessageAsCorrupt:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markMessageAsCorrupt:setCorrupt:", v3, 1);

}

- (void)markMessageAsNotCorrupt:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markMessageAsCorrupt:setCorrupt:", v3, 0);

}

- (double)_maxDurationForScrutinyMode
{
  return 300.0;
}

- (id)transcriptRenderingMetadataForChatIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMChatScrutinyController scrutinyInfo](self, "scrutinyInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v4);

    if (v7)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("latime"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;

      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      if (v10 <= 0.0
        || (v12 = v11,
            -[IMChatScrutinyController _maxDurationForScrutinyMode](self, "_maxDurationForScrutinyMode"),
            v12 >= v10)
        && v12 - v10 <= v13)
      {
        v14 = v5;
LABEL_10:

        goto LABEL_11;
      }
      -[IMChatScrutinyController setTranscriptRenderingMetadata:forChatIdentifier:](self, "setTranscriptRenderingMetadata:forChatIdentifier:", 0, v4);
    }
    v14 = 0;
    goto LABEL_10;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)scrutinyInfo
{
  return (id)IMGetCachedDomainValueForKey();
}

- (void)setTranscriptRenderingMetadata:(id)a3 forChatIdentifier:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (v5
    && (objc_msgSend(v11, "allKeys"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7))
  {
    v8 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("cid"));
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("latime"));

  }
  else
  {
    v8 = 0;
  }
  IMSetDomainValueForKey();

}

@end
