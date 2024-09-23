@implementation FHTripEvent

- (FHTripEvent)initWithPPTripEvent:(id)a3
{
  id v4;
  FHTripEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  FHTripPart *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FHTripEvent;
  v5 = -[FHTripEvent init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTripEvent setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTripEvent setStartDate:](v5, "setStartDate:", v7);

    objc_msgSend(v4, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHTripEvent setEndDate:](v5, "setEndDate:", v8);

    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "tripParts", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = -[FHTripPart initWithPPTripPart:]([FHTripPart alloc], "initWithPPTripPart:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14));
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

    v16 = (void *)objc_msgSend(v9, "copy");
    -[FHTripEvent setTripParts:](v5, "setTripParts:", v16);

  }
  return v5;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("title"), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("startDate"), self->_startDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("endDate"), self->_endDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("tripParts"), self->_tripParts);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSArray)tripParts
{
  return self->_tripParts;
}

- (void)setTripParts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_tripParts, 0);
}

@end
