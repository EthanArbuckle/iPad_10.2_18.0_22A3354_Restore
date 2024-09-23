@implementation ENExposureDetectionHistoryCheck

- (ENExposureDetectionHistoryCheck)init
{
  ENExposureDetectionHistoryCheck *v2;
  ENExposureDetectionHistoryCheck *v3;
  NSArray *files;
  ENExposureDetectionHistoryCheck *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ENExposureDetectionHistoryCheck;
  v2 = -[ENExposureDetectionHistoryCheck init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    files = v2->_files;
    v2->_files = (NSArray *)MEMORY[0x24BDBD1A8];

    v5 = v3;
  }

  return v3;
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ENExposureDetectionHistorySession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_files, 0);
}

@end
