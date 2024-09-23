@implementation WKDOMText

- (NSString)data
{
  Node *m_ptr;

  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 14) & 2) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1972EEB30);
  }
  if (*((_QWORD *)m_ptr + 10))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setData:(id)a3
{
  Node *m_ptr;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 14) & 2) != 0)
  {
    MEMORY[0x19AEABCC8](&v6, a3);
    WebCore::CharacterData::setData((WebCore::CharacterData *)m_ptr, (const WTF::String *)&v6);
    v5 = v6;
    v6 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
        WTF::StringImpl::destroy(v5, v4);
      else
        *(_DWORD *)v5 -= 2;
    }
  }
  else
  {
    __break(0xC471u);
  }
}

@end
