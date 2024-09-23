@implementation __NSPlaceholderDate

- (__NSPlaceholderDate)init
{
  timespec __tp;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &__tp);
  return -[__NSPlaceholderDate initWithTimeIntervalSinceReferenceDate:](self, "initWithTimeIntervalSinceReferenceDate:", (double)__tp.tv_sec + -978307200.0 + (double)__tp.tv_nsec * 0.000000001);
}

- (__NSPlaceholderDate)initWithTimeIntervalSinceReferenceDate:(double)a3
{
  __NSPlaceholderDate *result;
  objc_class *v5;
  double v6;
  unint64_t v8;

  if (self != (__NSPlaceholderDate *)&___immutablePlaceholderDate)
    return 0;
  if (a3 == 6.3113904e10)
  {
    result = (__NSPlaceholderDate *)&_NSConstantDateDistantFuture;
    goto LABEL_7;
  }
  if (a3 == -6.31140768e10)
  {
    result = (__NSPlaceholderDate *)&_NSConstantDateDistantPast;
    goto LABEL_7;
  }
  if ((_NSDateTaggedPointersDisabled & 1) == 0)
  {
    v6 = a3;
    if (a3 == 0.0)
    {
LABEL_19:
      if (decodeTaggedTimeInterval(*(unint64_t *)&v6) != a3)
        -[__NSPlaceholderDate initWithTimeIntervalSinceReferenceDate:].cold.2();
      result = (__NSPlaceholderDate *)((8 * *(_QWORD *)&v6) | 0x8000000000000006);
      v8 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
      if ((~v8 & 0xC000000000000007) != 0)
        result = (__NSPlaceholderDate *)(v8 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v8 & 7)));
LABEL_7:
      if (result)
        return result;
      goto LABEL_8;
    }
    if (a3 == -0.0)
    {
      v6 = NAN;
      goto LABEL_19;
    }
    if (a3 == 0.0)
      -[__NSPlaceholderDate initWithTimeIntervalSinceReferenceDate:].cold.1();
    *(_QWORD *)&v6 = *(_QWORD *)&a3 & 0xFFFFFFFFFFFFFLL | (*(_QWORD *)&a3 >> 63 << 59) | ((unint64_t)(((*(_QWORD *)&a3 >> 52) + 17) & 0x7F) << 52);
    if (((uint64_t)((unint64_t)((*(_QWORD *)&a3 >> 52) + 17) << 57) >> 57) + 1007 == ((*(_QWORD *)&a3 >> 52) & 0x7FFLL)
      && *(_QWORD *)&v6 != 0)
    {
      goto LABEL_19;
    }
  }
LABEL_8:
  v5 = (objc_class *)objc_opt_self();
  result = (__NSPlaceholderDate *)__CFAllocateObject(v5, 0);
  *(double *)&result[1].super.super.isa = a3;
  return result;
}

+ (void)initialize
{
  if (initialize_static_init != -1)
    dispatch_once(&initialize_static_init, &__block_literal_global_27);
}

- (unint64_t)retainCount
{
  return -1;
}

- (double)timeIntervalSinceReferenceDate
{
  objc_class *v4;
  uint64_t v5;
  NSException *v6;

  v4 = __CFLookUpClass("NSDate");
  v5 = __CFFullMethodName(v4, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized date object"), v5);
  v6 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v6);
}

- (void)initWithTimeIntervalSinceReferenceDate:.cold.1()
{
  __assert_rtn("encodeTaggedTimeInterval", "NSDate.m", 204, "timeInterval != 0");
}

- (void)initWithTimeIntervalSinceReferenceDate:.cold.2()
{
  __assert_rtn("__NSTaggedDate_new", "NSDate.m", 268, "ti == decodeTaggedTimeInterval(encodedBits)");
}

@end
