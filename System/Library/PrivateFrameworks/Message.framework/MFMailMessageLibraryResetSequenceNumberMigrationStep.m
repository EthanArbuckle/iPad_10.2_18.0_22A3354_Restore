@implementation MFMailMessageLibraryResetSequenceNumberMigrationStep

+ (int)runWithConnection:(id)a3
{
  return objc_msgSend(a3, "executeStatementString:errorMessage:", CFSTR("UPDATE messages SET sequence_identifier = 0"), CFSTR("Reset sequence_identifier for messages")) ^ 1;
}

@end
