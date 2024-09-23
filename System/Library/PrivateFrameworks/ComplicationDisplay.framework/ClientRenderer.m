@implementation ClientRenderer

void __23___ClientRenderer_init__block_invoke(uint64_t a1, double a2, double a3)
{
  dispatch_semaphore_t *WeakRetained;
  dispatch_semaphore_t *v6;

  WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    -[dispatch_semaphore_t _handleRenderStatsTime:cost:](WeakRetained, "_handleRenderStatsTime:cost:", a2, a3);
    dispatch_semaphore_signal(v6[4]);
    WeakRetained = v6;
  }

}

@end
