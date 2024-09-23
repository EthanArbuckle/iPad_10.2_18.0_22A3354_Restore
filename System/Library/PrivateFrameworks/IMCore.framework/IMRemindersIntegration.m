@implementation IMRemindersIntegration

+ (void)notifyInteractionWithPeople:(id)a3
{
  id v3;

  v3 = a3;
  if (!qword_1EE65F338)
    qword_1EE65F338 = MEMORY[0x1A858292C](CFSTR("REMStore"), CFSTR("ReminderKit"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)qword_1EE65F338, "notifyOfInteractionWithPeople:", v3);

}

@end
