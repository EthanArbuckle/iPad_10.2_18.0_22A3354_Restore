@implementation SecRandomCopyBytesHelper

+ (int)copyBytes:(void *)a3 withLength:(unint64_t)a4
{
  return SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], a4, a3);
}

@end
