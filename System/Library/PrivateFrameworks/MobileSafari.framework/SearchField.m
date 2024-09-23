@implementation SearchField

- (BOOL)isHighlighted
{
  return sub_18BA56298(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for SearchField);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_18BA562EC(self, (uint64_t)a2, a3, (uint64_t (*)(_QWORD))type metadata accessor for SearchField, &OBJC_IVAR____TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField_isHighlightedDidChange);
}

- (id)_placeholderColor
{
  return objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
}

- (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField *)sub_18BA563CC((char *)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, &OBJC_IVAR____TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField_isHighlightedDidChange, (uint64_t)CGRectMake, (uint64_t (*)(_QWORD))type metadata accessor for SearchField);
}

- (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField)initWithCoder:(id)a3
{
  return (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField *)sub_18BA56464((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField_isHighlightedDidChange, (uint64_t)CGRectMake, (uint64_t (*)(_QWORD))type metadata accessor for SearchField);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
