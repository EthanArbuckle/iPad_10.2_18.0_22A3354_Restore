@implementation _CDEventDictsForContactsState

- (id)initWithMngr:(void *)a3 me:(void *)a4 relationshipContacts:(void *)a5 avgOfAllCalls:(void *)a6 emergencyFamilyContacts:(void *)a7 emergencyContacts:(void *)a8 contactParents:(void *)a9 photosContactIds:(void *)a10 fmfContactsFollowingMyLocation:(void *)a11 fmfContactsSharingLocationsWithMe:(void *)a12 airDropDict:(void *)a13 airDropDictAtHome:(void *)a14 homeContacts:
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  objc_super v65;

  v61 = a2;
  v57 = a3;
  v60 = a3;
  v21 = a4;
  v59 = a5;
  v64 = a6;
  v22 = a7;
  v23 = a8;
  v58 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v27 = a13;
  v28 = a14;
  v62 = v22;
  v63 = v21;
  if (a1
    && (v65.receiver = a1,
        v65.super_class = (Class)_CDEventDictsForContactsState,
        v29 = (id *)objc_msgSendSuper2(&v65, sel_init),
        (a1 = v29) != 0))
  {
    objc_storeStrong(v29 + 1, a2);
    objc_storeStrong(a1 + 2, v57);
    v30 = objc_msgSend(v21, "copy");
    v31 = a1[3];
    a1[3] = (id)v30;

    objc_storeStrong(a1 + 4, a5);
    v32 = objc_msgSend(v64, "copy");
    v33 = a1[5];
    a1[5] = (id)v32;

    v34 = objc_msgSend(v22, "copy");
    v35 = a1[6];
    a1[6] = (id)v34;

    v36 = objc_msgSend(v23, "copy");
    v37 = a1[7];
    a1[7] = (id)v36;

    v38 = v58;
    v39 = objc_msgSend(v58, "copy");
    v40 = a1[8];
    a1[8] = (id)v39;

    v41 = objc_msgSend(v24, "copy");
    v42 = a1[9];
    a1[9] = (id)v41;

    v43 = objc_msgSend(v25, "copy");
    v44 = a1[10];
    a1[10] = (id)v43;

    v45 = objc_msgSend(v26, "copy");
    v46 = a1[11];
    a1[11] = (id)v45;

    v47 = objc_msgSend(v27, "copy");
    v48 = a1[12];
    a1[12] = (id)v47;

    v49 = objc_msgSend(v28, "copy");
    v50 = a1[13];
    a1[13] = (id)v49;

    v51 = v28;
    v52 = v60;
    v53 = v61;
    v54 = v59;
  }
  else
  {
    v51 = v28;
    v52 = v60;
    v53 = v61;
    v38 = v58;
    v54 = v59;
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeContacts, 0);
  objc_storeStrong((id *)&self->_airDropDictAtHome, 0);
  objc_storeStrong((id *)&self->_airDropDict, 0);
  objc_storeStrong((id *)&self->_fmfContactsSharingLocationsWithMe, 0);
  objc_storeStrong((id *)&self->_fmfContactsFollowingMyLocation, 0);
  objc_storeStrong((id *)&self->_photosContactIds, 0);
  objc_storeStrong((id *)&self->_contactParents, 0);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_emergencyFamilyContacts, 0);
  objc_storeStrong((id *)&self->_avgOfAllCalls, 0);
  objc_storeStrong((id *)&self->_relationshipContacts, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_mngr, 0);
}

@end
