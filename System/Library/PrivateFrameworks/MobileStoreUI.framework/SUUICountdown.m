@implementation SUUICountdown

- (SUUICountdown)initWithCountdownDictionary:(id)a3
{
  id v4;
  SUUICountdown *v5;
  SUUICountdown *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
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
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SUUICountdown;
  v5 = -[SUUICountdown init](&v43, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_44;
  -[SUUICountdown setType:](v5, "setType:", 1);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICountdown setEndDate:](v6, "setEndDate:", v7);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICountdown setStartDate:](v6, "setStartDate:", v8);

  -[SUUICountdown setFlapped:](v6, "setFlapped:", 1);
  -[SUUICountdown setRate:](v6, "setRate:", 1);
  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("number")) & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("timer")))
        goto LABEL_8;
      v10 = 1;
    }
    -[SUUICountdown setType:](v6, "setType:", v10);
  }
LABEL_8:
  objc_msgSend(v4, "objectForKey:", CFSTR("subType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("number")) & 1) != 0)
    {
      v12 = 0;
LABEL_13:
      -[SUUICountdown setType:](v6, "setType:", v12);
      goto LABEL_14;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("timer")))
    {
      v12 = 1;
      goto LABEL_13;
    }
  }
LABEL_14:
  objc_msgSend(v4, "objectForKey:", CFSTR("endDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v14, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"));
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTimeZone:", v15);

    objc_msgSend(v14, "dateFromString:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      -[SUUICountdown setEndDate:](v6, "setEndDate:", v16);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("dateFormat"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("dhms"));
    v19 = objc_msgSend(v17, "isEqualToString:", CFSTR("dhm"));
    v20 = objc_msgSend(v17, "isEqualToString:", CFSTR("hms"));
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("hm")) | v20 | v19 | v18)
      v21 = 3;
    else
      v21 = 0;
    -[SUUICountdown setDateFormat:](v6, "setDateFormat:", v21);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("numberFormat"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUUICountdown setNumberFormat:](v6, "setNumberFormat:", v22);
  objc_msgSend(v4, "objectForKey:", CFSTR("endValue"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUUICountdown numberFormat](v6, "numberFormat");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      -[SUUICountdown numberFormat](v6, "numberFormat");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPositiveFormat:", v26);

      objc_msgSend(v25, "numberFromString:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
        -[SUUICountdown setFinalValue:](v6, "setFinalValue:", objc_msgSend(v27, "longLongValue"));

    }
  }
  if (!-[SUUICountdown finalValue](v6, "finalValue") && (objc_opt_respondsToSelector() & 1) != 0)
    -[SUUICountdown setFinalValue:](v6, "setFinalValue:", objc_msgSend(v23, "longLongValue"));
  objc_msgSend(v4, "objectForKey:", CFSTR("url"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICountdown setURL:](v6, "setURL:", v30);

  }
  -[SUUICountdown updateWithDictionary:](v6, "updateWithDictionary:", v4);
  objc_msgSend(v4, "objectForKey:", CFSTR("fontColor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    SUUIColorWithHTMLCode(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICountdown setFontColor:](v6, "setFontColor:", v32);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("flapTopColor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    SUUIColorWithHTMLCode(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICountdown setFlapTopColor:](v6, "setFlapTopColor:", v34);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("flapBottomColor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    SUUIColorWithHTMLCode(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICountdown setFlapBottomColor:](v6, "setFlapBottomColor:", v36);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("flapped"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUUICountdown setFlapped:](v6, "setFlapped:", objc_msgSend(v37, "BOOLValue"));
  objc_msgSend(v4, "objectForKey:", CFSTR("artwork"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:](SUUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICountdown setArtworkProvider:](v6, "setArtworkProvider:", v39);

  objc_msgSend(v4, "objectForKey:", CFSTR("endArtwork"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:](SUUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICountdown setEndArtworkProvider:](v6, "setEndArtworkProvider:", v41);

LABEL_44:
  return v6;
}

- (void)updateWithDictionary:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "objectForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) != 0)
    -[SUUICountdown setInitialValue:](self, "setInitialValue:", objc_msgSend(v4, "longLongValue"));
  objc_msgSend(v11, "objectForKey:", CFSTR("rate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUUICountdown setRate:](self, "setRate:", objc_msgSend(v6, "integerValue"));
  else
    v5 = 0;
  objc_msgSend(v11, "objectForKey:", CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"));
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZone:", v9);

    objc_msgSend(v8, "dateFromString:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[SUUICountdown setStartDate:](self, "setStartDate:", v10);
    else
      v5 = 0;

  }
  if ((v5 & 1) != 0 && !self->_isLoaded)
    self->_isLoaded = 1;

}

- (BOOL)isLoaded
{
  return -[SUUICountdown type](self, "type") || self->_isLoaded;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)dateFormat
{
  return self->_dateFormat;
}

- (void)setDateFormat:(unint64_t)a3
{
  self->_dateFormat = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)initialValue
{
  return self->_initialValue;
}

- (void)setInitialValue:(int64_t)a3
{
  self->_initialValue = a3;
}

- (int64_t)finalValue
{
  return self->_finalValue;
}

- (void)setFinalValue:(int64_t)a3
{
  self->_finalValue = a3;
}

- (int64_t)rate
{
  return self->_rate;
}

- (void)setRate:(int64_t)a3
{
  self->_rate = a3;
}

- (NSString)numberFormat
{
  return self->_numberFormat;
}

- (void)setNumberFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIColor)fontColor
{
  return self->_fontColor;
}

- (void)setFontColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIColor)flapTopColor
{
  return self->_flapTopColor;
}

- (void)setFlapTopColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIColor)flapBottomColor
{
  return self->_flapBottomColor;
}

- (void)setFlapBottomColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isFlapped
{
  return self->_flapped;
}

- (void)setFlapped:(BOOL)a3
{
  self->_flapped = a3;
}

- (SUUIArtworkProviding)artworkProvider
{
  return self->_artworkProvider;
}

- (void)setArtworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_artworkProvider, a3);
}

- (SUUIArtworkProviding)endArtworkProvider
{
  return self->_endArtworkProvider;
}

- (void)setEndArtworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_endArtworkProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endArtworkProvider, 0);
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_flapBottomColor, 0);
  objc_storeStrong((id *)&self->_flapTopColor, 0);
  objc_storeStrong((id *)&self->_fontColor, 0);
  objc_storeStrong((id *)&self->_numberFormat, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
