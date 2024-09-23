@implementation EDAddUnsubscribeFlagsStep

+ (int)runWithConnection:(id)a3
{
  return objc_msgSend(a3, "executeStatementString:errorMessage:", CFSTR("ALTER TABLE messages ADD COLUMN unsubscribe_type INTEGER;"),
           CFSTR("Unable to add unsubscribeFlags column to threads")) ^ 1;
}

@end
