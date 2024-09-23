@implementation AFConnectionAvailabilityObserver

- (void)networkAvailability:(id)a3 isAvailable:(BOOL)a4
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_31);
}

void __68__AFConnectionAvailabilityObserver_networkAvailability_isAvailable___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("AFNetworkAvailabilityDidChangeNotification"), 0);

}

@end
