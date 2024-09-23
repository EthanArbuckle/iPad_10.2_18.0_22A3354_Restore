@implementation FPFSTapToRadarManager

- (FPFSTapToRadarManager)init
{
  FPFSTapToRadarManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *executionQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FPFSTapToRadarManager;
  v2 = -[FPFSTapToRadarManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.fileprovider.ttr-queue", v3);
    executionQueue = v2->_executionQueue;
    v2->_executionQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 displayReason:(id)a7
{
  -[FPFSTapToRadarManager requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:displayReason:](self, "requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:displayReason:", a3, a4, CFSTR("FileProvider"), CFSTR("All"), 581581, a5, a6, a7);
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 displayReason:(id)a10
{
  NSObject *v10;

  if ((os_variant_has_internal_content() & 1) == 0)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[FPFSTapToRadarManager requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:displayReason:].cold.1(v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionQueue, 0);
}

- (void)requestTapToRadarWithTitle:(os_log_t)log description:componentName:componentVersion:componentID:keywords:attachments:displayReason:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Not internal build, ignoring tap to radar request", v1, 2u);
}

@end
