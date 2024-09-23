@implementation NSUserActivity(IntentsDeprecated)

+ (uint64_t)deleteAllInteractions
{
  return +[INInteraction deleteAllInteractionsWithCompletion:](INInteraction, "deleteAllInteractionsWithCompletion:", 0);
}

+ (uint64_t)deleteInteractionsWithIdentifiers:()IntentsDeprecated
{
  return +[INInteraction deleteInteractionsWithIdentifiers:completion:](INInteraction, "deleteInteractionsWithIdentifiers:completion:", a3, 0);
}

+ (uint64_t)deleteInteractionsWithGroupIdentifier:()IntentsDeprecated
{
  return +[INInteraction deleteInteractionsWithGroupIdentifier:completion:](INInteraction, "deleteInteractionsWithGroupIdentifier:completion:", a3, 0);
}

@end
