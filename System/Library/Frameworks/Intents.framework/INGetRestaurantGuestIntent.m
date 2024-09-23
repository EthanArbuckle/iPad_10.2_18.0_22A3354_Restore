@implementation INGetRestaurantGuestIntent

+ (id)intentDescription
{
  return -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:]([INIntentDescription alloc], "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("GetRestaurantGuestIntent"), CFSTR("GetRestaurantGuestIntentResponse"), objc_opt_class(), 0, 0, 0, sel_handleGetRestaurantGuest_completion_, sel_confirmGetRestaurantGuest_completion_, 0);
}

@end
