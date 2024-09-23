@implementation _NSCalendarBridge

- (id)components:(unint64_t)a3 fromDate:(id)a4
{
  if (a4)
    return -[_NSCalendarBridge _components:fromDate:](self, "_components:fromDate:", a3);
  else
    return 0;
}

- (id)dateFromComponents:(id)a3
{
  if (a3)
    return -[_NSCalendarBridge _dateFromComponents:](self, "_dateFromComponents:");
  else
    return 0;
}

- (_NSCalendarBridge)initWithCalendarIdentifier:(id)a3
{
  if (_NSIsNSString())
    return -[_NSCalendarBridge initWithCheckedCalendarIdentifier:](self, "initWithCheckedCalendarIdentifier:", a3);
  else
    return 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91___NSCalendarBridge_enumerateDatesStartingAfterDate_matchingComponents_options_usingBlock___block_invoke;
    v6[3] = &unk_1E0F4CCE0;
    v6[4] = a6;
    -[_NSCalendarBridge _enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:](self, "_enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:", a3, a4, a5, v6);
  }
}

- (void)_enumerateDatesStartingAfterDate:(id)a3 matchingComponents:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  objc_class *v8;

  v8 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v8);
}

- (id)componentsInTimeZone:(id)a3 fromDate:(id)a4
{
  if (!a3)
  {
    a3 = (id)-[_NSCalendarBridge timeZone](self, "timeZone");
    if (!a3)
      a3 = (id)objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  }
  return -[_NSCalendarBridge _componentsInTimeZone:fromDate:](self, "_componentsInTimeZone:fromDate:", a3, a4);
}

- (id)_componentsInTimeZone:(id)a3 fromDate:(id)a4
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)_components:(unint64_t)a3 fromDate:(id)a4
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)_dateFromComponents:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end
