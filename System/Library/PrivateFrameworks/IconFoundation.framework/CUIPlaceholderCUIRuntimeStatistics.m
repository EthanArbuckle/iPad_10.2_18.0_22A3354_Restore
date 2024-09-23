@implementation CUIPlaceholderCUIRuntimeStatistics

+ (id)sharedRuntimeStatistics
{
  if (__once != -1)
    dispatch_once(&__once, &__block_literal_global_13);
  return (id)__sharedInstance;
}

CUIPlaceholderCUIRuntimeStatistics *__61__CUIPlaceholderCUIRuntimeStatistics_sharedRuntimeStatistics__block_invoke()
{
  CUIPlaceholderCUIRuntimeStatistics *result;

  result = objc_alloc_init(CUIPlaceholderCUIRuntimeStatistics);
  __sharedInstance = (uint64_t)result;
  return result;
}

- (CUIPlaceholderCUIRuntimeStatistics)init
{
  CUIPlaceholderCUIRuntimeStatistics *v2;
  NSObject *v3;
  _QWORD handler[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPlaceholderCUIRuntimeStatistics;
  v2 = -[CUIPlaceholderCUIRuntimeStatistics init](&v6, sel_init);
  v3 = dispatch_queue_create("com.apple.coreui.statistics", 0);
  v2->_queue = (OS_dispatch_queue *)v3;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __42__CUIPlaceholderCUIRuntimeStatistics_init__block_invoke;
  handler[3] = &unk_1E9768900;
  handler[4] = v2;
  notify_register_dispatch("com.apple.coreui.statistics", &v2->_notify_token, v3, handler);
  return v2;
}

unint64_t *__42__CUIPlaceholderCUIRuntimeStatistics_init__block_invoke(uint64_t a1)
{
  return -[CUIPlaceholderCUIRuntimeStatistics _logStatistics:](*(unint64_t **)(a1 + 32));
}

- (unint64_t)_logStatistics:(unint64_t *)result
{
  unint64_t *v1;

  if (result)
  {
    v1 = result;
    atomic_load(result + 1);
    atomic_load(result + 2);
    atomic_load(result + 3);
    atomic_load(result + 4);
    atomic_load(result + 6);
    atomic_load(result + 5);
    atomic_load(result + 7);
    result = (unint64_t *)_CUILog();
    atomic_store(0, v1 + 6);
    atomic_store(0, v1 + 5);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notify_token);
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)CUIPlaceholderCUIRuntimeStatistics;
  -[CUIPlaceholderCUIRuntimeStatistics dealloc](&v3, sel_dealloc);
}

+ (void)generateLog
{
  notify_post("com.apple.coreui.statistics");
}

- (void)addStatisticAllocatedImageSize:(unint64_t)a3 roundedSize:(unint64_t)a4
{
  int64_t *p_wasted_size;
  unint64_t v5;
  int64_t *p_total_size;
  unint64_t v7;

  p_wasted_size = &self->_wasted_size;
  do
    v5 = __ldaxr((unint64_t *)p_wasted_size);
  while (__stlxr(v5 + a4 - a3, (unint64_t *)p_wasted_size));
  p_total_size = &self->_total_size;
  do
    v7 = __ldaxr((unint64_t *)p_total_size);
  while (__stlxr(v7 + a4, (unint64_t *)p_total_size));
}

- (void)incrementStatisticDidShortCircuitImageLookup
{
  int64_t *p_shortCircuitImageLookup;
  unint64_t v3;

  p_shortCircuitImageLookup = &self->_shortCircuitImageLookup;
  do
    v3 = __ldaxr((unint64_t *)p_shortCircuitImageLookup);
  while (__stlxr(v3 + 1, (unint64_t *)p_shortCircuitImageLookup));
}

- (void)incrementStatisticLookup
{
  int64_t *p_total_lookup;
  unint64_t v3;

  p_total_lookup = &self->_total_lookup;
  do
    v3 = __ldaxr((unint64_t *)p_total_lookup);
  while (__stlxr(v3 + 1, (unint64_t *)p_total_lookup));
}

- (void)incrementStaticsInitialLookup
{
  int64_t *p_total_initial_lookups;
  unint64_t v3;

  p_total_initial_lookups = &self->_total_initial_lookups;
  do
    v3 = __ldaxr((unint64_t *)p_total_initial_lookups);
  while (__stlxr(v3 + 1, (unint64_t *)p_total_initial_lookups));
}

- (void)incrementStaticsProbe
{
  int64_t *p_total_probes;
  unint64_t v3;

  p_total_probes = &self->_total_probes;
  do
    v3 = __ldaxr((unint64_t *)p_total_probes);
  while (__stlxr(v3 + 1, (unint64_t *)p_total_probes));
}

- (int64_t)shortCircuitImageLookup
{
  return atomic_load((unint64_t *)&self->_shortCircuitImageLookup);
}

- (void)incrementMissedLookup
{
  int64_t *p_missed_lookup;
  unint64_t v3;

  p_missed_lookup = &self->_missed_lookup;
  do
    v3 = __ldaxr((unint64_t *)p_missed_lookup);
  while (__stlxr(v3 + 1, (unint64_t *)p_missed_lookup));
}

@end
