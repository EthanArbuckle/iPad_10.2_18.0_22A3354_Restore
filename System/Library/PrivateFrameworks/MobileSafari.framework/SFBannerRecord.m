@implementation SFBannerRecord

- (SFBannerRecord)initWithProductID:(id)a3 time:(id)a4
{
  id v6;
  id v7;
  SFBannerRecord *v8;
  SFBannerRecord *v9;
  SFBannerRecord *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFBannerRecord;
  v8 = -[SFBannerRecord init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SFBannerRecord updateProductID:time:](v8, "updateProductID:time:", v6, v7);
    v10 = v9;
  }

  return v9;
}

- (BOOL)updateProductID:(id)a3 time:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *updatedProductIDs;
  long double v9;
  NSDate **p_lastUpdateTime;
  NSMutableArray *v11;
  NSMutableArray *v12;
  BOOL v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  updatedProductIDs = self->_updatedProductIDs;
  if (!updatedProductIDs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_updatedProductIDs;
    self->_updatedProductIDs = v11;

    -[NSMutableArray addObject:](self->_updatedProductIDs, "addObject:", v6);
    p_lastUpdateTime = &self->_lastUpdateTime;
    goto LABEL_7;
  }
  if ((-[NSMutableArray containsObject:](updatedProductIDs, "containsObject:", v6) & 1) != 0)
  {
LABEL_8:
    v13 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v7, "timeIntervalSinceDate:", self->_lastUpdateTime);
  if (v9 >= exp2((double)(unint64_t)(-[NSMutableArray count](self->_updatedProductIDs, "count") - 1)) * 30.0
    && (unint64_t)-[NSMutableArray count](self->_updatedProductIDs, "count") <= 3)
  {
    -[NSMutableArray addObject:](self->_updatedProductIDs, "addObject:", v6);
    p_lastUpdateTime = &self->_lastUpdateTime;
LABEL_7:
    objc_storeStrong((id *)p_lastUpdateTime, a4);
    goto LABEL_8;
  }
  v14 = WBS_LOG_CHANNEL_PREFIXBanners();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SFBannerRecord updateProductID:time:].cold.1(v14);
  v13 = 0;
LABEL_12:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_updatedProductIDs, 0);
}

- (void)updateProductID:(os_log_t)log time:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18B7B2000, log, OS_LOG_TYPE_ERROR, "Not showing banner because the Web Site tries to show different productIDs.", v1, 2u);
}

@end
