@implementation _PADAuditDataRepository

- (_PADAuditDataRepository)init
{
  _PADAuditDataRepository *v2;
  _TtC10CoreIDVPAD30PADInternalAuditDataRepository *v3;
  _TtC10CoreIDVPAD30PADInternalAuditDataRepository *auditDataRepository;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PADAuditDataRepository;
  v2 = -[_PADAuditDataRepository init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10CoreIDVPAD30PADInternalAuditDataRepository);
    auditDataRepository = v2->_auditDataRepository;
    v2->_auditDataRepository = v3;

  }
  return v2;
}

- (void)storeClassifierResult:(id)a3 imageData:(id)a4 signature:(id)a5 flags:(id)a6
{
  -[PADInternalAuditDataRepository storeClassifierResult:imageData:](self->_auditDataRepository, "storeClassifierResult:imageData:", a3, a4, a5, a6);
}

- (void)storeUnencryptedVideoFrom:(id)a3
{
  -[PADInternalAuditDataRepository storeUnencryptedVideoFrom:](self->_auditDataRepository, "storeUnencryptedVideoFrom:", a3);
}

- (void)storePRDBuffer:(__CVBuffer *)a3 name:(id)a4
{
  -[PADInternalAuditDataRepository storePRDBuffer:name:](self->_auditDataRepository, "storePRDBuffer:name:", a3, a4);
}

- (void)storeFACPoseBuffer:(__CVBuffer *)a3 identifier:(id)a4 values:(id)a5
{
  -[PADInternalAuditDataRepository storeFACPoseBuffer:identifier:values:](self->_auditDataRepository, "storeFACPoseBuffer:identifier:values:", a3, a4, a5);
}

- (void)storeTAValues:(id)a3
{
  -[PADInternalAuditDataRepository storeTAValues:](self->_auditDataRepository, "storeTAValues:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditDataRepository, 0);
}

@end
