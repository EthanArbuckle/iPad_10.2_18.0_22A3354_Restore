@implementation CLKCComplicationDataSource

+ (int64_t)tritiumUpdatePriority
{
  return 0;
}

- (CLKCComplicationDataSource)init
{
  CLKCComplicationDataSource *v2;
  uint64_t v3;
  CLKCComplicationDataSourceContext *context;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKCComplicationDataSource;
  v2 = -[CLKCComplicationDataSource init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    context = v2->_context;
    v2->_context = (CLKCComplicationDataSourceContext *)v3;

  }
  return v2;
}

- (CLKCComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v9;
  id v10;
  CLKCComplicationDataSource *v11;
  CLKCComplicationDataSource *v12;
  uint64_t v13;
  CLKCComplicationDataSourceContext *context;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CLKCComplicationDataSource;
  v11 = -[CLKCComplicationDataSource init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_complication, a3);
    v12->_family = a4;
    objc_storeStrong((id *)&v12->_device, a5);
    v13 = objc_opt_new();
    context = v12->_context;
    v12->_context = (CLKCComplicationDataSourceContext *)v13;

  }
  return v12;
}

- (CLKCComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5 context:(id)a6
{
  id v11;
  CLKCComplicationDataSource *v12;
  CLKCComplicationDataSource *v13;

  v11 = a6;
  v12 = -[CLKCComplicationDataSource initWithComplication:family:forDevice:](self, "initWithComplication:family:forDevice:", a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_context, a6);

  return v13;
}

- (unint64_t)timelineAnimationBehavior
{
  return 0;
}

- (BOOL)supportsTapAction
{
  return 1;
}

+ (BOOL)hasSensitiveUI
{
  return 0;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (BOOL)alwaysShowIdealizedTemplateInSwitcher
{
  return 0;
}

- (id)complicationApplicationIdentifier
{
  return 0;
}

- (id)sampleTemplate
{
  return 0;
}

- (id)lockedTemplate
{
  return 0;
}

- (id)privacyTemplate
{
  return 0;
}

- (id)alwaysOnTemplate
{
  return 0;
}

+ (BOOL)wantsToSkipPauseWhenEnteringTritium
{
  return 0;
}

- (void)getTimelineEndDateWithHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (CLKCComplication)complication
{
  return self->_complication;
}

- (int64_t)family
{
  return self->_family;
}

- (CLKDevice)device
{
  return self->_device;
}

- (CLKCComplicationDataSourceContext)context
{
  return self->_context;
}

- (CLKCComplicationDataSourceDelegate)delegate
{
  return (CLKCComplicationDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_complication, 0);
}

- (id)currentSwitcherTemplate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  NSRequestConcreteImplementation();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C94158]), "initPrivate");
}

- (void)getSupportedTimeTravelDirectionsWithHandler:(id)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
}

- (void)getTimelineStartDateWithHandler:(id)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
}

- (void)getTimelineEntriesBeforeDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
}

- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
}

- (void)getDesiredUpdateIntervalWithHandler:(id)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
}

@end
