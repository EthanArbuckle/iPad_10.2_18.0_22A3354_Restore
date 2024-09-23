@implementation CreateContactView.ContactViewDelegate

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  return 1;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6;
  id v7;
  _TtCV14FamilyCircleUI17CreateContactView19ContactViewDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_20DEC44FC(v6, (uint64_t)a4);

}

- (_TtCV14FamilyCircleUI17CreateContactView19ContactViewDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CreateContactView.ContactViewDelegate();
  return -[CreateContactView.ContactViewDelegate init](&v3, sel_init);
}

@end
