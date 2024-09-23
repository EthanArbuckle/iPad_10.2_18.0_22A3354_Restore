@implementation WDCancellationToken

- (BOOL)isCancelled
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  self->_cancelled = a3;
}

- (void)cancel
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[WDCancellationToken setCancelled:](self, "setCancelled:", 1);
}

@end
