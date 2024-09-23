@implementation ConfigChangeLogs

+ (id)configChangeLogFiles
{
  return (id)MEMORY[0x24BEDD108](ConfigChangeLogs, sel_configChangeLogFilesIncludingAllKeys_orSpecificKeys_, 0);
}

+ (id)configChangeLogFilesIncludingAllKeys:(BOOL)a3 orSpecificKeys:(id)a4
{
  return (id)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, a3, a4);
}

+ (int)writeConfigChangeLog:(_BaseStation *)a3
{
  if (a3)
    return 0;
  else
    return -6705;
}

@end
