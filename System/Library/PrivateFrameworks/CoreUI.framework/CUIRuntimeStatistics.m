@implementation CUIRuntimeStatistics

+ (id)sharedRuntimeStatistics
{
  if (__once != -1)
    dispatch_once(&__once, &__block_literal_global_4);
  return (id)__sharedInstance;
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

- (void)incrementStatisticDidShortCircuitImageLookup
{
  int64_t *p_shortCircuitImageLookup;
  unint64_t v3;

  p_shortCircuitImageLookup = &self->_shortCircuitImageLookup;
  do
    v3 = __ldaxr((unint64_t *)p_shortCircuitImageLookup);
  while (__stlxr(v3 + 1, (unint64_t *)p_shortCircuitImageLookup));
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

- (void)incrementMissedLookup
{
  int64_t *p_missed_lookup;
  unint64_t v3;

  p_missed_lookup = &self->_missed_lookup;
  do
    v3 = __ldaxr((unint64_t *)p_missed_lookup);
  while (__stlxr(v3 + 1, (unint64_t *)p_missed_lookup));
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

CUIRuntimeStatistics *__47__CUIRuntimeStatistics_sharedRuntimeStatistics__block_invoke()
{
  CUIRuntimeStatistics *result;

  result = objc_alloc_init(CUIRuntimeStatistics);
  __sharedInstance = (uint64_t)result;
  return result;
}

- (CUIRuntimeStatistics)init
{
  CUIRuntimeStatistics *v2;
  NSObject *v3;
  _QWORD handler[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIRuntimeStatistics;
  v2 = -[CUIRuntimeStatistics init](&v6, sel_init);
  v3 = dispatch_queue_create("com.apple.coreui.statistics", 0);
  v2->_queue = (OS_dispatch_queue *)v3;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __28__CUIRuntimeStatistics_init__block_invoke;
  handler[3] = &unk_1E41AB448;
  handler[4] = v2;
  notify_register_dispatch("com.apple.coreui.statistics", &v2->_notify_token, v3, handler);
  return v2;
}

void __28__CUIRuntimeStatistics_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  -[CUIRuntimeStatistics _logStatistics:](*(unint64_t **)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
}

- (void)_logStatistics:(uint64_t)a3
{
  uint64_t v9;

  if (a1)
  {
    atomic_load(a1 + 1);
    v9 = atomic_load(a1 + 2);
    atomic_load(a1 + 3);
    atomic_load(a1 + 4);
    atomic_load(a1 + 6);
    atomic_load(a1 + 5);
    atomic_load(a1 + 7);
    _CUILog(2, (uint64_t)"CoreUI: Wasted Size: %lld/%lld=%.2f%% Short Circuit lookups: %lld/%lld=%.2f%% lookups:%lld probes:%lld Missed lookups %lld/%lld=%.2f%%\n", a3, a4, a5, a6, a7, a8, v9);
    atomic_store(0, a1 + 6);
    atomic_store(0, a1 + 5);
  }
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notify_token);
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)CUIRuntimeStatistics;
  -[CUIRuntimeStatistics dealloc](&v3, sel_dealloc);
}

+ (void)generateLog
{
  notify_post("com.apple.coreui.statistics");
}

- (int64_t)shortCircuitImageLookup
{
  return atomic_load((unint64_t *)&self->_shortCircuitImageLookup);
}

@end
