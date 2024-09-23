@implementation ATXScoreLogSerialization

+ (void)writeObject:(id)a3 toFile:(__sFILE *)a4
{
  objc_msgSend(a3, "atx_writeToFile:", a4);
}

@end
