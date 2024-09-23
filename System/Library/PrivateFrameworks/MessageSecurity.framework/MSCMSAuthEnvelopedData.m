@implementation MSCMSAuthEnvelopedData

- (NSData)dataContent
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent);
  swift_beginAccess();
  v4 = *v2;
  v3 = v2[1];
  sub_1DEF03944(v4, v3);
  v5 = (void *)sub_1DEF144DC();
  sub_1DEF03824(v4, v3);
  return (NSData *)v5;
}

- (void)setDataContent:(id)a3
{
  id v4;
  MSCMSAuthEnvelopedData *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;

  v4 = a3;
  v5 = self;
  v6 = sub_1DEF144F4();
  v8 = v7;

  v9 = (uint64_t *)((char *)v5 + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent);
  swift_beginAccess();
  v10 = *v9;
  v11 = v9[1];
  *v9 = v6;
  v9[1] = v8;
  sub_1DEF03824(v10, v11);

}

- (NSArray)recipients
{
  return (NSArray *)sub_1DEF03C54((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___MSCMSAuthEnvelopedData_recipients, &qword_1F0461D18);
}

- (void)setRecipients:(id)a3
{
  sub_1DEF03D00((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &qword_1F0461D18, (uint64_t)off_1EA960110, &OBJC_IVAR___MSCMSAuthEnvelopedData_recipients);
}

- (MSOID)encryptionAlgorithm
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
  swift_beginAccess();
  return (MSOID *)*v2;
}

- (void)setEncryptionAlgorithm:(id)a3
{
  sub_1DEF05004((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
}

- (NSArray)protectedAttributes
{
  return (NSArray *)sub_1DEF03C54((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes, &qword_1F0461D10);
}

- (void)setProtectedAttributes:(id)a3
{
  sub_1DEF03D00((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &qword_1F0461D10, (uint64_t)off_1EA9600C0, &OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes);
}

- (NSArray)unprotectedAttributes
{
  return (NSArray *)sub_1DEF03C54((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes, &qword_1F0461D10);
}

- (void)setUnprotectedAttributes:(id)a3
{
  sub_1DEF03D00((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &qword_1F0461D10, (uint64_t)off_1EA9600C0, &OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes);
}

- (NSArray)originatorCertificates
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for SecCertificate();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DEF1456C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setOriginatorCertificates:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for SecCertificate();
  v4 = sub_1DEF14578();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (MSOID)contentType
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
  swift_beginAccess();
  return (MSOID *)*v2;
}

- (void)setContentType:(id)a3
{
  sub_1DEF05004((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
}

- (MSCMSMessage)embeddedContent
{
  swift_beginAccess();
  return (MSCMSMessage *)(id)swift_unknownObjectRetain();
}

- (void)setEmbeddedContent:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (MSCMSAuthEnvelopedData)initWithEncryptionAlgorithm:(id)a3
{
  id v3;
  MSCMSAuthEnvelopedData *v4;

  v3 = a3;
  v4 = (MSCMSAuthEnvelopedData *)sub_1DEF083E4(v3);

  return v4;
}

- (MSCMSAuthEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  MSCMSAuthEnvelopedData *v10;

  v5 = a3;
  v6 = a4;
  v7 = sub_1DEF144F4();
  v9 = v8;

  v10 = (MSCMSAuthEnvelopedData *)sub_1DEF0854C(v7, v9, v6);
  sub_1DEF03824(v7, v9);
  return v10;
}

- (MSCMSAuthEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  MSCMSAuthEnvelopedData *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_1DEF144F4();
  v12 = v11;

  v13 = (MSCMSAuthEnvelopedData *)sub_1DEF08810(v10, v12, a4, v9);
  sub_1DEF03824(v10, v12);
  return v13;
}

- (MSCMSAuthEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4
{
  id v7;
  id v8;
  id v9;
  MSCMSAuthEnvelopedData *v10;

  sub_1DEF14530();
  swift_unknownObjectRetain();
  v7 = a4;
  sub_1DEF14524();
  swift_bridgeObjectRelease();
  sub_1DEF1453C();
  v8 = objc_allocWithZone((Class)MSOID);
  v9 = sub_1DEF07CE4();
  v10 = -[MSCMSAuthEnvelopedData initWithEmbeddedContent:recipient:encryptionAlgorithm:](self, sel_initWithEmbeddedContent_recipient_encryptionAlgorithm_, a3, v7, v9);

  swift_unknownObjectRelease();
  return v10;
}

- (MSCMSAuthEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5
{
  id v8;
  id v9;
  MSCMSAuthEnvelopedData *v10;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = a5;
  v10 = (MSCMSAuthEnvelopedData *)sub_1DEF08A4C(a3, v8, v9);
  swift_unknownObjectRelease();

  return v10;
}

- (void)addRecipient:(id)a3
{
  sub_1DEF04EEC((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___MSCMSAuthEnvelopedData_recipients);
}

- (id)getAttributesWithOID:(id)a3
{
  MSOID *v4;
  MSCMSAuthEnvelopedData *v5;
  unint64_t v6;
  void *v7;

  v4 = (MSOID *)a3;
  v5 = self;
  v6 = (unint64_t)MSCMSAuthEnvelopedData.getAttributes(OID:)(v4);

  if (v6)
  {
    sub_1DEF0B51C(0, &qword_1F0461D10);
    v7 = (void *)sub_1DEF1456C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)addProtectedAttribute:(id)a3
{
  sub_1DEF04EEC((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes);
}

- (void)addUnprotectedAttribute:(id)a3
{
  sub_1DEF04EEC((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes);
}

- (void)setContentTypeWithType:(id)a3
{
  sub_1DEF05004((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  MSCMSAuthEnvelopedData *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = self;
  v4 = MSCMSAuthEnvelopedData.encodeMessageSecurityObject()();
  v6 = v5;

  v7 = (void *)sub_1DEF144DC();
  sub_1DEF03824(v4, v6);
  return v7;
}

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)sub_1DEF098A0(v6, (uint64_t)a4);

  return v8;
}

- (id)type
{
  MSCMSAuthEnvelopedData *v3;
  id v4;
  id v5;

  sub_1DEF14530();
  v3 = self;
  sub_1DEF14524();
  swift_bridgeObjectRelease();
  sub_1DEF1453C();
  v4 = objc_allocWithZone((Class)MSOID);
  v5 = sub_1DEF07CE4();

  return v5;
}

- (MSCMSAuthEnvelopedData)init
{
  MSCMSAuthEnvelopedData *result;

  result = (MSCMSAuthEnvelopedData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEF03824(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent), *(_QWORD *)&self->dataContent[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  sub_1DEF03824(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent), *(_QWORD *)&self->dataContent[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent]);
}

@end
