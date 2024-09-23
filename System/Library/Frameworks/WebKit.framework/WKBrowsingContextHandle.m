@implementation WKBrowsingContextHandle

- (id)_initWithPageProxy:(NakedRef<WebKit::WebPageProxy>)a3
{
  return -[WKBrowsingContextHandle _initWithPageProxyID:andWebPageID:](self, "_initWithPageProxyID:andWebPageID:", *(_QWORD *)(*((_QWORD *)a3.var0 + 4) + 744), *(_QWORD *)(*((_QWORD *)a3.var0 + 4) + 1896));
}

- (id)_initWithPage:(NakedRef<WebKit::WebPage>)a3
{
  return -[WKBrowsingContextHandle _initWithPageProxyID:andWebPageID:](self, "_initWithPageProxyID:andWebPageID:", *((_QWORD *)a3.var0 + 265), *((_QWORD *)a3.var0 + 5));
}

- (id)_initWithPageProxyID:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long long>)a3 :()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long long>)a4 :ObjectIdentifierMainThreadAccessTraits<uint64_t> :PageIdentifierType ObjectIdentifierMainThreadAccessTraits<uint64_t> :WebPageProxyIdentifierType andWebPageID:
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKBrowsingContextHandle;
  result = -[WKBrowsingContextHandle init](&v7, sel_init);
  if (result)
  {
    *((ObjectIdentifierGeneric<WebKit::WebPageProxyIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long> *)result
    + 1) = a3;
    *((ObjectIdentifierGeneric<WebCore::PageIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long> *)result
    + 2) = a4;
  }
  return result;
}

- (unint64_t)hash
{
  unint64_t m_identifier;
  unint64_t webPageID;
  unsigned int v4;
  int v6;
  __int16 v7;
  char v8;

  v7 = 0;
  v8 = 0;
  m_identifier = self->_pageProxyID.m_identifier;
  webPageID = self->_webPageID;
  v4 = (m_identifier >> 5) & 0x7FFF800 ^ (((unsigned __int16)m_identifier - 1640531527) << 16) ^ ((unsigned __int16)m_identifier - 1640531527);
  LODWORD(m_identifier) = (m_identifier >> 37) & 0x7FFF800 ^ ((v4 + WORD2(m_identifier) + (v4 >> 11)) << 16) ^ (v4 + WORD2(m_identifier) + (v4 >> 11));
  LODWORD(m_identifier) = (webPageID >> 5) & 0x7FFF800 ^ (((_DWORD)m_identifier
                                                                       + (unsigned __int16)webPageID
                                                                       + (m_identifier >> 11)) << 16) ^ (m_identifier + (unsigned __int16)webPageID + (m_identifier >> 11));
  LODWORD(m_identifier) = m_identifier + WORD2(webPageID) + (m_identifier >> 11);
  LODWORD(webPageID) = (webPageID >> 37) & 0x7FFF800 ^ ((_DWORD)m_identifier << 16);
  v6 = (webPageID ^ m_identifier) + ((webPageID ^ m_identifier) >> 11);
  return WTF::SuperFastHash::hash((WTF::SuperFastHash *)&v6);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_pageProxyID.m_identifier == *((_QWORD *)a3 + 1)
      && self->_webPageID == *((_QWORD *)a3 + 2);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_pageProxyID.m_identifier, CFSTR("pageProxyID"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_webPageID, CFSTR("webPageID"));
}

- (WKBrowsingContextHandle)initWithCoder:(id)a3
{
  return (WKBrowsingContextHandle *)-[WKBrowsingContextHandle _initWithPageProxyID:andWebPageID:](self, "_initWithPageProxyID:andWebPageID:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("pageProxyID")), objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("webPageID")));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[WKBrowsingContextHandle _initWithPageProxyID:andWebPageID:](+[WKBrowsingContextHandle allocWithZone:](WKBrowsingContextHandle, "allocWithZone:", a3), "_initWithPageProxyID:andWebPageID:", self->_pageProxyID.m_identifier, self->_webPageID);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; pageProxyID = %llu; webPageID = %llu>"),
               NSStringFromClass(v4),
               self,
               self->_pageProxyID.m_identifier,
               self->_webPageID);
}

- (ObjectIdentifierGeneric<WebKit::WebPageProxyIdentifierType,)_pageProxyID
{
  return self->_pageProxyID;
}

- (unint64_t)_webPageID
{
  return self->_webPageID;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
